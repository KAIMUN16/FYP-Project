<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testDARKMODE.aspx.cs" Inherits="EAVS.testDARKMODE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TEST DARK MODE</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
    <link rel="stylesheet" href="testDARK.css" />

</head>

<body>

    <nav class="sidebar close">
        <header>
            <div class="image-text">
                <span class="image">
                    <a href="AdminDashboard.aspx"><img src="../../Asset/img/tarucLOGO.png"></a>
                </span>

                <div class="text logo-text">
                    <span class="name" style="color:darkblue">EAVS</span>
                    <!--<span class="profession">Admin Side</span>-->
                    Hey!<asp:Label ID="showName" runat="server" Text="name" Font-Bold="true"></asp:Label>
                    <!--Show what time now-->
                    <i><h6 id="time"></h6></i>
                    <a href="Logout.aspx" class="btn btn-default btn-flat" style="color:blue;">Log out</a>
                </div>

            <i class='bx bx-chevron-right toggle'></i>
        </header>

        <div class="menu-bar">
            <div class="menu">

                <li class="search-box">
                    <i class='bx bx-search icon'></i>
                    <input type="text" placeholder="Search...">
                </li>

                <ul class="menu-links">


                    <li class="nav-link">
                        <a href="AdminDashboard.aspx">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">Home</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="Standard.aspx">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">Standard</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="TestDivision.aspx">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">Division</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="Faculty.aspx">
                            <i class='bx bx-bell icon'></i>
                            <span class="text nav-text">Faculty</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="AddStaff.aspx">
                            <i class='bx bx-bell icon'></i>
                            <span class="text nav-text">Staff</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="AddCourse.aspx">
                            <i class='bx bx-heart icon' ></i>
                            <span class="text nav-text">Course</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-pie-chart-alt icon'></i>
                            <span class="text nav-text">View Leave</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="ViewClass.aspx">
                            <i class='bx bx-pie-chart-alt icon'></i>
                            <span class="text nav-text">View Class</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="AdminProfile.aspx">
                            <i class='bx bx-user icon' ></i>
                            <span class="text nav-text">Profile</span>
                        </a>
                    </li>

                </ul>
            </div>

            <div class="bottom-content">
                <li class="">
                    <a href="#">
                        <i class='bx bx-log-out icon' ></i>
                        <span class="text nav-text">Logout</span>
                    </a>
                </li>

                <li class="mode">
                    <div class="sun-moon">
                        <i class='bx bx-moon icon moon'></i>
                        <i class='bx bx-sun icon sun'></i>
                    </div>
                    <span class="mode-text text">Dark mode</span>

                    <div class="toggle-switch">
                        <span class="switch"></span>
                    </div>
                </li>

            </div>
        </div>


        <script>
            const body = document.querySelector('body'),
                sidebar = body.querySelector('nav'),
                toggle = body.querySelector(".toggle"),
                searchBtn = body.querySelector(".search-box"),
                modeSwitch = body.querySelector(".toggle-switch"),
                modeText = body.querySelector(".mode-text");


            toggle.addEventListener("click", () => {
                sidebar.classList.toggle("close");
            })

            searchBtn.addEventListener("click", () => {
                sidebar.classList.remove("close");
            })

            modeSwitch.addEventListener("click", () => {
                body.classList.toggle("dark");

                if (body.classList.contains("dark")) {
                    modeText.innerText = "Light mode";
                } else {
                    modeText.innerText = "Dark mode";

                }
            });
        </script>

        <script>
            setInterval((() => time.innerText = new Date().toLocaleTimeString()), 1000)

        </script>

    </nav>

    <section class="home">
        <div class="text">
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col bg-warning">
                        <h3 class="text-center" style="color:white;">Dashboard</h3>
                    </div>
                </div>

            </form>
        </div>
    </section>
</body>
</html>
