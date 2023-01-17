<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Staff/Staff.Master" AutoEventWireup="true" CodeBehind="ViewCourse.aspx.cs" Inherits="EAVS.Views.Staff.ViewCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StaffContent" runat="server">

    <script>
            function PrintPanel() {
                var panel = document.getElementById("<%=printCourse.ClientID %>");
                var printWindow = window.open('', '', 'height=400,width=800');
                printWindow.document.write('<html><head><title>Printing Course List</title>');
                printWindow.document.write('</head>');
                printWindow.document.write('<body><h1>Course List</h1>');
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
            <h3 class="text-center" style="color:white;">Course</h3>
        </div>
    </div>

    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> View course list</b></u>
    </h5>

    <div class="row">
        <div class="col-5">
            <div class="row mt-2">
                <div class="col">
                    <h4 style="color:darkblue"><b>Enroll Course Detail List</b></h4>
                    <asp:Panel ID="printCourse" runat="server">
                    <asp:GridView ID="gridClass" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" HorizontalAlign="Center" Width="1183px" AutoGenerateColumns="False" DataKeyNames="courseID" EmptyDataText="No data record." ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="courseID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="courseID" >
                            <HeaderStyle Font-Size="15pt" />
                            <ItemStyle Font-Size="12pt" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="crsCode" HeaderText="Course Code" SortExpression="crsCode" >
                            <HeaderStyle Font-Size="15pt" />
                            <ItemStyle Font-Size="12pt" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="crsName" HeaderText="Course Name" SortExpression="crsName" >
                            <HeaderStyle Font-Size="15pt" />
                            <ItemStyle Font-Size="12pt" HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="30px" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" VerticalAlign="Middle" />
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
        
    </div>
    
    <div class="row mt-4">
        <div class="col d-grid">
            <asp:Button ID="btnPrint" Text="Print" runat="server" class="btn-primary btn-block btn" style="width:100px;" OnClientClick="return PrintPanel();"/>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [course]"></asp:SqlDataSource>


    <div class="row">
        <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>
        </div>
    </div>
</asp:Content>
