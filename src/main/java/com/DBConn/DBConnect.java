package com.DBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    // Database configuration
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Book"; // Replace with your DB URL
    private static final String JDBC_USERNAME = "root"; // Replace with your DB username
    private static final String JDBC_PASSWORD = "root"; // Replace with your DB password

    // Method to get a database connection
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Return a connection instance
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }
}
