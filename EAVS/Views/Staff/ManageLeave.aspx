<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Staff/Staff.Master" AutoEventWireup="true" CodeBehind="ManageLeave.aspx.cs" Inherits="EAVS.Views.Staff.ManageLeave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StaffContent" runat="server">

    <div class="row">
        <div class="col bg-primary">
            <h3 class="text-center" style="color:white;">Leave</h3>
        </div>
    </div>

    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> Manage student attendance leave</b></u>
    </h5>

    <h6 style="color:darkred">Notice:: When student apply attendance leave then will shown here.</h6>

    <asp:GridView ID="gridStuleave" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="leaveID" DataSourceID="SqlDataSource1" EmptyDataText="No record for now." Font-Size="12pt" ForeColor="#999999" ShowHeaderWhenEmpty="True" Width="1325px">
        <Columns>
            <asp:BoundField DataField="leaveID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="leaveID" >
            <ItemStyle Font-Size="12pt" />
            </asp:BoundField>
            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" >
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="className" HeaderText="Class" SortExpression="className" >
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" >
            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="sendDate" HeaderText="Send Date" SortExpression="sendDate" >
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="noDays" HeaderText="No of days" SortExpression="noDays" >
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" >
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="message" HeaderText="Message" SortExpression="message" >
            <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <center>
                        <asp:LinkButton ID="linkApprove" runat="server" CommandName="Approve" ForeColor="#009933" OnClick="linkApprove_Click1">Approve</asp:LinkButton>
                    </center>
                </ItemTemplate>
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <center>
                        <asp:LinkButton ID="linkReject" runat="server" CommandName="Reject" ForeColor="Red" OnClick="linkReject_Click1">Reject</asp:LinkButton>
                    </center>
                </ItemTemplate>
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
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

    <div class="row">
        <div class="col bg-primary" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>

        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT leaveID, username, className, message, date, noDays, status, sendDate FROM leave WHERE (status = 'Pending')"></asp:SqlDataSource>

    </asp:Content>
