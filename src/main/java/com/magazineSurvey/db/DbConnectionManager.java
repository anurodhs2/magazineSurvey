package com.magazineSurvey.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnectionManager {

   private static final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
   private static final String JDBC_URL = "jdbc:mysql://localhost:3306/magazine";
   private static final String USERNAME = "root";
   private static final String PASSWORD = "Anurodh@s2";

   static {
       try {
           Class.forName(DRIVER_NAME);
       } catch (ClassNotFoundException e) {
           e.printStackTrace(); // Handle the exception appropriately
       }
   }

   public static Connection getConnection() throws SQLException {
	   String url = JDBC_URL;
	   String username = USERNAME;
	   String password = PASSWORD;

	   System.out.print("url  " + url);
       return DriverManager.getConnection(url, username, password);
   }
}