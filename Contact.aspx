<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="web3.Contact" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sweet Bliss Cakes!</title>
    <link rel="icon" href="/images/cake logo.jpeg" type="image/x-icon">
    <style>
        /* General styling */
       body {
    font-family: Comic Sans MS;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    color: #333;
}

/* Navigation bar */
.navbar {
    background-color: #e5416a;
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
    height: 63px;
}
.navbar a {
    color: white;
    text-decoration: none;
    margin: 0 15px;
    font-size: large;
    transition: color 0.3s ease;
}
.navbar a:hover {
    color: #090106;
}

/* Header */
.header {
    background-color: #e5416a;
    padding: 20px;
    text-align: center;
    color: white;
}

.header h1 {
    margin: 0;
    font-size: 36px;
}

/* Content Section */
.content {
    padding: 20px;
    font-size: 18px;
    background-color: #fff;
    border-radius: 8px;
    margin: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Footer */
footer {
    text-align: center;
    padding: 10px;
    background-color: #e5416a;
    color: white;
    margin-top: 20px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation bar -->
        
        <!-- Page title -->
        <div class="header">
    <h1>Contact Us</h1>
</div>

        <!-- Content Section -->
        <div class="content">
            <p>
                We love bringing your sweet dreams to life! Whether you’re planning a birthday, wedding, anniversary, or any special occasion, we’re here to craft a cake that’s as unique as your celebration.</p>
            <p>
                <strong>Let’s Create Something Special Together!</strong><br />
                Tell us about your vision, and we’ll work with you to design a customized cake that perfectly matches your theme, taste, and preferences.</p>
            <h4><strong>How to Reach Us:</strong></h4>
            <p>
                📞 <strong>Phone:</strong> +91 9004853471<br />
                📧 <strong>Email: </strong>SweetBlissCakes@gmail.com<br />
                📍 <strong>Address:</strong> Mumbai,Maharashtra-400031<br />
                🕒 <strong>Business Hours:</strong><br />
                Monday to Saturday: 9:00 AM – 8:00 PM<br />
                Sunday: 10:00 AM – 6:00 PM</p>
            <h4><strong>Custom Cake Inquiry Form</strong></h4>
            <p>
                To make it easy for you to share your ideas, please fill out the form below with your details:</p>
            <ul>
                <li><strong>Your Name</strong></li>
                <li><strong>Contact Information (Phone/Email)</strong></li>
                <li><strong>Date of Your Event</strong></li>
                <li><strong>Cake Theme or Design Idea</strong></li>
                <li><strong>Flavor Preferences</strong></li>
                <li><strong>Number of Servings</strong></li>
                <li><strong>Any Additional Notes</strong></li>
            </ul>
            <p>
                Our team will get back to you within 24-48 hours to discuss your requirements and provide a quote.</p>
            <h4><strong>Visit Us:</strong></h4>
            <p>
                Stop by our bakery to see our creations in person, sample our flavors, and discuss your cake design with our team. Walk-ins are welcome, but for customized cakes, we recommend scheduling a consultation to give your cake the attention it deserves.</p>
            <p>
                <strong>We Can’t Wait to Hear from You!</strong></p>
            <p>
                Together, let’s make your celebration truly unforgettable with a cake that’s as delightful to look at as it is to taste.</p>
            <p>&nbsp;</p>
        </div>

        <br />
        <br />

        <!-- Footer -->
        <footer>
            &copy; 2024 My Cake Shop. All Rights Reserved.
        </footer>
    </form>
</body>
</html>
