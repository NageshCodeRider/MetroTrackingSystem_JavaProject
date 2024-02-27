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
<html>
<head>
    <title>Ticket History</title>
    <style>
          body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
             text-align: center;
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
     table {
            border-collapse: collapse;
            width: 75%;
            margin: 0 auto; /* Center the table */
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
          h2 {
            text-align: center;
            color: #333; /* Adjust the color as needed */
            margin-top: 20px; /* Adjust the top margin as needed */
        }

        #totalAmount {
            text-align: center;
            color: #C70039; /* Adjust the color as needed */
            margin-top: 10px; /* Adjust the top margin as needed */
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
      <h2>Ticket History</h2>
   
      <h2>Total Amount: <%= totalAmount.setScale(2, BigDecimal.ROUND_HALF_UP) %></h2>

  

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

        <% for (Ticket ticket : tickets) { %>
            <tr>
                <td><%= ticket.getId() %></td>
                <td><%= ticket.getSourceStation() %></td>
                <td><%= ticket.getDestinationStation() %></td>
                <td><%= ticket.getTicketType() %></td>
                <td><%= ticket.getQuantity() %></td>
                <td><%= ticket.getTotalAmount() %></td>
                <td><%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(ticket.getBookingDate()) %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
