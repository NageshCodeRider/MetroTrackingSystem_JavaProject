package com;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CalculateFareServlet")
public class CalculateFareServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve selected source and destination stations
        String sourceStation = request.getParameter("sourceStation");
        String destinationStation = request.getParameter("destinationStation");

        // Perform fare calculation
        double fare = calculateFare(sourceStation, destinationStation);

        // Set fare as an attribute in the request
        request.setAttribute("fare", fare);

        // Forward the request to the JSP page for display
        request.getRequestDispatcher("calculationfare.jsp").forward(request, response);
    }

    private double calculateFare(String sourceStation, String destinationStation) {
        // Fare calculation logic based on provided rules
        // Replace this logic with your actual fare calculation rules

        if (sourceStation.equals("PCMC") && destinationStation.equals("SANT TUKARAM NAGAR")) {
            return 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("NASHIK PHATA")) {
            return 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("KASARWADI")) {
            return 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("PHUGEWADI")) {
            return 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("DAPODI")) {
            return 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("BOPODI")) {
            return 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("SHIVAJI NAGAR")) {
            return 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("CIVIL COURT")) {
            return 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("VANAZ")) {
            return 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("ANAND NAGAR")) {
            return 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("IDEAL COLONY")) {
            return 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("NAL STOP")) {
            return 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("GARWARE COLLEGE")) {
            return 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("DECCAN")) {
            return 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("SAMBHAJI PARK")) {
            return 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("PMC")) {
            return 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("MANGALWAR PETH")) {
            return 20.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("PUNE RAILWAY STATION")) {
            return 30.0;
        } else if (sourceStation.equals("PCMC") && destinationStation.equals("RUBY HALL CLINIC")) {
            return 30.0;
            //------------------------------------------SANTATUKARAMNAGAR TO OTHER STATIONS----------------------------------------------------------//
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("PCMC")) {
            return 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("NASHIK PHATA")) {
            return 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("KASARWADI")) {
            return 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("PHUGEWADI")) {
            return 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("DAPODI")) {
            return 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("BOPODI")) {
            return 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("SHIVAJI NAGAR")) {
            return 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("CIVIL COURT")) {
            return 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("VANAZ")) {
            return 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("ANAND NAGAR")) {
            return 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("IDEAL COLONY")) {
            return 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("NAL STOP")) {
            return 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("GARWARE COLLEGE")) {
            return 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("DECCAN")) {
            return 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("SAMBHAJI PARK")) {
            return 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("PMC")) {
            return 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("MANGALWAR PETH")) {
            return 20.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("PUNE RAILWAY STATION")) {
            return 30.0;
        } else if (sourceStation.equals("SANT TUKARAM NAGAR") && destinationStation.equals("RUBY HALL CLINIC")) {
            return 30.0; 
         //------------------------------------------SANTATUKARAMNAGAR TO OTHER STATIONS----------------------------------------------------------//
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("PCMC")) {
            return 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("SANT TUKARAM NAGAR")) {
            return 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("KASARWADI")) {
            return 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("PHUGEWADI")) {
            return 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("DAPODI")) {
            return 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("BOPODI")) {
            return 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("SHIVAJI NAGAR")) {
            return 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("CIVIL COURT")) {
            return 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("VANAZ")) {
            return 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("ANAND NAGAR")) {
            return 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("IDEAL COLONY")) {
            return 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("NAL STOP")) {
            return 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("GARWARE COLLEGE")) {
            return 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("DECCAN")) {
            return 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("SAMBHAJI PARK")) {
            return 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("PMC")) {
            return 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("MANGALWAR PETH")) {
            return 20.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("PUNE RAILWAY STATION")) {
            return 30.0;
        } else if (sourceStation.equals("NASHIK PHATA") && destinationStation.equals("RUBY HALL CLINIC")) {
            return 30.0;     
        } else {
            // Default fare for unknown combination
            return 0.0;
        }
    }
}