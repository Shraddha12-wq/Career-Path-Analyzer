package com.career;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {
            // Driver load
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connection
            con = DriverManager.getConnection(
            	    "jdbc:mysql://localhost:3306/careers_db",
            	    "root",
            	    "Root@123s"
            	);

            System.out.println("✔ DB Connected Successfully");

        } catch (Exception e) {
            System.out.println("❌ DB Connection Failed");
            e.printStackTrace();
        }

        return con;
    }
}