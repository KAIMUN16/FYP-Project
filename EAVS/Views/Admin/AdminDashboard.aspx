<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="EAVS.Views.Admin.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">

    <style>
        i h6{
            color:blue;
        }
    </style>

    <div class="row">
        <div class="col bg-warning">
                    
            <h3 class="text-center" style="color:white;">Dashboard</h3>
        </div>
    </div>

    <div class="container mt-5">

        <div class="row">
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-header bg-primary text-white">
                        <div class="row align-items-center">
                            <div class="col">
                                <i class="fa fa-university" style="font-size:80px;"></i>  
                            </div>
                            <div class="col">
                                <h3>
                                    <asp:Label ID="lblStandard" runat="server" class="display-2" Font-Bold="True" Font-Italic="True" ForeColor="White"></asp:Label>
                                </h3>
                                <h6><b>Standard</b></h6>
                            </div>

                        </div>

                    </div>
                    <div class="card-footer">
                        <h5>
                            <a href="Standard.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </h5>
                    </div>
                </div>
            </div>

            <!--
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-header bg-warning text-white">
                        <div class="row align-items-center">
                            <div class="col">
                                <i class="fa fa-certificate" style="font-size:80px;"></i>
                            </div>
                            <div class="col">
                                <h3>
                                    <asp:Label ID="lblDivision" runat="server" class="display-2" Font-Bold="True" Font-Italic="True" ForeColor="White">0</asp:Label>
                                </h3>
                                <h6><b>Division</b></h6>
                            </div>

                        </div>

                    </div>
                    <div class="card-footer">
                        <h5>
                            <a href="TestDivision.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </h5>
                    </div>
               </div>
            </div>
            -->

            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-header bg-success text-white">
                        <div class="row align-items-center">
                            <div class="col">
                                <i class="fa fa-archive" style="font-size:80px;"></i>
                            </div>
                            <div class="col">
                                <h3>
                                    <asp:Label ID="lblFaculty" runat="server" class="display-2"  Font-Bold="True" Font-Italic="True" ForeColor="White">0</asp:Label>
                                </h3>
                                <h6><b>Faculty</b></h6>
                            </div>

                        </div>

                    </div>
                    <div class="card-footer">
                        <h5>
                            <a href="Faculty.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </h5>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-header bg-danger text-white">
                        <div class="row align-items-center">
                            <div class="col">
                                <i class="fa fa-users" style="font-size:80px;"></i>
                            </div>
                            <div class="col">
                                <h3>
                                    <asp:Label ID="lblStaff" runat="server" class="display-2" Font-Bold="True" Font-Italic="True" ForeColor="White">0</asp:Label>
                                </h3>
                                <h6><b>Staff</b></h6>
                            </div>

                        </div>

                    </div>
                    <div class="card-footer">
                        <h5>
                            <a href="AddStaff.aspx" class="text-primary">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </h5>
                    </div>
                </div>
            </div>

            <!--
           <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-header bg-primary text-white">
                        <div class="row align-items-center">
                            <div class="col">
                                <i class="fa fa-graduation-cap fa-4x" style="font-size:80px;"></i>
                            </div>
                            <div class="col">
                                <h3>
                                    <asp:Label ID="lblStudent" runat="server" class="display-2" Font-Bold="True" Font-Italic="True" ForeColor="White">0</asp:Label>
                                </h3>
                                <h6><b>Student</b></h6>
                            </div>

                        </div>

                    </div>
                    <div class="card-footer">
                        <h5>
                            <a href="#" class="text-primary">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </h5>
                    </div>
                </div>
            </div>
            -->

            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-header bg-warning text-white">
                        <div class="row align-items-center">
                            <div class="col">
                                <i class="fa fa-certificate" style="font-size:80px;"></i>
                            </div>
                            <div class="col">
                                <h3>
                                    <asp:Label ID="lblCourse" runat="server" class="display-2" Font-Bold="True" Font-Italic="True" ForeColor="White">0</asp:Label>
                                </h3>
                                <h6><b>Course</b></h6>
                            </div>

                        </div>

                    </div>
                    <div class="card-footer">
                        <h5>
                            <a href="AddCourse.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </h5>
                    </div>
               </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-header bg-success text-white">
                        <div class="row align-items-center">
                            <div class="col">
                                <i class="fa fa-certificate" style="font-size:80px;"></i>
                            </div>
                            <div class="col">
                                <h3>
                                    <asp:Label ID="lblClass" runat="server" class="display-2" Font-Bold="True" Font-Italic="True" ForeColor="White">0</asp:Label>
                                </h3>
                                <h6><b>Class</b></h6>
                            </div>

                        </div>

                    </div>
                    <div class="card-footer">
                        <h5>
                            <a href="ViewClass.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </h5>
                    </div>
               </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-header bg-danger text-white">
                        <div class="row align-items-center">
                            <div class="col">
                                <i class="fa fa-archive" style="font-size:80px;"></i>
                            </div>
                            <div class="col">
                                <h3>
                                    <asp:Label ID="lblHall" runat="server" class="display-2" Font-Bold="True" Font-Italic="True" ForeColor="White">0</asp:Label>
                                </h3>
                                <h6><b>Exam Hall</b></h6>
                            </div>

                        </div>

                    </div>
                    <div class="card-footer">
                        <h5>
                            <a href="AddHall.aspx" class="text-primary">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </h5>
                    </div>
                </div>
            </div>

        </div>
    </div>
 

    <div class="row">
        <div class="col bg-warning" style="bottom:0px; position:fixed; width:90%; overflow:hidden;">
            <h3 class="text-center" style="font-size:17px; color:white;">Copyright@LEE KAI MUN All Right Reserved</h3>
        </div>
    </div>

</asp:Content>
