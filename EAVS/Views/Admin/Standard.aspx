<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Standard.aspx.cs" Inherits="EAVS.Views.Admin.Standard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">

    <script>
        function checkExist() {
            var standardName = document.getElementById("<%= txtstandardName.ClientID %>").value;
            var errMsg = "";

            if (standardName == "") {
                errMsg += "Please fill in standard name\n";
            }
            if (errMsg != "") {
                alert(errMsg);
            }
            
        }
    </script>

    <script>
        function PrintPanel() {
            var panel = document.getElementById("<%=printStandard.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
                printWindow.document.write('<html><head><title>Printing Faculty List</title>');
                printWindow.document.write('</head>');
                printWindow.document.write('<body><h1>Standard List</h1>');
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
            <h3 class="text-center" style="color:white;">Standard</h3>
        </div>
    </div>

    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> Manage Standard</b></u>
    </h5>

    <div class="row">
        <div class="col-5">
            <div class="row mt-2">
                <div class="col">
                    <div class="mb-2"></div>
                    <label style="color:darkblue">Standard Name:</label>
                    <asp:TextBox ID="txtstandardName" runat="server" class="form-control" placeholder="Enter a standard name"></asp:TextBox>
                    
                </div>
            </div>

            <div class="row mt-2">
                
                <div class="col d-grid">
                    <asp:Button ID="btnSave" Text="Save" runat="server" class="btn-success btn-block btn" OnClientClick="checkExist()" OnClick="btnSaveStandard"/>
                </div>
                <div class="col d-grid">
                    <asp:Button ID="btnReset" Text="Reset" runat="server" class="btn-danger btn-block btn" OnClick="btnResetStandard"/>
                </div>
                <div class="col d-grid">
                    <asp:Button ID="btnPrint" Text="Print" runat="server" class="btn-primary btn-block btn" OnClientClick="return PrintPanel();" OnClick="btnPrint_Click"/>
                </div>
                <asp:Label ID="lblErr" runat="server" ForeColor="#FF3300"></asp:Label>
            </div>
        
          </div>
      

          <div class="col-7">
            <div class="row">
                <div class="col">
                    <h4 class="text-center" style="color:darkblue;">
                        <b>Standard Lists</b>
                    </h4>
                </div>
                <br />
                <asp:Panel ID="printStandard" runat="server">
                <asp:GridView ID="gridStandard" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="standID" OnRowEditing="gridStandard_RowEditing" OnRowUpdating="gridStandard_RowUpdating" OnRowCancelingEdit="gridStandard_RowCancelingEdit" OnRowDeleting="gridStandard_RowDeleting" Width="618px" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="standID" HeaderText="ID" ReadOnly="True" >
                            <ItemStyle Font-Size="15pt" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="standName" HeaderText="Standard Name" >
                            <ItemStyle Font-Size="15pt" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" >
                            <ControlStyle BackColor="#009933" ForeColor="White" />
                            <ItemStyle Font-Size="15pt" HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                            <ControlStyle BackColor="Red" ForeColor="White" />
                            <ItemStyle Font-Size="15pt" HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" Width="80px" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
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
