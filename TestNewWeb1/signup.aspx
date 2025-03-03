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

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />


    <style>
        .input-box {
            position: relative;
        }

        .input-group-append{
            position: absolute;
              top: 0;
              right: 0;
              height: 100%;
              border: none;
              background: transparent;
              cursor: pointer;
              z-index: 12;
        }
        .input-group-append span{
            border: none;
            background: transparent !important;
        }

    </style>

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

        
        <div id="errorAlert" class="alert alert-danger" role="alert" style="display:none;">
            Email already exists.
        </div>

        <form runat="server" onsubmit="return validateForm()">
            <div class="input-box">
                <input type="text" placeholder="Enter your name" id="name"  runat="server" required>
            </div>
            <div class="input-box">
                <input type="email" placeholder="Enter your email" id="email" runat="server" required>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Create password" id="password" runat="server" required>
                <div class="input-group-append">
                    <span class="input-group-text" onclick="togglePasswordVisibility('password')">
                        <i class="fas fa-eye" id="eyeIconpassword"></i>
                    </span>
                </div>
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
            function togglePasswordVisibility(inputId) {
                const input = document.getElementById(inputId);
                const eyeIconId = `eyeIcon${inputId}`; 
                const eyeIcon = document.getElementById(eyeIconId);

                if (!input || !eyeIcon) {
                    console.error("Input or eye icon not found!");
                    return;
                }

                if (input.type === "password") {
                    input.type = "text"; // Show password
                    eyeIcon.classList.remove("fa-eye");
                    eyeIcon.classList.add("fa-eye-slash"); // Change icon to "eye-slash" (with a line over it)
                } else {
                    input.type = "password"; // Hide password
                    eyeIcon.classList.remove("fa-eye-slash");
                    eyeIcon.classList.add("fa-eye"); // Change icon to "eye"
                }
            }
        </script>



<script>
    window.onload = function () {
        const urlParams = new URLSearchParams(window.location.search);
        const errorMessage = urlParams.get("Error");

        if (errorMessage) {
            showErrorAlert(errorMessage);
        }
    };

    function showErrorAlert(message) {
        var errorDiv = document.getElementById("errorAlert");
        errorDiv.innerText = message; // Set error message inside the div
        errorDiv.style.display = "block"; // Show the error div
    }

    function validateForm() {
        // Get form values
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirm_password').value;
        var termsChecked = document.querySelector('input[type="checkbox"]').checked;

        // Email validation (simple regex)
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            showErrorAlert("Please enter a valid email address.");
            return false;
        }

        // Password length validation
        if (password.length < 6) {
            showErrorAlert("Password must be at least 6 characters long.");
            return false;
        }

        // Confirm password check
        if (password !== confirmPassword) {
            showErrorAlert("Passwords do not match!");
            return false;
        }

        // Terms and conditions checkbox validation
        if (!termsChecked) {
            showErrorAlert("You must accept the terms and conditions.");
            return false;
        }

        return true; // Form will submit if all checks pass
    }
</script>


</body>
</html>
