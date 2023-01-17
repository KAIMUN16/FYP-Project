<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddHall.aspx.cs" Inherits="EAVS.Views.Admin.AddHall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">

            <script>
        function checkExist() {
           
            var hallName = document.getElementById("<%= txtHallName.ClientID %>").value;
            var errMsg = "";

            if (hallName == "") {
                errMsg += "Please fill in course name\n";
            }
            if (errMsg != "") {
                alert(errMsg);
            }
            
        }
            </script>

        <script>
            function PrintPanel() {
                var panel = document.getElementById("<%=printHall.ClientID %>");
                var printWindow = window.open('', '', 'height=400,width=800');
                printWindow.document.write('<html><head><title>Printing Exam Hall List</title>');
                printWindow.document.write('</head>');
                printWindow.document.write('<body><h1>Hall List</h1>');
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
            <h3 class="text-center" style="color:white;">Exam Hall</h3>
        </div>
    </div>

    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> Manage Exam Hall</b></u>
    </h5>

    <div class="row">
        <div class="col-5">

            <div class="row mt-2">
                <div class="col">
                    <div class="mb-2"></div>
                    <label style="color:darkblue">Hall Name:</label>
                    <asp:TextBox ID="txtHallName" runat="server" class="form-control" placeholder="Enter the hall name"></asp:TextBox>
                    
                </div>
            </div>

            <div class="row mt-4">
                
                <div class="col d-grid">
                    <asp:Button ID="btnSave" Text="Save" runat="server" class="btn-success btn-block btn" OnClientClick="checkExist()" OnClick="btnSaveHall"/>
                </div>
                <div class="col d-grid">
                    <asp:Button ID="btnReset" Text="Reset" runat="server" class="btn-danger btn-block btn" OnClick="btnResetHall"/>
                </div>
                <div class="col d-grid">
                    <asp:Button ID="btnPrint" Text="Print" runat="server" class="btn-primary btn-block btn" OnClientClick="return PrintPanel();"/>
                </div>
                <asp:Label ID="lblErr" runat="server" ForeColor="#FF3300"></asp:Label>
            </div>

       </div>

       <div class="col-7">
            <div class="row">
                <div class="col">
                    <h4 class="text-center" style="color:darkblue;">
                        <b>Exam Hall Lists</b>
                    </h4>
                </div>
                <br />
                <asp:Panel ID="printHall" runat="server">
                        <asp:GridView ID="gridHall" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"  DataKeyNames="hallID" OnRowEditing="gridHall_RowEditing" OnRowUpdating="gridHall_RowUpdating" OnRowCancelingEdit="gridHall_RowCancelingEdit" OnRowDeleting="gridHall_RowDeleting" Width="749px" OnSelectedIndexChanging="gridHall_SelectedIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="hallID" HeaderText="ID" ReadOnly="True">
                                <HeaderStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="hallName" HeaderText="Hall Name" >
                                <HeaderStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:CommandField ShowEditButton="True">
                                <ControlStyle BackColor="#009933" Font-Size="12pt" ForeColor="White" />
                                </asp:CommandField>
                                <asp:CommandField ShowDeleteButton="True">
                                <ControlStyle BackColor="Red" Font-Size="12pt" ForeColor="White" />
                                </asp:CommandField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="18pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                </asp:Panel>
                </div>
           </div>
        </div>
    

    <div class="row">
        <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>
        </div>
    </div>

</asp:Content>
