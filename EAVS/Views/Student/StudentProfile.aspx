<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Student/Student.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="EAVS.Views.Student.StudentProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 173px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StudentContent" runat="server">

    <div class="row">
        <div class="col bg-primary">
            <h3 class="text-center" style="color:white;">Profile</h3>
        </div>
    </div>

    <br />

    <h4 class="text-left" style="color:darkblue">
        >>><u><b> My Profile</b></u>
    </h4>

    <br />

    <asp:DetailsView ID="DetailsView1" runat="server" Height="213px" Width="646px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateRows="False" DataKeyNames="studentID">
        <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="studentID" HeaderText="Student ID:" InsertVisible="False" ReadOnly="True" SortExpression="studentID" >
            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="rollNo" HeaderText="Roll No:" SortExpression="rollNo" >
            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="Full Name:" SortExpression="name" >
            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="year" HeaderText="Year:" SortExpression="year" >
            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="Email:" SortExpression="email" >
            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="facName" HeaderText="Faculty:" SortExpression="facName" >
            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="className" HeaderText="Class:" SortExpression="className" >
            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="username" HeaderText="Username:" SortExpression="username" >
            <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
        </Fields>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <center>Profile Info</center>
        </HeaderTemplate>
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
    </asp:DetailsView>

    <br />

    <div class="row">
        <div class="col bg-primary" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3></div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT [facName], [studentID], [rollNo], [name], [year], [email], [username], [className] FROM [student] WHERE ([username] = @username)" DeleteCommand="DELETE FROM [student] WHERE [studentID] = @studentID" InsertCommand="INSERT INTO [student] ([facName], [rollNo], [name], [year], [email], [username], [className]) VALUES (@facName, @rollNo, @name, @year, @email, @username, @className)" UpdateCommand="UPDATE [student] SET [facName] = @facName, [rollNo] = @rollNo, [name] = @name, [year] = @year, [email] = @email, [username] = @username, [className] = @className WHERE [studentID] = @studentID">
        <DeleteParameters>
            <asp:Parameter Name="studentID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="facName" Type="String" />
            <asp:Parameter Name="rollNo" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="year" Type="Int32" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="className" Type="String" />

        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="facName" Type="String" />
            <asp:Parameter Name="rollNo" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="year" Type="Int32" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="className" Type="String" />
            <asp:Parameter Name="studentID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>
