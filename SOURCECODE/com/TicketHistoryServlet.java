package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.UserTicket;

public class TicketHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Ticket> ticketHistory = getTicketHistoryFromDatabase();
        request.setAttribute("ticketHistory", ticketHistory);
        request.getRequestDispatcher("viewtickets.jsp").forward(request, response);
    }

    private List<Ticket> getTicketHistoryFromDatabase() {
        List<Ticket> ticketHistory = new ArrayList<>();

        try (Connection connection = getConnection()) {
            String query = "SELECT * FROM ticket_history";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Ticket ticket = new Ticket();
                    ticket.setId(resultSet.getInt("id"));
                    ticket.setSourceStation(resultSet.getString("source_station"));
                    ticket.setDestinationStation(resultSet.getString("destination_station"));
                    ticket.setTicketType(resultSet.getString("ticket_type"));
                    ticket.setQuantity(resultSet.getInt("quantity"));
                    ticket.setTotalAmount(resultSet.getDouble("total_amount"));
                    ticket.setBookingDate(resultSet.getDate("booking_date"));
                    ticketHistory.add(ticket);
                }
            }
        } catch (SQLException e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }

        return ticketHistory;
    }

    private Connection getConnection() throws SQLException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/metro-ticket";
        String dbUsername = "root";
        String dbPassword = "";
        return DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
    }
}
