<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ticket Booking History</title>
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
        }

        nav a:hover {
            color: #BB75D0;
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
<%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        // Replace with your database details
        String jdbcUrl = "jdbc:mysql://localhost:3306/metro-ticket";
        String dbUsername = "root";
        String dbPassword = "";

        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        statement = connection.createStatement();
        String query = "SELECT * FROM ticket_history";
        resultSet = statement.executeQuery(query);

        %>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Source Station</th>
                <th>Destination Station</th>
                <th>Ticket Type</th>
                <th>Quantity</th>
                <th>Total Amount</th>
                <th>Booking Date</th>
            </tr>
        <%
        while (resultSet.next()) {
            %>
            <tr>
                <td><%=resultSet.getInt("id")%></td>
                <td><%=resultSet.getString("source_station")%></td>
                <td><%=resultSet.getString("destination_station")%></td>
                <td><%=resultSet.getString("ticket_type")%></td>
                <td><%=resultSet.getInt("quantity")%></td>
                <td><%=resultSet.getDouble("total_amount")%></td>
                <td><%=resultSet.getTimestamp("booking_date")%></td>
            </tr>
            <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</table>
</body>
</html>
