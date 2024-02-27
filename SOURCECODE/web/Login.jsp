<%-- 
    Document   : Login
    Created on : 08-Nov-2023, 10:28:38 am
    Author     : NAGESH
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Validation</title>
</head>
<body>
    <%
        String mobile = request.getParameter("mobile");
        String username = "";

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/user-registration";
        String user = "root";
        String password = "";

        Connection conn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            // Query the database to retrieve the username for the provided mobile number
            String sql = "SELECT name FROM user WHERE mobile = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, mobile);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                username = rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

     if (!username.isEmpty()) {
    // Set username and additional information in the session
    session.setAttribute("username", username);

    // Check if the user is already logged in
    if (session.getAttribute("username") != null) {
        // If logged in, redirect to homepage.jsp
        response.sendRedirect("homepage.jsp");
    } else {
        // If not logged in, redirect to profilepage.jsp
        response.sendRedirect("myaccount.jsp");
    }
} else {
    %>
        <h2>Login Failed</h2>
        <p>The provided mobile number is not registered.</p>
    <%
        }
    %>
    
</body>
</html>