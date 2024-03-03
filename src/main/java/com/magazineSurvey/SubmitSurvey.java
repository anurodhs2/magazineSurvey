package com.magazineSurvey;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.magazineSurvey.db.DbConnectionManager;

public class SubmitSurvey extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String first_name = request.getParameter("firstName");
        String last_name = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String rating = request.getParameter("rating");

        try {
            Connection conn = DbConnectionManager.getConnection();
            String query = "INSERT INTO magazine_survey (first_name, last_name, gender, age, rating) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, first_name);
            preparedStatement.setString(2, last_name);
            preparedStatement.setString(3, gender);
            preparedStatement.setString(4, age);
            preparedStatement.setString(5, rating);
            preparedStatement.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        response.sendRedirect("surveyRating.jsp");
    }
}