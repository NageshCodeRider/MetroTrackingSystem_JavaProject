package admin; // Replace with the actual package name

import java.sql.Timestamp;

public class Ticket {
    private final int id;
    private final String sourceStation;
    private final String destinationStation;
    private final String ticketType;
    private final int quantity;
    private final double totalAmount;
    private final Timestamp bookingDate;

    public Ticket(int id, String sourceStation, String destinationStation, String ticketType, int quantity, double totalAmount, Timestamp bookingDate) {
        this.id = id;
        this.sourceStation = sourceStation;
        this.destinationStation = destinationStation;
        this.ticketType = ticketType;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.bookingDate = bookingDate;
    }

    public int getId() {
        return id;
    }

    public String getSourceStation() {
        return sourceStation;
    }

    public String getDestinationStation() {
        return destinationStation;
    }

    public String getTicketType() {
        return ticketType;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public Timestamp getBookingDate() {
        return bookingDate;
    }
}
