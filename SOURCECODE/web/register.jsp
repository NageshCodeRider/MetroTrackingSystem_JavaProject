<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // Get user input from the HTML form
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    String gender = request.getParameter("gender");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/user-registration";
    String user = "root";
    String password = "";

    Connection conn = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // Insert user data into the database
        String sql = "INSERT INTO user (name, email, mobile, gender) VALUES (?, ?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, email);
        statement.setString(3, mobile);
        statement.setString(4, gender);
        statement.executeUpdate();

        // Redirect to a success page
        response.sendRedirect("registration-success.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        // Redirect to an error page
        response.sendRedirect("registration-error.jsp");
    } finally {
        if (conn != null) {
            conn.close();
        }
    }
%>
