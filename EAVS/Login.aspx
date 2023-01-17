<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EAVS.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
    <link rel="stylesheet" href="Asset/css/bootstrap.min.css" />
    <link rel="icon" type="image/x-icon" href="Asset/img/faviconTAR.ico"/>


    <script>
        function checkExist() {
            var username = document.getElementById("<%= txtUname.ClientID %>").value;
            var password = document.getElementById("<%= txtPwd.ClientID %>").value;
            var errMsg = "";

            if (username == "") {
                errMsg += "Please fill in user name\n"; 
            }
            if (password == "") {
                errMsg += "Please fill in password";
            }
            if (errMsg != "") {
                alert(errMsg);
            }
        }

        function myshowp() {
            ckbox = $('#ckShowPass')
            txtBox = $('#txtPwd')

            if (ckbox.is(':checked')) {
                txtBox.attr("Type", "Text");
            }
            else {
                txtBox.attr("Type", "Password");
            }
        }
    </script>

    <style>

        body{
            background-image:url('Asset/img/stuLogBACK.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }

        .red{
            box-sizing:border-box;
            color:rgb(221,90,67);
            font-family:"Open Sans", Arial, Helvetica, sans-serif;
            font-size:28px;
            font-weight:400;
            line-height:35.2px;
            text-size-adjust:100%;
            width:auto;
        }
        .blue{
            box-sizing:border-box;
            color:rgb(71, 143, 202);
            font-family:"Open Sans", Arial, Helvetica, sans-serif;
            font-size:28px;
            font-weight:400;
            line-height:35.2px;
            text-size-adjust:100%;
            width:auto;
        }
        
        .stuText
        {
            box-sizing:border-box;
            color:white;
            font-family:"Open Sans", Arial, Helvetica, sans-serif;
            font-size:28px;
            font-weight:400;
            line-height:35.2px;
            text-size-adjust:100%;
            width:auto;
        }

        .imgContainer{
            text-align: center;
            margin: 24px 0 12px 0;
        }

        .imgLog{ 
            width: 30%;
            border-radius: 50%;
        }
        
        .showPWD{
            color:white;
        }
        
        

        .btnLog
        {
            width:100%;
            margin-bottom:20px;
        }
        
        .btnLog
        {
            border:none;
            outline:none;
            height:40px;
            font-size:16px;
            color:#fff;
            background-color: rgb(255,9,9);
            cursor:pointer;
            border-radius:20px;
            transition: .3s ease-in-out;
        }

        .btnLog:hover{
            background-color: rgb(255, 217, 9);
        }
    </style>

</head>
<body class="loginStudent">

    <div class="container-fluid">
        <div class="row mt-5 mb-5">
            <div class="col-md-4">

            </div>
            <div class="col-md-4">
                <form id="loginForm" runat="server" autocomplete="off">
                    <!--<button onclick="window.history.go(-1); return false;" style="height:30px; width:50px;">back</button>-->
                    <input action="action" onclick="window.history.go(-1); return false;" type="submit" value="back"/>
                    <div>
                        <a href="StaffLogin.aspx" style="float:right; color:lightblue;"><b> STAFF Login </b></a>
                        
                    </div><br />
                    <div>
                        <a href="AdminLogin.aspx" style="float:right; color:lightblue;"><b> ADMIN Login </b></a>
                    </div><br />

                    <div class="imgContainer">
                        <img src="Asset/img/avatar.png" alt="Avatar" class="imgLog"/>  
                    </div><br />

                    <div style="text-align:center;font-family:Monaco;">
                        <span class="red">TAR</span>
                        <span class="blue">UMT</span>
                        <span class="stuText">Student Login</span>


                    </div>
                    <div class="mt-3">
                        <label for="" class="form-label" style="color:lightgray;"><b>User Name</b></label>
                        <asp:TextBox autofocus ID="txtUname" runat="server" placeholder="username" class="form-control"></asp:TextBox>
                    </div>
                    <div class="mt-3">
                        <label for="" class="form-label" style="color:lightgray;"><b>Password</b></label>
                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" placeholder="password" class="form-control" ></asp:TextBox>
                        <div id="showPass" style="float:right"> 
                           <input type="checkbox" onchange="document.getElementById('txtPwd').type = this.checked ? 'text' : 'password'"/>
                            <label for="" style="color:lightgray;"><b>Show Password</b></label> 
                        </div><br />
                        

                    </div>
                    
                    <div class="mt-3 d-grid">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btnLog" OnClientClick="checkExist()" OnClick="btnLogincheck"/>  
                    </div>
                   <!--<a href="ForgotPass.aspx" style="color:lightblue"><b>Forgot Password?</b></a><br />-->
                   <asp:Label ID="msgLogin" runat="server"></asp:Label>  
                   
                   <div class="col-md-4"></div>
                </form>
            </div>
            
        </div>
        
    </div>
    
</body>
</html>
