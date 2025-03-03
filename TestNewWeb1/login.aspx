<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TestNewWeb1.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" dir="ltr">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="assets/icon/favicon.ico" />

    <title> Login To Hexashop Ecommerce </title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">

    <link rel="stylesheet" href="assets/css/MyCSSCodes.css">

    <link rel="stylesheet" href="/assets/css/login_styles.css">
</head>
<body>

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <!-- ***** Preloader End ***** -->


    <div class="wrapper">
        <h2 class="login">Login</h2>

        <div id="errorAlert" class="alert alert-danger" role="alert" style="display:none;">
            Incorrect email or password. Please try again.
        </div>

        <!--<form action="#" method="post">-->
        <form runat="server">
        <!--<form method="post" action="@Url.Action( "Account", "Login")">-->
            <div class="input-box">
                <input type="text" placeholder="Enter your email" id="email" runat="server" required>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Password" id="password" runat="server" required>
            </div>
            <div class="input-box button">
                <!--<input type="Submit" value="Login">-->
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />

            </div>
            <div class="text">
                <h3>Create new account <a href="/signup.aspx">Sign up</a></h3>
            </div>
        </form>
    </div>



    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/accordions.js"></script>
    <script src="assets/js/datepicker.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/isotope.js"></script>

    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>

    <!-- <script src="assets/js/ErrorMessage.js"></script>  -->

    <script>

        //$(function () {
        //    var selectedClass = "";
        //    $("p").click(function () {
        //        selectedClass = $(this).attr("data-rel");
        //        $("#portfolio").fadeTo(50, 0.1);
        //        $("#portfolio div").not("." + selectedClass).fadeOut();
        //        setTimeout(function () {
        //            $("." + selectedClass).fadeIn();
        //            $("#portfolio").fadeTo(50, 1);
        //        }, 500);

        //    });
        //});


    </script>

    <script>
        // This script will be used to show the error alert if login fails
        function showErrorAlert() {
            document.getElementById("errorAlert").style.display = "block";
        }


        window.onload = function () {
            const urlParams = new URLSearchParams(window.location.search);
            const errorMessage = urlParams.get("Error");

            if (errorMessage) {
                showErrorAlert(); // Call the function to display the error alert
            }
        };


    </script>

</body>
</html>

