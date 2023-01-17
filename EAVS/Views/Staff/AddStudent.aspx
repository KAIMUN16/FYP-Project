<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Staff/Staff.Master" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="EAVS.Views.Staff.AddStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StaffContent" runat="server">

        <script>
            function checkExist() {
                var sRoll = document.getElementById("<%= txtStuRoll.ClientID %>").value;
                var sName = document.getElementById("<%= txtStuName.ClientID %>").value;
                var sEmail = document.getElementById("<%= txtStuEmail.ClientID %>").value;              
                var sYear = document.getElementById("<%= stuYear.ClientID %>").value;
                var sFac = document.getElementById("<%= stuFacDDL.ClientID %>").value;
                var sClass = document.getElementById("<%= stuClassDDL.ClientID %>").value;
                var sUname = document.getElementById("<%= txtStuUname.ClientID %>").value;
                var sPass = document.getElementById("<%= txtStuPass.ClientID %>").value;

                var errMsg = "";
                
                if (sName == "") {
                    errMsg += "Please fill in student name\n";
                }
                if (sEmail == "") {
                    errMsg += "Please fill in student email\n";
                }
                if (sRoll == "") {
                    errMsg += "Please fill in student roll no\n";
                }      
                if (sYear == "") {
                    errMsg += "Please select year\n";
                }   
                if (sFac == "") {
                    errMsg += "Please select faculty name\n";
                }
                if (sClass == "") {
                    errMsg += "Please select class\n";
                }
                if (sUname == "") {
                    errMsg += "Please fill in student username \n";
                }
                if (sPass == "") {
                    errMsg += "Please fill in student password\n";
                }
                if (errMsg != "") {
                    alert(errMsg);
                }

            }
        </script>

    <script>
            function PrintPanel() {
                var panel = document.getElementById("<%=printStudent.ClientID %>");
                var printWindow = window.open('', '', 'height=400,width=800');
                printWindow.document.write('<html><head><title>Printing Student List</title>');
                printWindow.document.write('</head>');
                printWindow.document.write('<body><h1>Student List</h1>');
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
            <h3 class="text-center" style="color:white">Student</h3>
        </div>
    </div>
    <br />

    <h5 class="text-left" style="color:darkblue">            
        >>><u><b> Manage student</b></u>        
    </h5>

    <div class="container py-5">
        <div class="row">
            <div class="col-md-10 mx-auto">
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label style="color:darkblue">Roll No</label>
                        <asp:TextBox autofocus ID="txtStuRoll" runat="server" placeholder="Enter staff name" class="form-control" MaxLength="5" onkeyup="this.value = this.value.toUpperCase();"></asp:TextBox>
                   </div>

                    <div class="col-sm-6">
                        <label style="color:darkblue">Name:</label>
                        <asp:TextBox ID="txtStuName" runat="server" placeholder="Enter staff email" class="form-control" onkeyup="this.value = this.value.toUpperCase();"></asp:TextBox>
                
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-6">
                        <label style="color:darkblue">Faculty Name:</label><br />
                        <asp:DropDownList ID="stuFacDDL" runat="server" style="text-align: center;" DataSourceID="SqlDataSource4" DataTextField="facName" DataValueField="facName" class="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-sm-6">
                            <label style="color:darkblue">Year:</label>
                            <asp:DropDownList ID="stuYear" runat="server" class="form-control" style="text-align: center;">
                                <asp:ListItem Value="0" style="text-align: center;">Select Year</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                </div>
                    
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label style="color:darkblue">Class:</label><br />
                        <asp:DropDownList ID="stuClassDDL" runat="server" DataSourceID="SqlDataSource3" DataTextField="className" DataValueField="className" class="form-control" style="text-align: center;"></asp:DropDownList>
                    </div>
                    <div class="col-sm-6">
                         <label style="color:darkblue">Email:</label>
                        <asp:TextBox ID="txtStuEmail" runat="server" placeholder="Enter student email" class="form-control"></asp:TextBox>

                    </div>
                </div>

                
                    
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label style="color:darkblue">Username:</label>
                        <asp:TextBox ID="txtStuUname" runat="server" placeholder="Enter student username" class="form-control" MaxLength="50" onkeyup="this.value = this.value.toLowerCase();"></asp:TextBox>
                    </div>
                    <div class="col-sm-6">
                        <label style="color:darkblue">Password:</label>
                        <asp:TextBox ID="txtStuPass" runat="server" placeholder="Enter student password" class="form-control" MaxLength="50"></asp:TextBox>

                    </div>
               </div>
            
                <div class="row mt-5">
                    <div class="col d-grid">
                        <asp:Button Text="Add" runat="server" class="btn-success btn-block btn" OnClientClick="checkExist()" OnClick="btnAddStu" />
                    </div>
                    <div class="col d-grid">
                        <asp:Button Text="Reset" runat="server" class="btn-danger btn-block btn" OnClick="btnResetStu"/>
                    </div>
                    <div class="col d-grid">
                    <asp:Button ID="btnPrint" Text="Print" runat="server" class="btn-primary btn-block btn" OnClientClick="return PrintPanel();"/>
                </div>
                    <asp:Label ID="lblErr" runat="server" ForeColor="#FF3300"></asp:Label>                
                </div>

            </div>
        </div>
            
        <br />

            <div>
                <div class="row">
                    <div class="col">
                        <h3 class="text-center text-primary"><b>Student Lists</b></h3>
                    </div>
                </div>
                <asp:Panel ID="printStudent" runat="server"> 
                <asp:GridView ID="gridStudent" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="4" DataKeyNames="studentID" OnRowEditing="gridStudent_RowEditing" OnRowUpdating="gridStudent_RowUpdating" OnRowCancelingEdit="gridStudent_RowCancelingEdit" OnRowDeleting="gridStudent_RowDeleting" Width="1233px" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gridStudent_SelectedIndexChanged" OnPageIndexChanged="gridStudent_PageIndexChanged" EmptyDataText="No record data...">
                        <Columns>
                            <asp:BoundField DataField="studentID" HeaderText="ID " ReadOnly="True" >
                            <HeaderStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
<ItemStyle HorizontalAlign="Center" Font-Size="12pt"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Roll No">
                                <EditItemTemplate>
                                    <asp:TextBox ID="editRoll" runat="server" Text='<%# Bind("rollNo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("rollNo") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="editName" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Faculty Name ">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editFacddl" runat="server" DataSourceID="SqlDataSource2" DataTextField="facName" DataValueField="facName">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("facName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" Font-Size="12pt" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editClassddl" runat="server" DataSourceID="SqlDataSource5" DataTextField="className" DataValueField="className">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT [className] FROM [class]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("className") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Year">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editYearddl" runat="server">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("year") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="editEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Username ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="editUname" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="15pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="12pt" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" ShowEditButton="True">
                            <ControlStyle BackColor="#009933" ForeColor="White" />
                            <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                            <ControlStyle BackColor="Red" ForeColor="White" />
                            <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle HorizontalAlign="Center" />
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" HorizontalAlign="Center" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                    
                    </asp:Panel>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT distinct([standName]) FROM [standard]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT distinct([facName]) FROM [faculty]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT DISTINCT [className] FROM [class]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT * FROM [faculty]"></asp:SqlDataSource>
        


        <div class="row">
            <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
                <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>
            </div>
        </div>

</asp:Content>
