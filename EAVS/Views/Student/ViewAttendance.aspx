<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Student/Student.Master" AutoEventWireup="true" CodeBehind="ViewAttendance.aspx.cs" Inherits="EAVS.Views.Student.ViewAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StudentContent" runat="server">

    <div class="row">
        <div class="col bg-primary">
            <h3 class="text-center" style="color:white;">Attendance</h3>
        </div>
    </div>
    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> Attendance Details</b></u>
    </h5>

    <div class="row">
        <h6 style="color:darkred">Notice:: When staff updated your attendance, refresh the page to view the latest attendance list</h6>
        <br />
        <asp:GridView ID="gridViewAtt" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="1362px" EmptyDataText="No record found." Font-Size="15pt" ForeColor="Red" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="date" HeaderText="Date">
                <HeaderStyle Font-Size="16pt" HorizontalAlign="Left" VerticalAlign="Middle" Width="300px" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" Width="300px" />
                </asp:BoundField>
                <asp:BoundField DataField="staffName" HeaderText="Attendance by">
                <HeaderStyle Font-Size="16pt" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                <ItemStyle Font-Size="12pt" Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="Status">
                <HeaderStyle Font-Size="16pt" Width="150px" />
                <ItemStyle Font-Size="12pt" Width="150px" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT * FROM [attendance]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT [username] FROM [staff]"></asp:SqlDataSource>


    <div class="row">
        <div class="col bg-primary" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3></div>
    </div>

   

    </asp:Content>
