<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidebar.ascx.cs" Inherits="TestNewWeb1.Components.Sidebar" %>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="/AdminDashboard.aspx">
                <i class="ti-shield menu-icon"></i>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/BestSales.aspx">
                <i class="ti-pie-chart menu-icon"></i>
                <span class="menu-title">Best Sales</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/Messages.aspx">
                <i class="ti-comment menu-icon"></i>
                <span class="menu-title">Messages</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <i class="ti-user menu-icon"></i>
                <span class="menu-title">User Pages</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item">
                        <a class="nav-link" href="/login.aspx">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/signup.aspx">Sign Up</a>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
</nav>
