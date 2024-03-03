<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Review Form</title>
    <link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
    <div class="form-container">
        <h2>Magazine Survey</h2>
        <form action="submitSurvey" method="post">
            <label for="firstName">First Name:</label>
            <input type="text" name="firstName" required onkeydown="return /[a-zA-Z]/i.test(event.key)"><br>
 
            <label for="lastName">Last Name:</label>
            <input type="text" name="lastName" required onkeydown="return /[a-zA-Z]/i.test(event.key)"><br>
 
            <label for="gender">Gender:</label>
            <select name="gender" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select><br>
 
            <label for="age">Age:</label>
            <input type="number" name="age" required max="100" min="1"><br>
 
            <label for="rating">Rating:</label>
            <select name="rating" required>
                <option value="" disabled selected>Select Rating</option>
                <option value="3">Like the magazine</option>
                <option value="2">Moderate</option>
                <option value="1">Not Like</option>
                <option value="0">Not Aware (None of the above)</option>
            </select><br>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>