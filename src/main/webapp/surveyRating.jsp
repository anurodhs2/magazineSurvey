<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
<%@ page import="com.magazineSurvey.AppConstants.AppConstants" %>
<%@ page import="com.magazineSurvey.db.DbConnectionManager" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<%
try {
	    Connection conn = DbConnectionManager.getConnection();
        String query = "SELECT rating, COUNT(*) AS count FROM magazine_survey GROUP BY rating ORDER BY rating";
        PreparedStatement prepareStatement = conn.prepareStatement(query);
        ResultSet resultSet = prepareStatement.executeQuery();

        List<Map<String, Object>> data = new ArrayList<>();
        List<String> chartColor = new ArrayList<>();
        
        for(int i=0; i<4; i++){
            Map<String, Object> entry = new HashMap<>();
            entry.put("rating", AppConstants.RATINGS[i]);
            entry.put("count", 0);
            chartColor.add(AppConstants.RATING_COLORS[i]);
            data.add(entry);
        }

        while (resultSet.next()) {
            Map<String, Object> entry = new HashMap<>();
            int rating = Integer.parseInt(resultSet.getString("rating"));
            entry.put("rating", AppConstants.RATINGS[rating]);
            entry.put("count", resultSet.getInt("count"));
            data.set(rating, entry);
        }

        conn.close();
        request.setAttribute("chartData", new Gson().toJson(data));
        request.setAttribute("chartColors", new Gson().toJson(chartColor));
    } catch (Exception e) {
        e.printStackTrace();
    }
%> 
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Magazine Survey Rating</title>
	    <link rel="stylesheet" type="text/css" href="surveyRating.css">
	</head>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	</head>
	<body>
	    <h2>Magazine Survey Rating</h2>
	    <div class=chart>
	    	<canvas id="ratingChart" width="600" height="600"></canvas>
	    </div>
	    <script>
	        var chartData = ${chartData};
	        var chartColors = ${chartColors};
	        var ctx = document.getElementById('ratingChart').getContext('2d');
	        var myPieChart = new Chart(ctx, {
	            type: 'pie',
	            data: {
	                labels: chartData.map(entry => entry.rating),
	                datasets: [{
	                    data: chartData.map(entry => entry.count),
	                    backgroundColor: chartColors,
	                }]
	            }
	        });
	    </script>
	</body>
</html>