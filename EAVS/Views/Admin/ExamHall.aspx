<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ExamHall.aspx.cs" Inherits="EAVS.Views.Admin.ExamHall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    
    <div class="row">
        <div class="col bg-warning">
            <h3 class="text-center">Exam Hall</h3>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-5">
              
            <div class="row mt-2">
                <div class="col">
                    <div class="mb-2"></div>
                    <label style="color:darkblue">Hall ID</label>
                    <asp:TextBox ID="txtHallID" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHallID" ErrorMessage="Please enter hall id" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                    <div class="mb-2"></div>
                    <label style="color:darkblue">Hall Name</label>
                    <asp:TextBox ID="txtHallName" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHallName" ErrorMessage="Please enter hall name" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                </div>
            </div>
            
            
            <div class="row mt-4">
                
                <div class="col d-grid">
                    <asp:Button ID="btnEdit" Text="Edit" runat="server" class="btn-primary btn-block btn" OnClick="btnEdit_Click"  />
                </div>
                <div class="col d-grid">
                    <asp:Button ID="btnReset" Text="Reset" runat="server" class="btn btn-block btn" OnClick="btnReset_Click"  />
                </div>
                <div class="col d-grid">
                    <asp:Button ID="btnSave" Text="Save" runat="server" class="btn-success btn-block btn" OnClick="btnSaveHall"/>
                </div>
                <div class="col d-grid">
                    <asp:Button ID="btnDelete" Text="Delete" runat="server" class="btn-danger btn-block btn" OnClientClick="return confirm('Are you sure to delete?');" OnClick="btnDelete_Click"  />
                </div>
                <asp:Label ID="lblErr" runat="server" ForeColor="#FF3300" ></asp:Label>
            </div>
            
        </div>
 

        <div class="col-7">
            <div class="row">
                <div class="col">
                    <h5 class="text-center text-danger">
                        <b>Exam Hall Lists</b>
                    </h5>

                </div>
            </div>

            <asp:GridView runat="server" ID="gridExamHall" class="table" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateSelectButton="True" AllowSorting="True" OnSelectedIndexChanged="gridExamHall_SelectedIndexChanged1" Width="642px">
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
        </div>
        
    </div>
        
</asp:Content>
