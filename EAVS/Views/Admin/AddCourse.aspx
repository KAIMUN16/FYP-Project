<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="EAVS.Views.Admin.AddCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">



        <script>
        function checkExist() {
            var courseCode = document.getElementById("<%= txtCourseCode.ClientID %>").value;
            var courseName = document.getElementById("<%= txtCourseName.ClientID %>").value;
            var errMsg = "";

            if (courseCode == "") {
                errMsg += "Please fill in course code\n";
            }
            if (courseName == "") {
                errMsg += "Please fill in course name\n";
            }
            if (errMsg != "") {
                alert(errMsg);
            }
            
        }
    </script>

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
            <h3 class="text-center" style="color:white;">Student Course</h3>
        </div>
    </div>

    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> Manage course</b></u>
    </h5>

    <div class="row">
        <div class="col-5">
            <div class="row mt-2">
                <div class="col">
                    <div class="mb-2"></div>
                    <label style="color:darkblue">Course Code:</label>
                    <asp:TextBox ID="txtCourseCode" runat="server" class="form-control" placeholder="Enter the course code" MaxLength="8" onkeyup="this.value = this.value.toUpperCase();"></asp:TextBox>
                    
                </div>
            </div>

            <div class="row mt-2">
                <div class="col">
                    <div class="mb-2"></div>
                    <label style="color:darkblue">Course Name:</label>
                    <asp:TextBox ID="txtCourseName" runat="server" class="form-control" placeholder="Enter the course name" MaxLength="50" onkeyup="this.value = this.value.toUpperCase();"></asp:TextBox>
                    
                </div>
            </div>

            <div class="row mt-4">
                
                <div class="col d-grid">
                    <asp:Button ID="btnSave" Text="Save" runat="server" class="btn-success btn-block btn" OnClientClick="checkExist()" OnClick="btnSaveCourse"/>
                </div>
                <div class="col d-grid">
                    <asp:Button ID="btnReset" Text="Reset" runat="server" class="btn-danger btn-block btn" OnClick="btnResetCourse"/>
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
                        <b>Course Lists</b>
                    </h4>
                </div>
                <br />
                <asp:Panel ID="printCourse" runat="server">
                        <asp:GridView ID="gridCourse" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"  DataKeyNames="courseID" OnRowEditing="gridCourse_RowEditing" OnRowUpdating="gridCourse_RowUpdating" OnRowCancelingEdit="gridCourse_RowCancelingEdit" OnRowDeleting="gridCourse_RowDeleting" Width="749px" AllowSorting="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="courseID" HeaderText="ID" ReadOnly="True">
                                <HeaderStyle Font-Size="18pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="crsCode" HeaderText="Course Code" >
                                <HeaderStyle Font-Size="18pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="14pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="crsName" HeaderText="Course Name">
                                <HeaderStyle Font-Size="18pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="14pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:CommandField ShowEditButton="True">
                                <ControlStyle BackColor="#009933" Font-Size="15pt" ForeColor="White" />
                                </asp:CommandField>
                                <asp:CommandField ShowDeleteButton="True">
                                <ControlStyle BackColor="Red" Font-Size="15pt" ForeColor="White" />
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
