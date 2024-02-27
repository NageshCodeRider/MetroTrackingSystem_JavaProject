<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.math.BigDecimal, java.util.ArrayList, java.util.List" %>
<%@ page import="admin.Ticket" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Ticket> tickets = new ArrayList<>();
    BigDecimal totalAmount = BigDecimal.valueOf(0);

    Connection connection = null;

    try {
        // Establish the database connection
        Class.forName("com.mysql.jdbc.Driver");
        String jdbcUrl = "jdbc:mysql://localhost:3306/metro-ticket";
        String jdbcUser = "root";
        String jdbcPassword = "";
        connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM ticket_history");

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String sourceStation = resultSet.getString("source_station");
            String destinationStation = resultSet.getString("destination_station");
            String ticketType = resultSet.getString("ticket_type");
            int quantity = resultSet.getInt("quantity");
            double ticketAmount = resultSet.getDouble("total_amount");
            Timestamp bookingDate = resultSet.getTimestamp("booking_date");

            Ticket ticket = new Ticket(id, sourceStation, destinationStation, ticketType, quantity, ticketAmount, bookingDate);
            tickets.add(ticket);

            totalAmount = totalAmount.add(BigDecimal.valueOf(ticketAmount));
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ridership and Revenue Chart</title>

    <!-- Include Chart.js library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0px;
            text-align: center; /* Center align content */
        }

        h1 {
            color: #333;
            font-size: 40px;
        }

        canvas {
            display: block;
            margin: 0 auto;
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
    <h1>Ridership and Revenue Chart</h1>

    <canvas id="chart"></canvas>

    <script>
        // Data for the chart
        var data = {
            labels: ["PCMC", "KASARWADI", "PHUGEWADI", "SANT TUKARAM NAGAR", "SHIVAJI NAGAR", "NASHIK PHATA"],
            datasets: [{
                label: 'Number of Tickets Sold',
                data: [1, 4, 3, 15, 3, 2], // Replace with your actual data
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        };

        // Chart configuration
        var options = {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        };

        // Get the context of the canvas element
        var ctx = document.getElementById('chart').getContext('2d');

        // Create a bar chart
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: options
        });
    </script>
</body>
</html>
