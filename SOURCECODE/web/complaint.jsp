<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>

<%
    String message = request.getParameter("message");
    String subject = request.getParameter("subject");

    // Validate and store the complaint in the database
    if (message != null && !message.trim().isEmpty() && subject != null && !subject.trim().isEmpty()) {
        Connection connection = null;
        try {
            // Load the JDBC driver (replace "your_database_driver" with the actual driver)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database (replace "your_database_url", "your_username", and "your_password")
            String url = "jdbc:mysql://localhost:3306/user-complaint";
            String username = "root";
            String password = "";
            connection = DriverManager.getConnection(url, username, password);

            // Insert the complaint into the database
            String insertQuery = "INSERT INTO Complaints (message, subject) VALUES (?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setString(1, message);
                preparedStatement.setString(2, subject);
                preparedStatement.executeUpdate();
            }

            out.print("Complaint submitted successfully!");
        } catch (ClassNotFoundException | SQLException e) {
            out.print("Error submitting complaint: " + e.getMessage());
        } finally {
            // Close the database connection
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    } else {
        out.print("Invalid complaint!");
    }
%>
