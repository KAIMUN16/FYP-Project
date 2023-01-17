<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewClass.aspx.cs" Inherits="EAVS.Views.Admin.ViewClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">

    <div class="row">
        <div class="col bg-warning">
            <h3 class="text-center" style="color:white;">Student Class</h3>
        </div>
    </div>

    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> View Student Class</b></u>
    </h5>

    <div class="row">
        <div class="col-5">
            <div class="row mt-2">
                <div class="col">
                    <h4 style="color:darkblue"><b>Student Class Detail List</b></h4>
                    <asp:GridView ID="gridClass" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" HorizontalAlign="Center" Width="608px" AutoGenerateColumns="False" DataKeyNames="classID" CellSpacing="1" EmptyDataText="No data record." PageIndex="4" PageSize="5" ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="classID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="classID" >
                            <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="className" HeaderText="Class Name" SortExpression="className" >
                            <ItemStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <EmptyDataRowStyle Font-Size="12pt" ForeColor="#999999" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" Font-Size="14pt" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [class]"></asp:SqlDataSource>


    <div class="row">
        <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>
        </div>
    </div>


</asp:Content>
