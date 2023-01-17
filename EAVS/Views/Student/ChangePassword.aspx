<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Student/Student.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="EAVS.Views.Student.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StudentContent" runat="server">

    <div class="row">
        <div class="col bg-primary">
            <h3 class="text-center" style="color:white;">Manage Password</h3>
        </div>
    </div>

    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> Change Password</b></u>
    </h5>

        <div class="row mt-2">
            <div class="col">
                <label style="color:darkblue; font-size:20px;">Current password:</label>
                <asp:TextBox ID="txtOldpass" runat="server" class="form-control" placeholder="Current Password" Width="200px"></asp:TextBox>              
            </div>            
        </div>
        <div class="row mt-2">
            <div class="col">
                <label style="color:darkblue; font-size:20px;">New password:</label><br />
                <asp:TextBox ID="txtNewpass" runat="server" class="form-control" placeholder="New Password" Width="200px"></asp:TextBox>                         
            </div>            
        </div>
        <div class="row mt-2">
            <div class="col">
                <label style="color:darkblue; font-size:20px;">Confirm password:</label><br />
                <asp:TextBox ID="txtConpass" runat="server" class="form-control" placeholder="Confirm Password" Width="200px"></asp:TextBox>                
            </div>            
        </div>

        <div class="row mt-4">                    
            &nbsp;&nbsp;<asp:Button ID="btnSave" Text="Change" runat="server" class="btn-success btn-block btn" Width="100px" OnClientClick="checkExist()" OnClick="btnUpdatePass"/>                    
            &nbsp;<asp:Button ID="btnReset" Text="Reset" runat="server" class="btn-primary btn-block btn" Width="100px" OnClick="btnResetAll"/>
        </div>


    <div class="row">
        <div class="col bg-primary" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3></div>
    </div>

</asp:Content>
