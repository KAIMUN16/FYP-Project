﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffLogout.aspx.cs" Inherits="EAVS.Views.Staff.StaffLogout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <center>
            <asp:Label ID="Label1" Text="Loggin Out Please Wait" runat="server" />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                        </asp:Timer>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </center>
    </form>
</body>
</html>
