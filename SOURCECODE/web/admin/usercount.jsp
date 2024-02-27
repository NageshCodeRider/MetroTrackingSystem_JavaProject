<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Total Users</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #141E46;
            color: white;
            padding: 20px 20px;
            box-sizing: border-box;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo-container img {
            height: 40px; /* Adjust as needed */
            width: 40px; /* Adjust as needed */
            margin-right: 10px;
        }

        .logo-text {
            font-size: 18px;
            font-weight: bold;
            color: white;
        }

        ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
        }

        ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s ease-in-out;
        }

        ul li a:hover {
            color: #C70039;
        }
        
        #counter-container {
            text-align: center;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            background-color: #FF6969;
            color: white;
        }

        #counter {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        #header {
            color: white;
            font-size: 24px;
            margin-bottom: 10px;
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
                <li><a href="adminprofile.jsp">Profile</a></li>
                <li><a href="Totalamount.jsp">Total Amount</a></li>
                <li><a href="Userdata.jsp">Search User</a></li>
                <li><a href="complaints.jsp">User Complaints</a></li>
                <li><a href="displayFeedback.jsp">User Feedback</a></li>
                <li><a href="usercount.jsp">Live User Count</a></li>
                <li><a href="adminhomepage.jsp">Home</a></li>
            </ul>
        </nav>
    </header>
<%
    // Database connection code (replace with your actual database connection logic)
    String jdbcUrl = "jdbc:mysql://localhost:3306/user-registration";
    String dbUser = "root";
    String dbPassword = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Query to get the total number of users
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) AS totalUsers FROM user");

        int totalUsers = 0;
        if (resultSet.next()) {
            totalUsers = resultSet.getInt("totalUsers");
        }

        resultSet.close();
        statement.close();
        connection.close();

        // Display the header and the total number of users inside the styled container
        out.println("<div id='counter-container'>");
        out.println("<h2 id='header'>User Statistics accordingly to the Database</h2>");
        out.println("<h2 id='counter'>Total Users: " + totalUsers + "</h2>");
        out.println("</div>");

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>
