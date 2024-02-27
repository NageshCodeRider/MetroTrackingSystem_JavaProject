<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>Confirmation</title>
  <style>
    body {
      font-family: Tahoma, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    h2 {
      color: green;
    }

    p {
      color: #555;
      font-size: 18px;
      margin-bottom: 10px;
    }

    .confirmation-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    .download-pdf-button {
      background-color: #BB75D0;
      color: #fff;
      padding: 15px 30px;
      border: none;
      border-radius: 20px;
      cursor: pointer;
      text-decoration: none;
      font-size: 16px;
      margin-top: 20px;
      display: inline-block;
    }

    .download-pdf-button:hover {
      background-color: #D7AEE3;
    }

    .back-to-home-button {
     background-color: #BB75D0;
      color: #fff;
      padding: 15px 30px;
      border: none;
      border-radius: 20px;
      cursor: pointer;
      text-decoration: none;
      font-size: 16px;
      margin-top: 20px;
      display: inline-block;
      margin-right: 10px;
    }

    .back-to-home-button:hover {
      background-color: #D7AEE3;
    }
  </style>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.8.0/html2pdf.bundle.min.js"></script>
 <script>
    function downloadAsPDF() {
        // Create a new HTML element to hold the ticket content
        const ticketContent = document.createElement('div');

        // Set the inner HTML of the element with the details
        ticketContent.innerHTML = `
            <div style="text-align: center; font-size: 18px; margin-bottom: 20px;">
                <img src="logo.png" alt="Logo" style="width: 100px; height: 100px;">
                <h2>Ticket</h2>
            </div>
            <div style="text-align: center; font-size: 14px;">
                <p><strong>Source Station:</strong> ${sourceStation}</p>
                <p><strong>Destination Station:</strong> ${destinationStation}</p>
                <p><strong>Journey Type:</strong> ${ticketType}</p>
                <p><strong>Quantity:</strong> ${quantity}</p>
                <p><strong>Total Amount:</strong> ${totalAmount}</p>
                <p><strong>Date:</strong> ${currentDate}</p>
            </div>
        `;

        // Append the new element to the body
        document.body.appendChild(ticketContent);

        // Use html2pdf to convert the content to a PDF
        html2pdf(ticketContent);

        // Remove the added element after converting to PDF
        document.body.removeChild(ticketContent);
    }
</script>
</head>
<body>
  <div class="confirmation-container">
    <h2>Booking Confirmation</h2>
    <p id="congrats-message">Congratulations! Your booking was successful.</p>
    <p>Source Station: ${sourceStation}</p>
    <p>Destination Station: ${destinationStation}</p>
    <p>Journey Type: ${ticketType}</p>
    <p>Quantity: ${quantity}</p>
    <p>Total Amount: ${totalAmount}</p>
    <p>Date: ${currentDate}</p>

    <button class="download-pdf-button" onclick="downloadAsPDF()">Download Ticket as PDF</button>
  
    <!-- Add a link for returning to the homepage -->
        <a class="back-to-home-button" href="homepage.jsp">Back to Homepage</a>
    
    </div>
</body>
</html>       