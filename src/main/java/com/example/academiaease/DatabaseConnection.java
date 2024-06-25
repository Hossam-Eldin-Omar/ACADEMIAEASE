package com.example.academiaease;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String connectionString = "jdbc:sqlserver://DESKTOP-K2MCPUR;database=AcademiaProject;trustServerCertificate=true;integratedSecurity=true";
    public static Connection getConnection() throws SQLException {
        try{
            Connection connection = DriverManager.getConnection(connectionString);
            System.out.println("Connected to database");
            return connection;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
