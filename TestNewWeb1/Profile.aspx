<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TestNewWeb1.Profile" %>
<%@ Register Src="~/Components/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Components/Subscribe.ascx" TagPrefix="uc" TagName="Subscribe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="icon" type="/image/x-icon" href="assets/icon/favicon.ico" />
    
    <title>Hexashop - About Page</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">


            <link rel="stylesheet" href="/assets/css/ProductsIteme.css">


    <!-- plugins:css -->
    <link rel="stylesheet" href="/DashBoardStyles/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="/DashBoardStyles/vendors/base/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/DashBoardStyles/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


            <!-- SweetAlert2 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.0/dist/sweetalert2.min.css">

        <!-- SweetAlert2 JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.0/dist/sweetalert2.all.min.js"></script>


            <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">


            <style>
        .input-group-text {
            cursor: pointer; /* Change cursor to pointer on hover */
            background-color: #fff; /* Match the input background */
            border-left: none; /* Remove left border for seamless integration */
            padding: 0 15px !important;
        }


        .input-group-text:hover {
            background-color: #f8f9fa; /* Light hover effect */
        }

        .fa-eye-slash {
            color: #6c757d; /* Gray color for the eye-slash icon */
        }

        .fa-eye {
            color: #6c757d; /* Gray color for the eye icon */
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
    
    
    <!-- ***** Header Area Start ***** -->
    <uc:Header ID="HeaderControl" runat="server" />
    <!-- ***** Header Area End ***** -->

        
        <div class="content-wrapper" style="margin-top: 80px;">
          <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Update FORM</h4>
                  <p class="card-description">
                    Profile Info
                  </p>
                  <form class="forms-sample">

                    <input hidden id="UserId" runat="server" />
                    <input type="hidden" id="hiddenPassword" runat="server" />
                    
                  <div class="form-group">
                      <label for="exampleInputUsername1">Username</label>
                      <input type="text" class="form-control" placeholder="Username"
                          runat="server" id="username" required>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Email address</label>
                      <input type="email" class="form-control" placeholder="Email"
                          runat="server" id="email" required>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">Password</label>
                        <div class="input-group">
                            <input type="password" id="inputPassword" class="form-control" 
                                placeholder="Password" required="" runat="server">
                            <div class="input-group-append">
                                <span class="input-group-text" onclick="togglePasswordVisibility('inputPassword')">
                                    <i class="fas fa-eye" id="eyeIconinputPassword"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary me-2"
                        runat="server" id="UpdateButton"
                        onclick="updateProfile(); return false;">Update</button>
                    <button class="btn btn-light"
                        runat="server" id="CancelButton"
                        >Cancel</button>
                  </form>
                </div>
              </div>
            </div>
            
          </div>
        </div>
        <!-- content-wrapper ends -->

      


    <!-- ***** Subscribe Area Starts ***** -->
    <uc:Subscribe ID="SubscribeControl" runat="server" />
    <!-- ***** Subscribe Area Ends ***** -->

    <!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="first-item">
                        <div class="logo">
                            <img src="assets/images/white-logo.png" alt="hexashop ecommerce templatemo">
                        </div>
                        <ul>
                            <li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</a></li>
                            <li><a href="#">hexashop@company.com</a></li>
                            <li><a href="#">010-020-0340</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <h4>Shopping &amp; Categories</h4>
                    <ul>
                        <li><a href="#">Men’s Shopping</a></li>
                        <li><a href="#">Women’s Shopping</a></li>
                        <li><a href="#">Kid's Shopping</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><a href="#">Homepage</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Help &amp; Information</h4>
                    <ul>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">FAQ's</a></li>
                        <li><a href="#">Shipping</a></li>
                        <li><a href="#">Tracking ID</a></li>
                    </ul>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. 
                        
                        <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a></p>
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    

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

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>


    <script>
        function togglePasswordVisibility(inputId) {
            console.log("Input ID:", inputId); // Debugging
            const input = document.getElementById(inputId);
            const eyeIconId = `eyeIcon${inputId}`; // Generate the correct ID
            console.log("Eye Icon ID:", eyeIconId); // Debugging
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


        window.onload = function (e) {
            document.getElementById("inputPassword").value = document.getElementById("hiddenPassword").value;
        }

    </script>


        <script>
            function updateProfile() {
                var userId = document.getElementById('<%= UserId.ClientID %>').value;
               var username = document.getElementById('<%= username.ClientID %>').value;
               var email = document.getElementById('<%= email.ClientID %>').value;
               var password = document.getElementById('<%= inputPassword.ClientID %>').value;

               console.log("Password:", password); // Debugging

               $.ajax({
                   type: "POST",
                   url: "Profile.aspx/UpdateProfile",
                   data: JSON.stringify({
                       userId: userId,
                       username: username,
                       email: email,
                       password: password
                   }),
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: function (response) {
                       var responseData = JSON.parse(response.d);  // Parse the response data

                       if (responseData.success) {
                           Swal.fire({
                               title: 'Success!',
                               text: responseData.message,
                               icon: 'success',
                               confirmButtonText: 'OK'
                           }).then((res) => {
                               location.reload(); // Reload the page after successful update
                           });
                       } else {
                           // Check if the redirectTo key exists in responseData
                           if (responseData.redirectTo) {
                               window.location.href = responseData.redirectTo; // Redirect to login page
                           } else {
                               Swal.fire({
                                   title: 'Error!',
                                   text: responseData.message,  // Show the error message from the response
                                   icon: 'error',
                                   confirmButtonText: 'Close'
                               });
                           }
                       }
                   },
                   error: function (xhr, status, error) {
                       Swal.fire({
                           title: 'Error!',
                           text: 'An error occurred while processing your request.',
                           icon: 'error',
                           confirmButtonText: 'Close'
                       });
                   }
               });
           }



        </script>

  </body>

</html>
