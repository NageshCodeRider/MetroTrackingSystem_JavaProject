<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String feedbackMessage = request.getParameter("feedback");

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Establish a database connection
        Class.forName("com.mysql.jdbc.Driver"); // Update with your database driver
        String jdbcUrl = "jdbc:mysql://localhost:3306/user-feedback";
        String dbUsername = "root";
        String dbPassword = "";
        connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        // Insert feedback into the database
        String sql = "INSERT INTO feedback (message) VALUES (?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, feedbackMessage);
        preparedStatement.executeUpdate();

        // Send a response back to the client
        response.getWriter().write("Thank you for your feedback!");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
