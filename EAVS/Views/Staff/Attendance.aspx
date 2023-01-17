<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Staff/Staff.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="EAVS.Views.Staff.Attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StaffContent" runat="server">

    <style>
        .style9
        {
            width: 100px;
            justify-content:left;
        }
    </style>


    <div class="row">
        <div class="col bg-warning">
            <h3 class="text-center" style="color:white;">Student Attendnace</h3>
        </div>
    </div>

    <div class="ml-auto" style="float:right; font-size:18px;">
        <b style="color:gray"><asp:Label ID="lblTimer" runat="server" Text="Lable"></asp:Label></b>
        <!--
        <asp:ScriptManager ID="ScripManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick"></asp:Timer>
                <asp:Label ID="lblTime" runat="server" Font-Bold="true"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
        -->
    </div>
    <br />

    <h5 class="text-left" style="color:darkblue">
        >>><u><b> Manage student attendance</b></u>
    </h5>
        
    <div class="row">                   
        <label style="color:darkblue; font-size:23px;"><b>Select Class:</b></label>                 
        &nbsp;<asp:DropDownList ID="classDDL" runat="server" class="form-control" Width="150px" OnSelectedIndexChanged="classDDL_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="className" DataValueField="className"></asp:DropDownList>
        &nbsp;<asp:Button ID="btnSearch" Text="Search" runat="server" class="btn-primary btn-block btn" Height="50px" Width="100px" OnClick="btnSearchClass"/> 
    </div>
    <br />
                
    <div class="row">
                    
        <div class="col">       
            <h5 class="text-left"  style="color:darkred">               
                <u>>>> <b>Search Result</b></u>                  
            </h5>        
        </div>
    </div>       
        <asp:MultiView ID="multiviewClass" runat="server" OnActiveViewChanged="multiviewClass_ActiveViewChanged" ActiveViewIndex="0">

                        
            <asp:View ID="viewClass" runat="server">
                
                <table class="style9">
                    <tr>
                        <td valign="top">        
                        <asp:GridView runat="server" ID="gridAttClass" CellPadding="2" AutoGenerateColumns="False" Width="570px" EmptyDataText="No such record found..." ShowHeaderWhenEmpty="True" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None" OnSelectedIndexChanged="gridAttClass_SelectedIndexChanged1">
                               
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:TemplateField HeaderText="Attendance Status">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="radioPresent" runat="server" ForeColor="Black" GroupName="status" Text="Present" />
                                        <asp:RadioButton ID="radioAbsence" runat="server" ForeColor="Black" GroupName="status" Text="Absence" />
                                        <asp:RadioButton ID="radioLeave" runat="server" ForeColor="Black" GroupName="status" Text="Leave" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="250px" />
                                    <ItemStyle Font-Bold="True" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="rollNo" HeaderText="Roll No" />
                                <asp:BoundField DataField="username" HeaderText="Student Name" />
                                <asp:BoundField DataField="className" HeaderText="Class" />
                            </Columns>
                        
                            <EmptyDataRowStyle Font-Bold="True" Font-Size="12pt" />
                        
                            <EmptyDataTemplate>
                                <asp:Label ID="lblNoRecord" runat="server" Text="&amp;nbsp;&amp;nbsp;No such record found...." Font-Bold="True" Font-Size="12pt" ForeColor="#FF6600"></asp:Label>
                            </EmptyDataTemplate>
                        
                            <FooterStyle BackColor="Tan" />
                    
                            <HeaderStyle BackColor="Tan" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="15pt" Width="200px" ForeColor="#993300" />
                    
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    
                            <RowStyle Font-Size="12pt" HorizontalAlign="Center" VerticalAlign="Middle" />
                    
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    
                            </asp:GridView>
                
                            </td>
                           <td valign="bottom">

                            <asp:Calendar ID="attCalendar" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" Width="400px" OnSelectionChanged="attCalendar_SelectionChanged" Visible="False" NextPrevFormat="FullMonth" TitleFormat="Month">
                
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Height="10pt" Font-Size="7pt" ForeColor="#333333" />
                    
                                <DayStyle Width="14%" />
                    
                                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    
                                <OtherMonthDayStyle ForeColor="#999999" />
                    
                                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    
                                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    
                                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                    
                                <TodayDayStyle BackColor="#CCCC99" />
                    
                                </asp:Calendar>
                
                            <asp:Button ID="btnaddatt" runat="server" class="btn-success btn-block btn" onclick="btnAddAtt" Text="ADD Attendance" style="font-size:12px;" Height="50px" Width="120px" Visible="False" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
                
            </asp:MultiView>
            
        

        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EavsConnectionString %>" SelectCommand="SELECT * FROM [class]"></asp:SqlDataSource>

    <div class="row">
        <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3></div>
    </div>

</asp:Content>
