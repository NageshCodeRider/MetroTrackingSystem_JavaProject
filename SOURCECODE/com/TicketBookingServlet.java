package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TicketBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve attributes set by TicketBookingServlet
        String sourceStation = request.getParameter("sourceStation");
        String destinationStation = request.getParameter("destinationStation");
        String ticketType = request.getParameter("ticketType");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Calculate the total fare
        double totalAmount = calculateFare(sourceStation, destinationStation, ticketType, quantity);

        // Get the current date
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentDate = dateFormat.format(new Date());

        // Set attributes for use in JSP
        request.setAttribute("sourceStation", sourceStation);
        request.setAttribute("destinationStation", destinationStation);
        request.setAttribute("ticketType", ticketType);
        request.setAttribute("quantity", quantity);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("currentDate", currentDate);

        // Save to the database
        saveToDatabase(sourceStation, destinationStation, ticketType, quantity, totalAmount, currentDate);

        // Forward the request to the Confirmation JSP page
        request.getRequestDispatcher("Confirmation.jsp").forward(request, response);
    }
    

    private double calculateFare(String sourceStation, String destinationStation, String ticketType, int quantity) {
        // Fare calculation logic based on provided rules
        // Replace this logic with your actual fare calculation rules

        double baseFare = 0.0;

        if (sourceStation.equals("PCMC") && destinationStation.equals("SANT TUKARAM NAGAR")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("NASHIK PHATA")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("KASARWADI")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("PHUGEWADI")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("DAPODI")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("BOPODI")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("SHIVAJI NAGAR")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("CIVIL COURT")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("VANAZ")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("ANAND NAGAR")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("IDEAL COLONY")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("NAL STOP")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("DECCAN")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("CHH SHIVAJI UDYAN")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("PMC")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("MANGALWARPETH")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("PUNE RAILWAY STATION")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("RUBY CLINIC")) {
            baseFare = 30.0;
        
        //-----------------------------------------------SANTATUKARAMNAGAR----------------------------------------
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("PCMC")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("NASHIK PHATA")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("KASARWADI")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("PHUGEWADI")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("DAPODI")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("BOPODI")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("SHIVAJI NAGAR")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("CIVIL COURT")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("VANAZ")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("ANAND NAGAR")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("IDEAL COLONY")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("NAL STOP")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("DECCAN")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("CHH SHIVAJI UDYAN")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("PMC")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("MANGALWARPETH")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("PUNE RAILWAY STATION")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("RUBY CLINIC")) {
            baseFare = 30.0;
        
           //-----------------------------------------------NASHIKPHATA----------------------------------------
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("PCMC")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("SANT TUKARAM NAGAR")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("KASARWADI")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("PHUGEWADI")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("DAPODI")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("BOPODI")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("SHIVAJI NAGAR")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("CIVIL COURT")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("VANAZ")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("ANAND NAGAR")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("IDEAL COLONY")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("NAL STOP")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("DECCAN")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("CHH SHIVAJI UDYAN")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("PMC")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("MANGALWARPETH")) {
            baseFare = 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("PUNE RAILWAY STATION")) {
            baseFare = 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("RUBY CLINIC")) {
            baseFare = 30.0;
        }

        // Check if it's a return way ticket and double the fare
        if ("return".equals(ticketType)) {
            return 2 * baseFare * quantity;
        } else {
            return baseFare * quantity;
        }
    }
 private void saveToDatabase(String sourceStation, String destinationStation, String ticketType,
            int quantity, double totalAmount, String currentDate) {
        // JDBC code to save the data into a database
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Replace with your database details
            String jdbcUrl = "jdbc:mysql://localhost:3306/metro-ticket";
            String dbUsername = "root";
            String dbPassword = "";

            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

            // Prepare the SQL statement
            String sql = "INSERT INTO ticket_history (source_station, destination_station, ticket_type, quantity, total_amount, booking_date) VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);

            // Set parameters
            preparedStatement.setString(1, sourceStation);
            preparedStatement.setString(2, destinationStation);
            preparedStatement.setString(3, ticketType);
            preparedStatement.setInt(4, quantity);
            preparedStatement.setDouble(5, totalAmount);
            preparedStatement.setString(6, currentDate);

            // Execute the query
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
            }
        }
    }
  
}
