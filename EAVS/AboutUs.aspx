<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="EAVS.AboutUs" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EAVS System About Us</title>

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

        #vision, #history
		{
			width:70%;
			margin: 108px auto;
			line-height: 40px;
			text-align: center;
	
			box-shadow: -5px 5px 10px #3a79a6;
		}

		h1
		{	
			font-size: 30px;
			color:darkred;
	
		}

		h3{
			font-size: 20px;
			color:darkgreen;
		}

		* {
		  box-sizing: border-box;
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

        <i><h2 id="time"></h2></i>
        <nav>
	        <ul>
		        <li><a href="Homepage.aspx">Home</a></li>
		        <li><a href="AboutUs.aspx" class="current">About Us</a></li>
		        <li><a href="AdminLogin.aspx">Admin</a></li>
		        <li><a href="Login.aspx">Login</a></li>
	        </ul>
        </nav>

    </header>
    

    <section id="about-us">
		<article id="vision" class="about-us-vision">				
			<h1>VISION</h1>
		
			<h3>
				To be a Leading University Transforming the Future<br /><br />
			</h3>
		</article>
	
		<article id="history" class="about-us-history">				
			<h1>MISSION</h1>
		
			<h3>
				Providing Beyond Education<br />
				A Learning Experience Beyond Academic Knowledge<br /> and Skills.<br /><br />
				We provide a vibrant and immersive campus<br /> environment for students to develop competencies and<br />
				values that lead to a fulfilling life and career.<br /><br />
				Together, let's learn and grow with <br />Beyond Education<br /><br />
			</h3>
		</article>
	</section>

	<footer>
        <div id="footer">©2022 Exam Attandance Verification System. <b>LEE KAI MUN</b> All Rights Reserved.</div>
    </footer>

</body>
</html>

