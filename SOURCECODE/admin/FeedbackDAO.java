package admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/user-feedback";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    public static List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                String sql = "SELECT * FROM feedback";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
                     ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String message = resultSet.getString("message");
                        Feedback feedback = new Feedback(id, message);
                        feedbackList.add(feedback);
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return feedbackList;
    }
}
