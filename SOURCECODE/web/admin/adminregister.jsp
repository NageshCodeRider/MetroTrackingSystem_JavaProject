<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin-registration", "root", "");

        PreparedStatement ps = con.prepareStatement("INSERT INTO admins (username, password) VALUES (?, ?)");
        ps.setString(1, username);
        ps.setString(2, password);

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("admin-success.jsp");
        } else {
            out.println("Registration failed. Please try again.");
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
