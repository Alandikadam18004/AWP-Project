<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="web3.About" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Sweet Bliss Cakes!</title>
    <link rel="icon" href="/images/cake logo.jpeg" type="image/x-icon">
    <style>
       
        body {
            font-family: Comic Sans MS;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

       
        .navbar {
            background-color: #f79ed6;
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

      
        .header {
            background-color: #e5416a ;
            padding: 20px;
            text-align: center;
            color: white;
        }

        .header h1 {
            margin: 0;
            font-size: 36px;
        }

       
        .content {
            padding: 20px;
            font-size: 18px;
            background-color: #fff;
            border-radius: 8px;
            margin: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        
        footer {
            text-align: center;
            padding: 10px;
            background-color: #e5416a;
            color: white;
            margin-top: 20px;
        }
        .auto-style1 {
            text-align: center;
            font-weight: 700;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       
        <div class="header">
            <h1>About Us</h1>
        </div>

        
        <div class="content">
            <p class="auto-style1">Welcome to Sweet Bliss Cakes!</p>
            <p style="text-align: center">&nbsp;Your one-stop destination for delicious, freshly baked cakes made with love and perfection. At Sweet Bliss Cakes, we believe that every occasion deserves a touch of sweetness. Whether it’s a birthday, wedding, anniversary, or just a moment to indulge, our wide variety of cakes is sure to delight your taste buds.

</p>
            <p>
                <strong>Our Story:</strong><br />
                Sweet Bliss Cakes began with a simple dream: to spread happiness through the art of baking. Founded in 2005, our journey started in a small kitchen where our founder, Alandi Kadam turned their passion for baking into a thriving business. What began as a hobby of crafting cakes for friends and family quickly grew into a full-fledged bakery, thanks to the love and appreciation of our loyal customers.</p>
            <p>
                <strong>Meet the Founder:</strong><br />
                Alandi Kadam is a passionate baker with a vision to bring people closer through the joy of delicious, handcrafted cakes. With years of experience in baking and a creative touch, Alandi Kadam has transformed Sweet Bliss Cakes into a brand known for quality, flavor, and beautiful designs. Their dedication to perfection and love for baking are reflected in every cake that comes out of our kitchen.</p>
            <p>
                <strong>Our Vision:</strong><br />
                At Sweet Bliss Cakes, we believe that every occasion, big or small, deserves a special touch. Our mission is to create cakes that not only taste divine but also become a centerpiece of your celebrations. We aim to make every customer feel special by crafting cakes tailored to their needs and preferences.</p>
            <p>
                <strong>A Legacy of Sweetness:</strong><br />
                Over the years, Sweet Bliss Cakes has grown into a trusted name in the community. We&#39;ve had the privilege of being part of countless celebrations, spreading smiles one slice at a time. As we continue to grow, we remain committed to our roots: delivering cakes that create moments of pure joy.</p>
            <p>
                Whether you&#39;re celebrating a birthday, wedding, or just the little moments in life, Sweet Bliss Cakes is here to make your occasion unforgettable. Explore our range of cakes and desserts, and let us add a touch of sweetness to your story.</p>
            <p>
                &nbsp;</p>
            <p>
            </p>
            <p style="text-align: center">&nbsp;</p>
        </div>
        <br />
        <br />
        <br />

       
        <footer>
            &copy; 2024 My Cake Shop. All Rights Reserved.
        </footer>
    </form>
</body>
</html>
