<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="EAVS.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EAVS System Homepage</title>
    <link rel="stylesheet" href="Asset/css/slideshow.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="icon" type="image/x-icon" href="Asset/img/faviconTAR.ico"/>
    
    

    <style> 
        

        body, html{
            margin: 0;
	        padding: 0;
            background-color: #ebf1ff;
            
        }

        a
        {
	        text-decoration: none;
        }

        header
        {
            
            
	        min-height: 128px;	
	        text-align: center;
        }

        header h1
        {
	        color: black;
	        text-shadow: 0 0 5px blue;
	        font-size: 48px;
	        line-height: 128px;
	        font-style: italic;
	        cursor: default;
	        user-select: none;
	        margin:0; 
        }

        header i h2{
            float: right;
            height: 70px;
            line-height: 100px;
            color:darkblue;
            
        }

        #logo
        {
	        width: 155px;
	        height: 155px;
	        object-fit: contain;
	
	        float: left;
	        margin-left: 3%;
            
        }

        #logo:hover
        {
	        filter: brightness(150%);
        }

        nav
        {
            
            width:100%;
            overflow:hidden;
	        height: 20%;
            
        }

        nav ul
        {
	        list-style-type: none;
	        padding: 0;
	        margin: 0;	
        }

        nav li
        {
	        float: left;	
	        background-color: rgba(0, 80, 180, 0.6);
            width:25%;
        }

        nav a 
        {
	        display: block;
	        padding: 40px 28px;
	        text-align: center;
	        color: #fff;
            font-size:16px;
	        font-weight: bold;
	        font-size: 18px;
	        transition: background-color 0.4s;
        }

        nav a.current
        {
	        background-color: rgba(0, 80, 180, 1);
        }

        nav a:not(.current):hover
        {
	        background-color: rgba(0, 80, 180, 1);	
        }

        

        footer
        {
            display: flex;
	        justify-content: space-around;	
	        background-color: rgba(0, 80, 180, 0.5);	
	        font-size: 20px;
	        padding: 30px 0 30px;
	        margin-top: 200px;
	        position: relative;
            color:darkblue;
            
        }

        @media screen and (max-width: 500px) {
          .navbar a {
            float: none;
            display: block;
            width: 100%;
            text-align: left; /* If you want the text to be left-aligned on small screens */
          }
        }

    </style>

    <script>
            setInterval((() => time.innerText = new Date().toLocaleTimeString()),1000)
    </script>

    

</head>
<body>
    <header>
        <a href="Homepage.aspx"><img src="Asset/img/TARUMT_LOGO.png" alt="logo" id="logo" /></a>

	    <h1 style="float:left;width:450px">TARUMT EAVS</h1>

        <!--Show Date & Time -->
        </i></i><i><h2 id="time"></h2></i>
        <nav>
	        <ul>
		        <li><a href="Homepage.aspx" class="current">Home</a></li>
		        <li><a href="AboutUs.aspx">About Us</a></li>
		        <li><a href="AdminLogin.aspx">Admin</a></li>
		        <li><a href="Login.aspx">Login</a></li>
	        </ul>
        </nav>

    </header>
    
    <br /><br /><br />
    

    <div id="container" onmouseenter="stop_loop()" onmouseleave="start_loop()">

	    <div class="prev" onclick="previous(event)"><</div>
	    <div class="next" onclick="next(event)">></div>

	    <ul id="slider" >
		    <li><img src="Asset/img/tarPic.jpg" /></li>
		    <li class='active'><img src="Asset/img/tarPic 1.jpg" /></li>
		    <li><img src="Asset/img/tarPic 2.jpg" /></li>
		    <li><img src="Asset/img/tarPic 3.jpg" /></li>
		    <li><img src="Asset/img/tarPic 4.jpg" /></li>
            <li><img src="Asset/img/tarPic.jpg" /></li>
	    </ul>

    </div>

    <br /><br />

    
   

    <footer>
        <div id="footer">©2022 Exam Attandance Verification System. <b>LEE KAI MUN</b> All Rights Reserved.</div>
    </footer>

    <script src="Asset/js/slideshow.js"></script>
    
</body>
</html>
