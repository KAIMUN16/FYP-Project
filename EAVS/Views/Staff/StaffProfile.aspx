<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Staff/Staff.Master" AutoEventWireup="true" CodeBehind="StaffProfile.aspx.cs" Inherits="EAVS.Views.Staff.StaffProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StaffContent" runat="server">

    <div class="row">
        <div class="col bg-warning">
            <h3 class="text-center" style="color:white;">Manage Profile</h3>
        </div>
    </div>
    <br />

    <style>
        h1{
            color:darkblue;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        }
        h3{

        }
    </style>

   <h5 class="text-left" style="color:darkblue">
        >>><u><b> My Profile</b></u>
    </h5>

    <p style="color:darkred; font-size:13px;"><img src="../../Asset/img/exclamationmark.png"/>Please click again "Profile" from sidebar to view the changes when you upload new profile photo.. Refresh page will not showing the update.</p>

    <div class="row">
        
        <asp:DetailsView ID="DetailsView1" runat="server" Height="231px" Width="324px" AutoGenerateRows="False" CellPadding="3" DataKeyNames="staffID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:TemplateField SortExpression="profilePicture">
                    <EditItemTemplate>
                        <asp:Image ID="Image2" runat="server" Height="62px" ImageUrl='<%# String.Format("~/StaffPhoto/" + Eval("profilePicture")) %>' Width="57px" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("profilePicture") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <center>
                            <asp:Image ID="Image1" runat="server" Height="120px" ImageUrl='<%# String.Format("~/StaffPhoto/" + Eval("profilePicture")) %>' Width="120px" />

                        </center>
                    </ItemTemplate>
                    <HeaderStyle Height="90px" Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="100px" />
                </asp:TemplateField>
                <asp:BoundField DataField="staffID" HeaderText="ID:" InsertVisible="False" ReadOnly="True" SortExpression="staffID" >
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="Name:" SortExpression="name" ReadOnly="True" >
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="standName" HeaderText="Standard:" SortExpression="standName" ReadOnly="True" >
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="facName" HeaderText="Faculty:" SortExpression="facName" ReadOnly="True" >
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="Email:" SortExpression="email" ReadOnly="True" >
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="gender" HeaderText="Gender:" SortExpression="gender" ReadOnly="True" >
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="qualification" HeaderText="Qualification:" SortExpression="qualification" ReadOnly="True" >
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
                <center>
                    Profile&#39;s Info

                </center>
            </HeaderTemplate>
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="#000066" />
        </asp:DetailsView> 
                    
    </div>

    <div class="row mt-3">            
        <h5 style="color:darkblue; font-size:17px;"><b>Change Photo:</b></h5>                             
        <asp:FileUpload ID="uploadNew" runat="server" Width="300px" style="font-size:15px;"/>                         
        <asp:Button ID="btnUpload" runat="server" Text="Upload Photo" class="form-control" Width="140px" style="font-size:15px;" OnClick="btnUpload_Click"/>                     
    </div>

    <div class="row">
        <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" DeleteCommand="DELETE FROM [staff] WHERE [staffID] = @staffID" InsertCommand="INSERT INTO [staff] ([name], [standName], [facName], [email], [gender], [qualification], [profilePicture], [username], [password]) VALUES (@name, @standName, @facName, @email, @gender, @qualification, @profilePicture, @username, @password)" SelectCommand="SELECT * FROM [staff] WHERE ([username] = @username)" UpdateCommand="UPDATE [staff] SET [name] = @name, [standName] = @standName, [facName] = @facName, [email] = @email, [gender] = @gender, [qualification] = @qualification, [profilePicture] = @profilePicture, [username] = @username, [password] = @password WHERE [staffID] = @staffID">
        <DeleteParameters>
            <asp:Parameter Name="staffID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="standName" Type="String" />
            <asp:Parameter Name="facName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="qualification" Type="String" />
            <asp:Parameter Name="profilePicture" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="standName" Type="String" />
            <asp:Parameter Name="facName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="qualification" Type="String" />
            <asp:Parameter Name="profilePicture" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="staffID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT * FROM [standard]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT * FROM [faculty]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT [profilePicture] FROM [staff] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="row">
        <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>
        </div>
    </div>

</asp:Content>
