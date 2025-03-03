<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="TestNewWeb1.Components.Header" %>

<link rel="stylesheet" href="assets/css/MyCSSCodes.css">

<style>
    .scroll-to-section{
        position: relative;
    }
    .N_orders {
        color: white;
        background-color: red;
        font-size: 12px;
        position: absolute;
        top: -7%;
        right: 4%;
        padding: 0 6px;
/*        width: 15px;
        height: 15px;*/
        border-radius: 50%;
        display: flex;
        align-items: center;
        align-content: center;
        margin: 0;
        font-weight: bold;
    }
</style>


<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/index.aspx" class="logo">
                        <img src="assets/images/logo.png">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="/index.aspx#top" class="active">Home</a></li>
                        <li class="scroll-to-section"><a href="/index.aspx#men">Men's</a></li>
                        <li class="scroll-to-section"><a href="/index.aspx#women">Women's</a></li>
                        <li class="scroll-to-section"><a href="/index.aspx#kids">Kid's</a></li>
                        <li class="submenu">
                            <a href="javascript:;">Pages</a>
                            <ul>
                                <li><a href="about.aspx">About Us</a></li>
                                <li><a href="products.aspx">Products</a></li>
                                <li><a href="single-product.aspx">Single Product</a></li>
                                <li><a href="contact.aspx">Contact Us</a></li>
                            </ul>
                        </li>
                        <li class="scroll-to-section"><a href="/index.aspx#explore">Explore</a></li>
                        <li class="scroll-to-section"  runat="server" id="DashboardBtn">
                            <a href="/AdminDashboard.aspx">Dashboard</a>

                        </li>
                        <li class="scroll-to-section" id="ordersPage"  runat="server">
                            <a href="orders.aspx">Orders</a>
                            <p class="N_orders" runat="server" id="N_Orders">0</p>
                        </li>
                        <li class="scroll-to-section-2" id="loginLink"  runat="server"><a href="login.aspx">Login</a></li>
                        <li class="scroll-to-section-2" id="signOut" runat="server">
                            <a href="./Logout.aspx">Sign out</a>
                        </li>
                        <li class="nav-item nav-profile" title="Profile Info" id="profileLogo" runat="server">
                            <a href="/Profile.aspx" style="padding:0;">
                                <img src="/assets/images/faces/face29.jpg" alt="profile">
                            </a>
                        </li>

                    </ul>        
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>