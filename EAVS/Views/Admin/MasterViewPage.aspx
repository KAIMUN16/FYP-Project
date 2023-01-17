<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="MasterViewPage.aspx.cs" Inherits="EAVS.Views.Admin.MasterViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">


    <script>

        function PrintPanel() {
            var panel = document.getElementById("<%=printResult.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
                printWindow.document.write('<html><head><title>Printing Searhing Result</title>');
                printWindow.document.write('</head>');
                printWindow.document.write('<body><h1>Print search result</h1>');
                printWindow.document.write(panel.innerHTML);
                printWindow.document.write('</body></html>');
                printWindow.document.close();
                setTimeout(function () {
                    printWindow.print();
                }, 500);
                return false;
            }

    </script>

    <div class="row">
        <div class="col bg-warning">           
            <h3 class="text-center" style="color:white;">Search & Print</h3>
        </div>
    </div>

    <br />

    <!-- Click Dropdownlist to show gridview based on selected value = view student, view course, view staff -->
    <div class="row">
            <h5 style="color:darkblue; font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">>>> <u><b>Search with selection</b></u></h5>
            <br />
            <asp:DropDownList ID="showdatagrid" runat="server" class="form-control" Height="50px" Width="400px">
                <asp:ListItem>Standard</asp:ListItem>
                <asp:ListItem>Faculty</asp:ListItem>
                <asp:ListItem>Staff</asp:ListItem>
                <asp:ListItem>Student</asp:ListItem>
                <asp:ListItem>Leave</asp:ListItem>

            </asp:DropDownList>
        
        &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="btn-success btn-block btn" Height="50px" Width="200px"/><br />
        &nbsp;<asp:Button ID="btnPrint" Text="Print" runat="server" class="btn-primary btn-block btn" OnClientClick="return PrintPanel();" Height="50px" Width="200px"/>
        <br /><br />    
        <asp:Panel ID="printResult" runat="server"> 
        
        <asp:GridView ID="gridStandard" runat="server" OnRowCancelingEdit="gridStandard_RowCancelingEdit" OnRowDeleting="gridStandard_RowDeleting" OnRowEditing="gridStandard_RowEditing" OnRowUpdating="gridStandard_RowUpdating" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="1385px" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="standID" HeaderText="ID">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="standName" HeaderText="Standard Name">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Font-Size="18pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:GridView ID="gridStudent" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="1390px" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="studentID" HeaderText="ID">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="rollNo" HeaderText="Roll No">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="className" HeaderText="Class">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="facName" HeaderText="Faculty">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="year" HeaderText="Year">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="Email">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="username" HeaderText="Username">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="password" HeaderText="Password">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Font-Size="18pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:GridView ID="gridFac" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="1385px" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="facultyID" HeaderText="ID">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="facName" HeaderText="Faculty Name">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Font-Size="18pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:GridView ID="gridStaff" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="1390px" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("profilePicture") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# String.Format("~/StaffPhoto/" + Eval("profilePicture")) %>' Height="100px" Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="staffID" HeaderText="ID">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="Staff Name">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="gender" HeaderText="Gender">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="standName" HeaderText="Standard">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="facName" HeaderText="Faculty">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="Email">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="qualification" HeaderText="Qualification">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="profilePicture" HeaderText="Photo Name">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="username" HeaderText="Username">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="password" HeaderText="Password">
                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <EmptyDataTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# String.Format("~/StaffPhoto/" + Eval("profilePicture")) %>' />
            </EmptyDataTemplate>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Font-Size="18pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
            
            <asp:GridView ID="gridLeave" runat="server" CellPadding="3" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="1392px">
                <Columns>
                    <asp:BoundField DataField="leaveID" HeaderText="ID">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="username" HeaderText="Student Name">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="className" HeaderText="Class">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="message" HeaderText="Message by Student">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="Date">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="noDays" HeaderText="No of Days">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="Status">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="sendDate" HeaderText="Send Date by Student">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="replyDate" HeaderText="Reply Date by Staff">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="staffName" HeaderText="Staff">
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Right" VerticalAlign="Middle" />
                    <ItemStyle Font-Size="12pt" HorizontalAlign="Right" VerticalAlign="Middle" />
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
        </asp:Panel>
        
    </div>
    
    <div class="row">
        <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>
        </div>
    </div>


</asp:Content>
