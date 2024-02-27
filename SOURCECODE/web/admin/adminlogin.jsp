<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin-registration", "root", "");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM admins WHERE username=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
         
            // Redirect to adminhomepage.jsp
            response.sendRedirect("adminhomepage.jsp");
        } else {
            out.println("Login failed. Please check your username and password.");
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
