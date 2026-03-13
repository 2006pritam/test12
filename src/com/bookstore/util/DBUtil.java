package com.bookstore.util;



import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

    private static final String URL =
            "jdbc:mysql://localhost:3306/bookstore?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "pritam@2006";

    public static Connection getConnection() throws Exception {

        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Create and return connection
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

