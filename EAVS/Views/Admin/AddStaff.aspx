<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="EAVS.Views.Admin.AddStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
             
        <script>
            function checkExist() {
                var sName = document.getElementById("<%= txtStaffName.ClientID %>").value;
                var sEmail = document.getElementById("<%= txtStaffEmail.ClientID %>").value;
                var sQual = document.getElementById("<%= txtStaffQuali.ClientID %>").value;
                //var sPhoto = document.getElementById("<%= FileUpload1.ClientID %>").value;
                var sGender = document.getElementById("<%= staffGenderDDL.ClientID %>").value;
                var sStand = document.getElementById("<%= staffStandardDDL.ClientID %>").value;
                var sFac = document.getElementById("<%= staffFacultyDDL.ClientID %>").value;
                var sUname = document.getElementById("<%= txtStaffUname.ClientID %>").value;
                var sPass = document.getElementById("<%= txtStaffPass.ClientID %>").value;

                var errMsg = "";
                
                if (sName == "") {
                    errMsg += "Please fill in staff name\n";
                }
                if (sEmail == "") {
                    errMsg += "Please fill in staff email\n";
                }
                if (sQual == "") {
                    errMsg += "Please fill in staff qualification\n";
                }
                /*
                if (sPhoto == "") {
                    errMsg += "Please choose photo\n";
                }
                */
                if (sGender == "") {
                    errMsg += "Please select gender\n";
                }
                if (sStand == "") {
                    errMsg += "Please select standard name\n";
                }
                if (sFac == "") {
                    errMsg += "Please select faculty name\n";
                }
                if (sUname == "") {
                    errMsg += "Please fill in staff username \n";
                }
                if (sPass == "") {
                    errMsg += "Please fill in staff password\n";
                }
                if (errMsg != "") {
                    alert(errMsg);
                }

            }
        </script>

        <script>
            function PrintPanel() {
                var panel = document.getElementById("<%=printStaff.ClientID %>");
                var printWindow = window.open('', '', 'height=400,width=800');
                printWindow.document.write('<html><head><title>Printing Staff List</title>');
                printWindow.document.write('</head>');
                printWindow.document.write('<body><h1>Staff List</h1>');
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
            <h3 class="text-center" style="color:white">Staff</h3>
        </div>
    </div>
    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> Manage Staff</b></u>
    </h5>

    <div class="container py-5">
        <div class="row">
            <div class="col-md-10 mx-auto">
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label style="color:darkblue">Staff Name:</label>
                        <asp:TextBox autofocus ID="txtStaffName" runat="server" placeholder="Enter staff name" class="form-control" MaxLength="50" onkeyup="this.value = this.value.toUpperCase();"></asp:TextBox>
                   </div>

                    <div class="col-sm-6">
                        <label style="color:darkblue">Email:</label>
                        <asp:TextBox ID="txtStaffEmail" runat="server" placeholder="Enter staff email" class="form-control" MaxLength="80" onkeyup="this.value = this.value.toLowerCase();"></asp:TextBox>
                
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-6">
                        <label style="color:darkblue">Qualification:</label>
                        <asp:TextBox ID="txtStaffQuali" runat="server" placeholder="Enter staff qualification" class="form-control" MaxLength="30" onkeyup="this.value = this.value.toUpperCase();"></asp:TextBox>

                    </div>
                    <div class="col-sm-6">
                            <label style="color:darkblue">Gender:</label>
                            <asp:DropDownList ID="staffGenderDDL" runat="server" class="form-control" style="text-align: center;">
                                <asp:ListItem Value="0" style="text-align: center;">Selection Gender</asp:ListItem>
                                <asp:ListItem Value="Male" style="text-align: center;">Male</asp:ListItem>
                                <asp:ListItem Value="Female" style="text-align: center;">Female</asp:ListItem>
                                <asp:ListItem Value="Other" style="text-align: center;">Other</asp:ListItem>

                            </asp:DropDownList>
                    </div>
                </div>
                    
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label style="color:darkblue">Photo:</label><br />
                        <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="15pt"  /><br />
                    </div>
                    <div class="col-sm-6">

                         <label style="color:darkblue">Standard Name:</label>
                         <asp:DropDownList ID="staffStandardDDL" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="standName" DataValueField="standName" style="text-align: center;"></asp:DropDownList>

                    </div>
                </div>

                
                    
                <div class="form-group row">
                    <div class="col-sm-6">

                         <label style="color:darkblue">Faculty Name:</label>
                        <asp:DropDownList ID="staffFacultyDDL" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="facName" DataValueField="facName" style="text-align: center;"></asp:DropDownList>
                    </div>
                    <div class="col-sm-6">
                        <label style="color:darkblue">Username:</label>
                        <asp:TextBox ID="txtStaffUname" runat="server" placeholder="Enter staff username" class="form-control" MaxLength="50" onkeyup="this.value = this.value.toLowerCase();"></asp:TextBox>

                    </div>
               </div>
                
              <div class="form-group row">
                    <div class="col-sm-6">
                        <label style="color:darkblue">Password:</label>
                        <asp:TextBox ID="txtStaffPass" runat="server" placeholder="Enter staff password" class="form-control"></asp:TextBox>

                    </div>
                </div>
            
                <div class="row mt-5">
                    <div class="col d-grid">
                        <asp:Button Text="Add" runat="server" class="btn-success btn-block btn" OnClientClick="checkExist()" OnClick="btnAddStaff" />
                    </div>
                    <div class="col d-grid">
                        <asp:Button Text="Reset" runat="server" class="btn-danger btn-block btn" OnClick="btnResetStaff"/>
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
                        <h3 class="text-center text-primary"><b>Staff Lists</b></h3>
                    </div>
                </div>
                <asp:Panel ID="printStaff" runat="server"> 
                <div style="width:100%; height:100%; overflow:scroll;">
                <asp:GridView ID="gridStaff" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="4" DataKeyNames="staffID" OnRowEditing="gridStaff_RowEditing" OnRowUpdating="gridStaff_RowUpdating" OnRowCancelingEdit="gridStaff_RowCancelingEdit" OnRowDeleting="gridStaff_RowDeleting" Width="618px" ShowHeaderWhenEmpty="True"  OnPageIndexChanged="gridStaff_PageIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="staffID" HeaderText="ID " ReadOnly="True" >
                            <HeaderStyle Font-Size="20pt" HorizontalAlign="Center" VerticalAlign="Middle" />
<ItemStyle Width="30px" HorizontalAlign="Center" Font-Size="15pt"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Photo">
                                <EditItemTemplate>
                                    <asp:Image ID="Image2" runat="server" Height="150px" ImageUrl='<%# String.Format("~/StaffPhoto/" + Eval("profilePicture")) %>' width="150px" />
                                    <br />
                                    <asp:FileUpload ID="FileUpload2" runat="server" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# String.Format("~/StaffPhoto/" + Eval("profilePicture")) %>' Width="150px" />
                                </ItemTemplate>
                                <HeaderStyle Font-Size="20pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="15pt" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="editStaffName" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="20pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="15pt" HorizontalAlign="Center" Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="editEmailtxt" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="20pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="15pt" HorizontalAlign="Center" Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender ">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editGddl" runat="server">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                        <asp:ListItem>Others</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="20pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="15pt" HorizontalAlign="Center" Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Standard Name ">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editstandNameDDL" runat="server" DataSourceID="SqlDataSource1" DataTextField="standName" DataValueField="standName" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("standName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="20pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Width="30px" HorizontalAlign="Center" Font-Size="15pt" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Faculty Name ">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editfacNameDDL" runat="server" DataSourceID="SqlDataSource2" DataTextField="facName" DataValueField="facName">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("facName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="20pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Width="30px" HorizontalAlign="Center" Font-Size="15pt" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qualification ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="editquatxt" runat="server" Text='<%# Bind("qualification") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("qualification") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="20pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="15pt" HorizontalAlign="Center" Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Username ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="edituname" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="20pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Font-Size="15pt" HorizontalAlign="Center" Width="30px" />
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" ShowEditButton="True">
                            <ControlStyle BackColor="#009933" ForeColor="White" />
                            <ItemStyle Font-Size="15pt" HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                            <ControlStyle BackColor="Red" ForeColor="White" />
                            <ItemStyle Font-Size="15pt" HorizontalAlign="Center" />
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
                    </div>
                    </asp:Panel>
            </div>
        </div>  

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT distinct([standName]) FROM [standard]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT distinct([facName]) FROM [faculty]"></asp:SqlDataSource>   

        <div class="row">
            <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
                <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>
            </div>
        </div>
        
    
</asp:Content>
