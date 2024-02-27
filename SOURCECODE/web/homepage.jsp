<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.IOException" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Simple Website</title>
  <style>
    body {
    font-family: Tahoma, sans-serif;
    background: url('punemap.png') no-repeat center center fixed; 
    background-size: cover; /* Stretch the background image */
    margin: 0;
    padding: 0;
    opacity: 2.5; /* Set the transparency (0.0 to 1.0) */
    border-radius: 7px;
    }
header {
    background-color: #ECF3F9;
    color: #BB75D0;
    text-align: center;
    padding: 1em 0;
    border-radius: 15px;
}

.nav-container {
   background: white;
    background-size: cover;
    background-position: center;
    padding: 20px;
    text-align: center;
    border-radius: 20px;
}

.nav-links {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    justify-content: space-around;
}

.nav-links li {
    margin-right: 20px;
}

.nav-links a {
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    font-size: 16px;
    transition: color 0.3s ease-in-out;
}

.nav-links a:hover {
    color: #ff0dbe;
}

main {
    padding: 20px;
}


/* Example of animation */
@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

h2 {
    animation: fadeIn 1.5s ease-in-out;
}
  .nav-container {
            background-image: url('your_background_image.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            padding: 20px;
            text-align: center;
            border-right: 15px;
        }

        .nav-links {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: space-around;
        }

        .nav-links li {
            margin-right: 20px;
        }

        .nav-links a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s ease-in-out;
        }

        .nav-links a:hover {
            color: #ff0dbe;
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
            border-radius: 20px;
            text-align: center;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
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
        background-color: #BB75D0;
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
            background-color: #D7AEE3;
        }
    </style>
</head>
<body>
    <header>
        <% 
            // Retrieve username from the session
            String username = (String) session.getAttribute("username");
            if (username != null && !username.isEmpty()) {
        %>
            <h1>Welcome <%=username%> to the Metro </h1>
        <%
            }
        %>
    </header>

    <main>
      <div id="content">
    <div class="grid-container">
        <div class="grid-item">
            <a href="Blueline.html">
                <img src="admin/tracking.png" alt="Image 1">
                <button>Metro Tracking</button>
            </a>
        </div>
        <div class="grid-item">
            <a href="Bookingticket.jsp">
                <img src="ticket.png" alt="Image 2">
                <button>Booking Ticket</button>
            </a>
        </div>
        <div class="grid-item">
            <a href="calculationfare.jsp">
                <img src="fare.png" alt="Image 3">
                <button>Fare calculation</button>
            </a>
        </div>
        <!-- Add more grid items as needed -->
    </div>
</div>
<div class="grid-container">
    <div class="grid-item">
        <a href="Purpleline.html">
            <img src="station.png" alt="Image 1">
            <button>Station List</button>
        </a>
    </div>
    <div class="grid-item">
        <a href="tickethistory.jsp">
            <img src="myticket.png" alt="Image 2">
            <button>View Ticket</button>
        </a>
    </div>
    <div class="grid-item">
        <a href="profilepage.jsp">
            <img src="admin/Profile.png" alt="Image 3">
            <button>User Profile</button>
        </a>
    </div>
    <!-- Duplicate the following code for additional grid items -->
    <div class="grid-item">
        <a href="feedbackform.html">
            <img src="admin/feedback.png" alt="Image 4">
            <button>FeedBack</button>
        </a>
    </div>
      <div class="grid-item">
        <a href="Usercomplaint.html">
            <img src="admin/complaint.png" alt="Image 1">
            <button>Complaint</button>
        </a>
    </div>  
</div>
        <br><!-- comment -->      
        <br><!-- comment -->      
        <br><!-- comment -->      
        <br><!-- comment -->      
        <br><!-- comment -->      
    </main>

    
</body>
</html>
