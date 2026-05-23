package com.college.util;

import java.sql.*;

public class DBConnection {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
            	    "jdbc:mysql://localhost:3306/college",
            	    "root",
            	    "Rushi@1234"
            	);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}