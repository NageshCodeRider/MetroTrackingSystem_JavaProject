<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color:  #eee;
            color: white;
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
            align-items:  center;
            height: 50px; /* Adjust as needed */
            width: 50px; /* Adjust as needed */
            margin-right: 10px;
        }

        .logo-text {
            font-size: 22px;
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
       

        #content h2 {
            text-align: center;
            color: #333;
            margin: 20px;
        }

        .grid-container {
            padding: 10px 250px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 5px;
        }

        .grid-item {
            background: whitesmoke;
            text-align: center;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
            border-radius: 20px;
        }

        .grid-item:hover {
            transform: scale(1.05);
        }

        .grid-item img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .grid-item a {
            text-decoration: none;
            color: #333;
        }

        .grid-item button {
        background-color: #C70039;
        color: white;
        width: 100%;
        padding: 10px 20px; /* Adjust the padding as needed */
        border: none;
        border-radius: 20px;
        cursor: pointer;
        transition: background-color 0.3s; /* Add color transition for smoother effect */
        font-size: 16px; /* Adjust the font size as needed */
        white-space: nowrap; /* Ensure the text stays on one line */
    }
       

        .grid-item button:hover {
            background-color: #FF6969;
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
            
        </nav>
    </header>
<div id="content">
    <h2>Welcome to the Admin Page</h2>
    <div class="grid-container">
        <div class="grid-item">
            <a href="trackmanager.html">
                <img src="tracking.png" alt="Image 1"><br>
                <br><br><button>Managing Track</button>
            </a>
        </div>
        <div class="grid-item">
            <a href="usercount.jsp">
                <img src="Count.png" alt="Image 2"><br>
                <br><br><button>Live Count</button>
            </a>
        </div>
        <div class="grid-item">
            <a href="MetroChart.jsp">
                <img src="chart.png" alt="Image 3">
                <br><br><br><button>Ridership and Revenue Chart</button>
            </a>
        </div>
        <!-- Add more grid items as needed -->
    </div>
</div>
<div class="grid-container">
    <div class="grid-item">
        <a href="displayFeedback.jsp">
            <img src="feedback.png" alt="Image 1">
            <button>Users Feedback</button>
        </a>
    </div>
    <div class="grid-item">
        <a href="complaints.jsp">
            <img src="complaint.png" alt="Image 2">
            <button>Users Complaint</button>
        </a>
    </div>
    <div class="grid-item">
        <a href="Userdata.jsp">
            <img src="Search.png" alt="Image 3">
            <button>Search Users data</button>
        </a>
    </div>
     <div class="grid-item">
        <a href="Totalamount.jsp">
            <img src="totalamount.png" alt="Image 3">
            <button>Total Tickets</button>
        </a>
    </div>
    <!-- Duplicate the following code for additional grid items -->
    <div class="grid-item">
        <a href="adminprofile.jsp">
            <img src="Profile.png" alt="Image 4">
            <button>Admin Profile</button>
        </a>
    </div>
   
    <!-- Add more grid items as needed -->
</</div>
</body>
</html>
