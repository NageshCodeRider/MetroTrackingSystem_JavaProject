<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
             text-align: center;
        }

      
        .container {
            width: 70%;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        h1 {
            
            text-align: center;
            margin-top: 0;
            padding: 20px;
           color: #333;
            font-size: 40px;
        }

        form {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #FFF5E0;
            border-radius: 20px;
        }

        label {
            margin-right: 10px;
        }

        input[type="text"] {
            padding: 8px 200px ;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 8px 90px;
            font-size: 16px;
            background-color: #C70039;
            color: white;
            border: none;
            cursor: pointer;
             border-radius: 8px;
            
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 12px;
        }

        th {
            background-color: #C70039;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
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
        <h1>User List</h1>
        <div class="container">
        <form action="" method="post">
            <label for="mobile">Search by Mobile:</label>
            <input type="text" id="mobile" name="mobile">
            <input type="submit" value="Search">
        </form>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Gender</th>
            </tr>

        <% 
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user-registration", "root", "");

                if (request.getParameter("mobile") != null) {
                    String searchMobile = request.getParameter("mobile");
                    String searchQuery = "SELECT * FROM user WHERE mobile LIKE ?";
                    
                    try (PreparedStatement searchStatement = connection.prepareStatement(searchQuery)) {
                        searchStatement.setString(1, "%" + searchMobile + "%");
                        resultSet = searchStatement.executeQuery();
                        
                        while (resultSet.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultSet.getInt("id") + "</td>");
                            out.println("<td>" + resultSet.getString("name") + "</td>");
                            out.println("<td>" + resultSet.getString("email") + "</td>");
                            out.println("<td>" + resultSet.getString("mobile") + "</td>");
                            out.println("<td>" + resultSet.getString("gender") + "</td>");
                            out.println("</tr>");
                        }
                    }
                } else {
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery("SELECT * FROM user");

                    while (resultSet.next()) {
                        out.println("<tr>");
                        out.println("<td>" + resultSet.getInt("id") + "</td>");
                        out.println("<td>" + resultSet.getString("name") + "</td>");
                        out.println("<td>" + resultSet.getString("email") + "</td>");
                        out.println("<td>" + resultSet.getString("mobile") + "</td>");
                        out.println("<td>" + resultSet.getString("gender") + "</td>");
                        out.println("</tr>");
                    }
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
    </div
</body>
</html>
