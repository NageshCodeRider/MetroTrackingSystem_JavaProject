<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="admin.FeedbackDAO" %>
<%@ page import="admin.Feedback" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Feedback Table</title>
    <style>
    body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0px;
            text-align: center;
        }

        h2 {
            color: #333;
            font-size: 40px;
        }

        table {
            border-collapse: collapse;
            width: 70%;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
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
       

        #content h2 {
            color: gray;
            margin: 20px;
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
    <h2>Feedback Table</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Message</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Feedback> feedbackList = FeedbackDAO.getAllFeedback(); // Replace with your DAO method
                for (Feedback feedback : feedbackList) {
            %>
                <tr>
                    <td><%= feedback.getId() %></td>
                    <td><%= feedback.getMessage() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>
