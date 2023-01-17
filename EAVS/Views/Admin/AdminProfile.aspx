<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="EAVS.Views.Admin.AdminProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">

    <div class="row">
        <div class="col bg-warning">
            <h3 class="text-center" style="color:white;">Profile</h3>
        </div>
    </div>
    <br />
        
    <h5 class="text-left" style="color:darkblue">
        >>><u><b> My Profile Info</b></u>
    </h5>
    
    <br />

    <div class="row">
        <div class="col-5">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="257px" Width="707px" DataSourceID="SqlDataSource1" AutoGenerateRows="False" DataKeyNames="adminID" CellPadding="4" Font-Bold="False" Font-Italic="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
                <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <Fields>
                    <asp:BoundField DataField="adminID" HeaderText="Admin ID" ReadOnly="True" SortExpression="adminID" >
                    <ControlStyle Font-Bold="False" />
                    <HeaderStyle ForeColor="#3333CC" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Username" SortExpression="username">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUname" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUname" ErrorMessage="Username cannot be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle ForeColor="#3333CC" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password" SortExpression="password">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPass" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPass" ErrorMessage="Password cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle ForeColor="#3333CC" />
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <HeaderTemplate>
                    <center>
                        Profile's Details
                    </center>
                </HeaderTemplate>
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" HorizontalAlign="Center" ForeColor="#003399" />
            </asp:DetailsView>

            <br />
            

        </div>
    </div>

    <div class="row">
        <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" DeleteCommand="DELETE FROM [admin] WHERE [adminID] = @adminID" InsertCommand="INSERT INTO [admin] ([adminID], [username], [password]) VALUES (@adminID, @username, @password)" SelectCommand="SELECT * FROM [admin] WHERE ([username] = @username)" UpdateCommand="UPDATE [admin] SET [username] = @username, [password] = @password WHERE [adminID] = @adminID">
        <DeleteParameters>
            <asp:Parameter Name="adminID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="adminID" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="adminID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
