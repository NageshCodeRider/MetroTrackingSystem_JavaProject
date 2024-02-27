package admin;
public class Complaint {
    private int id;
    private String message;
    private String subject;
    private String timestamp;

    public Complaint(int id, String message, String subject, String timestamp) {
        this.id = id;
        this.message = message;
        this.subject = subject;
        this.timestamp = timestamp;
    }

    // Add getters if needed
}
