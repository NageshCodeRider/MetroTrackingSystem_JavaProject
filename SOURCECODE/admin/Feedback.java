package admin;

public class Feedback {
    private int id;
    private String message;

    // Constructors, getters, and setters

    // Constructor
    public Feedback(int id, String message) {
        this.id = id;
        this.message = message;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
