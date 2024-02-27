<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Show User Data</title>
     <style>
        body {
             font-family: Tahoma, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border-radius: 50px; /* er-radius property */
        }

        th, td {
            border-radius: 15px;
            padding: 12px;
            border: 1px solid #f4f4f4;
            text-align: center;
        }

        th {
            background-color: #BB75D0;
            color: #fff;
        }

        tr:hover {
             background-color: #D7AEE3;
        }

        header {
          background-color: #ECF3F9;
            color: white;
            text-align: center;
            padding: 1em 0;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo-text {
            margin-left: 10px; /* Adjust as needed */
            font-size: 18px; /* Adjust as needed */
            font-weight: bold;
            color: rgb(0, 0, 0);
            margin-right: auto;
        }

        nav img {
            height: 55px; /* Adjust as needed */
            width: 60px;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
        }

        nav a {
            text-decoration: none;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-size: 16px;
             transition: color 0.3s ease-in-out;
            border-radius: 5px; /* Add border-radius property */
        }

        nav a:hover {
           color: #BB75D0;
        }
        .header-title {
    margin: 20px;
    color: #333;
    text-align:center;
}
    </style>
</head>
<body>
   <header>
        <nav>
            <div class="logo-container">
                <img src="logo.png" alt="Logo">
                <span class="logo-text">Metro Tracking System</span>
            </div>
           <ul>
                <li><a href="Bookingticket.jsp">Booking Ticket</a></li>
                <li><a href="Purpleline.html">Tracking Metro</a></li>
                <li><a href="homepage.jsp">Home</a></li>
            </ul>
        </nav>
    </header>
    <h1 class="header-title">Profile</h1>
<%
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/user-registration";
    String user = "root";
    String password = "";

    Connection conn = null;
    PreparedStatement statement = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // Get the username from the session
        String currentUser = (String) session.getAttribute("username");

        // Query to retrieve data for the specific user
        String sql = "SELECT * FROM user WHERE name = ?";
        statement = conn.prepareStatement(sql);
        statement.setString(1, currentUser);

        rs = statement.executeQuery();

        %>
      <table border="1" class="table-no-border">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Gender</th>
        </tr>
            <%
            // Display user information
            while (rs.next()) {
                %>
                <tr>
                    
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("mobile") %></td>
                    <td><%= rs.getString("gender") %></td>
                </tr>
                <%
            }
            %>
        </table>
        <%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources in the finally block
        if (rs != null) rs.close();
        if (statement != null) statement.close();
        if (conn != null) conn.close();
    }
%>

</body>
</html>
