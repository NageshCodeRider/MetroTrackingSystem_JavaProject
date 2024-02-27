package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/user-complaint";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    public static List<Complaint> getComplaints() {
        List<Complaint> complaints = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "SELECT * FROM Complaints";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String message = resultSet.getString("message");
                    String subject = resultSet.getString("subject");
                    String timestamp = resultSet.getTimestamp("timestamp").toString();

                    complaints.add(new Complaint(id, message, subject, timestamp));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return complaints;
    }
}
