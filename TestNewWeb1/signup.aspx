<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="TestNewWeb1.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en" dir="ltr"  xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="assets/icon/favicon.ico" />

    <title> Registration To Hexashop Ecommerce </title>


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
        <h2 class="signup">Registration</h2>
        <form runat="server" onsubmit="return validateForm()">
            <div class="input-box">
                <input type="text" placeholder="Enter your name" id="name"  runat="server" required>
            </div>
            <div class="input-box">
                <input type="text" placeholder="Enter your email" id="email" runat="server" required>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Create password" id="password" runat="server" required>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Confirm password" id="confirm_password" required>
            </div>
            <div class="policy">
                <input type="checkbox" required>
                <h3>I accept all terms & condition</h3>
            </div>
            <div class="input-box button">
                <asp:Button ID="btnSignup" runat="server" Text="Register Now" OnClick="btnSignup_Click" />
            </div>
            <div class="text">
                <h3>Already have an account? <a href="/login.aspx">Login now</a></h3>
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

    <script>

        $(function () {
            var selectedClass = "";
            $("p").click(function () {
                selectedClass = $(this).attr("data-rel");
                $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("." + selectedClass).fadeOut();
                setTimeout(function () {
                    $("." + selectedClass).fadeIn();
                    $("#portfolio").fadeTo(50, 1);
                }, 500);

            });
        });

    </script>

    <script>
        function validateForm() {
            // Get values of the password fields
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirm_password').value;

            // Check if passwords match
            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;  // Prevent form submission
            }

            // Check if the terms checkbox is checked
            var termsChecked = document.getElementById('terms').checked;
            if (!termsChecked) {
                alert("You must accept the terms and conditions.");
                return false;  // Prevent form submission
            }

            // If both checks pass, return true to allow form submission
            return true;
        }
    </script>

</body>
</html>
