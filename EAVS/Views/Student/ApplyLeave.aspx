<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Student/Student.Master" AutoEventWireup="true" CodeBehind="ApplyLeave.aspx.cs" Inherits="EAVS.Views.Student.ApplyLeave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StudentContent" runat="server">

    <script>
        function checkExist() {
            var calender = document.getElementById("<%= txtCal.ClientID %>").value;
            var reason = document.getElementById("<%= txtReason.ClientID %>").value;
            var days = document.getElementById("<%= dayDDL.ClientID %>").value;
                

            var errMsg = "";

            if (calender == "") {
                errMsg += "Please select date\n";
            }
            if (reason == "") {
                errMsg += "Please fill in reason\n";
            }
            if (days == "") {
                errMsg += "Please select days\n";
            }
           
            if (errMsg != "") {
                alert(errMsg);
            }

        }
    </script>


    <style>
      .btnLeave
      {
          width:200px;
          height:40px;
          color:#fff;  border:solid 2px #8506A9;
          background:#8506A9;
          transition: background .7s ease;
          border-radius:2px;
          cursor:pointer;
          font-size:15px;
      }
      .btnLeave:hover
      {
          width:200px;
          height:40px;
          color:#8506A9;
          background:#fff;
          border:solid 2px #8506A9;
      }
    </style>

    <div class="row">
        <div class="col bg-primary">
            <h3 class="text-center" style="color:white;">Attendance Leave</h3>
        </div>
    </div>

    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> Application for Student Attendance Leave</b></u>
    </h5>

    <div class="row">
        <div class="col-5">
            <asp:Button ID="btnNewLeave" runat="server" Text="Apply for leave" class="btnLeave" OnClick="btnNewLeave_Click"/>
            <asp:Button ID="btnViewApprove" runat="server" Text="Leave Status Report" class="btnLeave" OnClick="btnViewApprove_Click"/>
       </div>
    </div>
    &nbsp;

    <asp:MultiView ID="multiview" runat="server" OnActiveViewChanged="multiview_ActiveViewChanged">
        <asp:View ID="viewApply" runat="server">
           
            <!--<h5 style="color:darkblue; font-size:15px;">> Roll No: <asp:Label ID="showRoll" runat="server" Text="name" Font-Bold="true" style="font-size:15px;"></asp:Label></h5>-->
            <h5 style="color:darkblue; font-size:15px;">> Name: <asp:Label ID="showUname" runat="server" Text="name" Font-Bold="true" style="font-size:15px;"></asp:Label></h5>
            <h5 style="color:darkblue; font-size:15px;">> Class: <asp:Label ID="showClass" runat="server" Text="name" Font-Bold="true" style="font-size:15px;"></asp:Label></h5>

            <div style="color:darkblue; font-size:20px;"><b>Date:</b></div>
            <asp:TextBox ID="txtCal" runat="server" Width="120px" Height="30px" style="font-size:15px; text-align: center;"></asp:TextBox>&nbsp;<asp:ImageButton ID="imgCalendar" runat="server" Height="17px" Width="21px" OnClick="imgCalendar_Click" ImageUrl="~/Asset/img/calendar.png" CausesValidation="false"/>
            <asp:Calendar ID="leaveCalendar" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
            <div style="color:darkblue; font-size:20px;"><b>Reason:</b></div>
            <asp:TextBox ID="txtReason" runat="server" class="form-control" Height="60px" TextMode="MultiLine" Width="220px"></asp:TextBox>
            <div style="color:darkblue; font-size:20px;"><b>No of days:</b></div>
            <asp:DropDownList ID="dayDDL" runat="server" class="form-control" OnSelectedIndexChanged="dayDDL_SelectedIndexChanged" Width="200px" style="text-align: center;">
                <asp:ListItem Value="0">Select day</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn-primary btn-block btn" Width="120px" OnClientClick="checkExist()" OnClick="btnSubmit_Click"/>
        </asp:View>
        <asp:View ID="viewStatus" runat="server">
            <asp:GridView ID="gridShowApply" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="leaveID" DataSourceID="SqlDataSource1" ForeColor="#333333" Width="1304px" ShowHeaderWhenEmpty="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="sendDate" HeaderText="Date Submission" SortExpression="sendDate">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="Attendance Leave Period" SortExpression="date">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="noDays" HeaderText="Total Day of Leave" SortExpression="noDays">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="message" HeaderText="Reason of Leave" SortExpression="message">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="replyDate" HeaderText="Reply Date" SortExpression="replyDate">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <EmptyDataTemplate>
                    <center>
                        <asp:Label ID="lblNodata" runat="server" Text="No record found." Font-Bold="True" Font-Size="12pt" ForeColor="#999999"></asp:Label>
                    </center>
                </EmptyDataTemplate>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </asp:View>
        
    </asp:MultiView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT * FROM [leave] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row">
        <div class="col bg-primary" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>

        </div>
    </div>

</asp:Content>
