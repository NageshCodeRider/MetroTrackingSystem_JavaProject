<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Metro Ticket Booking</title>
    <style>
        body {
             font-family: Tahoma, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
              max-width: 400px;
              margin: 20px auto;
              background-color: #fff;
              padding: 30px;
              border-radius: 8px;
              box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
              text-align: center; /* Center align the content within the form */
            }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
                width: 60%;
               background-color: #BB75D0;
                color: #fff;
                padding: 15px 30px;
                border: none;
                border-radius: 20px;
                cursor: pointer;
                display: inline-block; /* Make the button inline-block to center it */
               }

        input[type="submit"]:hover {
           background-color: #D7AEE3;
        }

        .result {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .result p {
            margin: 0;
            color: #333;
        }
        
         header {
            background-color: #ECF3F9;
            color: white;
            text-align: center;
            padding: 1em 0;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        .logo-container {
            display: flex;
            align-items: left;
        }
        
        .logo-text {
            margin-left: 10px; /* Adjust as needed */
            font-size: 18px; /* Adjust as needed */
            font-weight: bold;
            color: rgb(0, 0, 0);
            margin-right: auto;
        }

        nav img {
            height: 55px; /* Adjust as needed */
            width: 60px;
        
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
        }

        nav a {
            text-decoration: none;
            color: rgb(0, 0, 0);
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s ease-in-out;
        }

        nav a:hover {
            color: #BB75D0;
        }
    </style>
</head>
<body>
      <header>
        <nav>
            <img src="logo.png" alt="Logo">
            <span class="logo-text">Metro Tracking System</span>
            <ul>
                <li><a href="Blueline.html">Metro Location</a></li>
                <li><a href="Bookingticket.jsp">Booking Ticket</a></li>
                <li><a href="homepage.jsp">Home</a></li>
            </ul>
        </nav>
    </header>
    
    <h2>Metro Fare Calculator</h2>
    <form action="CalculateFareServlet" method="post">
        <label for="sourceStation">Source Station:</label>
        <select name="sourceStation" id="sourceStation">
            <option value="PCMC">PCMC</option>
            <option value="SANT TUKARAM NAGAR">SANT TUKARAM NAGAR</option>
            <option value="NASHIK PHATA">NASHIK PHATA</option>
            <option value="KASARWADI">KASARWADI</option>
            <option value="PHUGEWADI">PHUGEWADI</option>
            <option value="DAPODI">DAPODI</option>
            <option value="BOPODI">BOPODI</option>
            <option value="SHIVAJI NAGAR">SHIVAJI NAGAR</option>
            <option value="CIVIL COURT">CIVIL COURT</option>
            <option value="VANAZ">VANAZ</option>
            <option value="ANAND NAGAR">ANAND NAGAR</option>
            <option value="IDEAL COLONY">IDEAL COLONY</option>
            <option value="NAL STOP">NAL STOP</option>
            <option value="GARWARE COLLEGE">GARWARE COLLEGE</option>
            <option value="DECCAN">DECCAN</option>
            <option value="SAMBHAJI PARK">SAMBHAJI PARK</option>
            <option value="PMC">PMC</option>
            <option value="MANGALWAR PETH">MANGALWAR PETH</option>
            <option value="PUNE RAILWAY STATION">PUNE RAILWAY STATION</option>
            <option value="RUBY HALL CLINIC">RUBY HALL CLINIC</option>

        </select>
        
        <label for="destinationStation">Destination Station:</label>
        <select name="destinationStation" id="destinationStation">
              <option value="PCMC">PCMC</option>
            <option value="SANT TUKARAM NAGAR">SANT TUKARAM NAGAR</option>
            <option value="NASHIK PHATA">NASHIK PHATA</option>
            <option value="KASARWADI">KASARWADI</option>
            <option value="PHUGEWADI">PHUGEWADI</option>
            <option value="DAPODI">DAPODI</option>
            <option value="BOPODI">BOPODI</option>
            <option value="SHIVAJI NAGAR">SHIVAJI NAGAR</option>
            <option value="CIVIL COURT">CIVIL COURT</option>
            <option value="VANAZ">VANAZ</option>
            <option value="ANAND NAGAR">ANAND NAGAR</option>
            <option value="IDEAL COLONY">IDEAL COLONY</option>
            <option value="NAL STOP">NAL STOP</option>
            <option value="GARWARE COLLEGE">GARWARE COLLEGE</option>
            <option value="DECCAN">DECCAN</option>
            <option value="SAMBHAJI PARK">SAMBHAJI PARK</option>
            <option value="PMC">PMC</option>
            <option value="MANGALWAR PETH">MANGALWAR PETH</option>
            <option value="PUNE RAILWAY STATION">PUNE RAILWAY STATION</option>
            <option value="RUBY HALL CLINIC">RUBY HALL CLINIC</option>
        </select>
        
        <input type="submit" value="Calculate Fare">
    </form>

    <div class="result">
        <h2>Fare Calculation Result</h2>
        <p>Fare from <%= request.getParameter("sourceStation") %> to <%= request.getParameter("destinationStation") %>: Rs. <%= request.getAttribute("fare") %></p>
    </div>
</body>
</html>
