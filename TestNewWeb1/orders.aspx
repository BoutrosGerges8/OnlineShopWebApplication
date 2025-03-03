<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="TestNewWeb1.orders" %>
<%@ Register Src="~/Components/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Components/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="icon" type="/image/x-icon" href="assets/icon/favicon.ico" />
    
    <title>Hexashop - User Orders</title>


        
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/assets/css/font-awesome.css">

    <link rel="stylesheet" href="/assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="/assets/css/owl-carousel.css">

    <link rel="stylesheet" href="/assets/css/lightbox.css">

    <link rel="stylesheet" href="/assets/css/MyCSSCodes.css">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">


        
    <!-- plugins:css -->
    <link rel="stylesheet" href="/DashBoardStyles/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="/DashBoardStyles/vendors/base/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/DashBoardStyles/css/style.css">


    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.0/dist/sweetalert2.min.css">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.0/dist/sweetalert2.all.min.js"></script>




    <style>
        .container-fluid{
            height: 100vh;
            display: flex;
            align-items: center;
        }
            .container-fluid .main-panel {
                width: 100%;
            }
    </style>

        <!--<style>
        /* The modal overlay covers the entire page */
        #modalOverlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }
        /* The enlarged image is centered */
        #modalOverlay img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            max-width: 80%;
            max-height: 80%;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
        }
        .QrImg {
            cursor: pointer;
        }
    </style> -->


        <style>
    /* The modal overlay covers the entire page */
    #modalOverlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.7);
        z-index: 1000;
        text-align: center;
    }
    /* The enlarged image is centered */
    #modalOverlay img {
        position: absolute;
        top: 40%; /* Adjusted to make space for the button */
        left: 50%;
        transform: translate(-50%, -50%);
        max-width: 80%;
        max-height: 80%;
        box-shadow: 0 0 10px rgba(0,0,0,0.5);
    }
    /* Style for the Save button */
    #saveButton {
        position: absolute;
        top: 75%; /* Positioned below the QR code */
        left: 50%;
        transform: translateX(-50%);
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    #saveButton:hover {
        background-color: #45a049;
    }
    .QrImg {
        cursor: pointer;
    }
</style>

<!-- Modal Overlay -->
<div id="modalOverlay">
    <img id="modalImage" src="" alt="Enlarged QR Code" />
    <button id="saveButton">Save</button>
</div>


        <link rel="stylesheet" href="/assets/css/ProductsIteme.css">

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

    <!-- <div id="modalOverlay">
        <img id="modalImage" src="""" alt="Enlarged QR Code" />
    </div> -->

    <div id="modalOverlay">
        <img id="modalImage" src="" alt="Enlarged QR Code" />
        <button id="saveButton">Save</button>
    </div>


    <!-- ***** Orders Start ***** -->
    <div class="container-fluid page-body-wrapper">
        <div class="main-panel">
            <div class="content-wrapper" style="padding-top:100px">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Orders Table</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Product Name</th>
                                                <th>Product Image</th>
                                                <th>Quantity</th>
                                                <th>Total Price</th>
                                                <th>Ordered Date</th>
                                                <th>Status</th>
                                                <th>QRCode</th>
                                                <th>Delete order</th>
                                            </tr>
                                        </thead>
                                        <tbody id="OrderesTable" runat="server">
                                            <!-- Rows will be populated dynamically from C# -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
          
                        </div>
                    </div>

                </div>
            </div>

        <!-- partial -->
        </div>
    </div>

    <!-- ***** Subscribe Area Starts ***** -->
    <div class="subscribe">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="section-heading">
                        <h2>By Subscribing To Our Newsletter You Can Get 30% Off</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                    <form id="subscribe" action="" method="get">
                        <div class="row">
                          <div class="col-lg-5">
                            <fieldset>
                              <input name="name" type="text" id="name" placeholder="Your Name" required="">
                            </fieldset>
                          </div>
                          <div class="col-lg-5">
                            <fieldset>
                              <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email Address" required="">
                            </fieldset>
                          </div>
                          <div class="col-lg-2">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-dark-button"><i class="fa fa-paper-plane"></i></button>
                            </fieldset>
                          </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-6">
                            <ul>
                                <li>Store Location:<br><span>Sunny Isles Beach, FL 33160, United States</span></li>
                                <li>Phone:<br><span>010-020-0340</span></li>
                                <li>Office Location:<br><span>North Miami Beach</span></li>
                            </ul>
                        </div>
                        <div class="col-6">
                            <ul>
                                <li>Work Hours:<br><span>07:30 AM - 9:30 PM Daily</span></li>
                                <li>Email:<br><span>info@company.com</span></li>
                                <li>Social Media:<br><span><a href="#">Facebook</a>, <a href="#">Instagram</a>, <a href="#">Behance</a>, <a href="#">Linkedin</a></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Subscribe Area Ends ***** -->

    <!-- ***** Footer Start ***** -->
    <uc:Footer ID="FooterControl" runat="server" />


    

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



        

    <script src="./DashBoardStyles/js/file-upload.js"></script>


    <!-- plugins:js -->
    <script src="/DashBoardStyles/vendors/base/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <script src="/DashBoardStyles/vendors/chart.js/Chart.min.js"></script>
    <script src="/DashBoardStyles/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="/DashBoardStyles/js/off-canvas.js"></script>
    <script src="/DashBoardStyles/js/hoverable-collapse.js"></script>
    <script src="/DashBoardStyles/js/template.js"></script>
    <script src="/DashBoardStyles/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="/DashBoardStyles/js/dashboard.js"></script>
    <!-- End custom js for this page-->

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

    <script type="text/javascript">
        function DeleteOrder(orderId) {
            return $.ajax({  // Return the AJAX promise
                type: "POST",
                url: "/orders.aspx/DeleteOrder",  // Correct URL for the WebMethod
                data: JSON.stringify({ orderId: orderId }), // Send the orderId as data
                contentType: "application/json; charset=utf-8",  // Ensure content type is set to JSON
                dataType: "json", // Expect JSON response
                success: function (response) {
                    if (response.d === "Success") {
                        location.reload(); // Reload the page immediately
                    } else {
                        Swal.fire({
                            title: 'Error!',
                            text: "Failed to delete the order",
                            icon: 'error',
                            confirmButtonText: 'Close'
                        });
                    }
                },
                error: function (xhr, status, error) {
                    // Handle error in AJAX call
                    Swal.fire({
                        title: 'AJAX Error',
                        text: "Error: " + error,
                        icon: 'error',
                        confirmButtonText: 'Close'
                    });
                }
            });
        }

        function confirmDelete(orderId) {
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to undo this action!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#d33",
                cancelButtonColor: "#3085d6",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    DeleteOrder(orderId);
                }
            });
        }
    </script>




<script>
    //// Select all QR code images with the class "QrImg"
    //var qrImages = document.querySelectorAll(".QrImg");

    //// Attach a click event listener to each QR code image
    //qrImages.forEach(function (img) {
    //    img.addEventListener("click", function () {
    //        // Get the current image source
    //        var src = this.src;
    //        // Set the modal image source to the same value
    //        document.getElementById("modalImage").src = src;
    //        // Display the modal overlay
    //        document.getElementById("modalOverlay").style.display = "block";
    //    });
    //});

    //// Hide the modal when clicking anywhere on the overlay
    //document.getElementById("modalOverlay").addEventListener("click", function () {
    //    this.style.display = "none";
    //});

</script>


        <script>
            // Select all QR code images with the class "QrImg"
            var qrImages = document.querySelectorAll(".QrImg");

            // Attach a click event listener to each QR code image
            qrImages.forEach(function (img) {
                img.addEventListener("click", function () {
                    // Get the current image source
                    var src = this.src;
                    // Set the modal image source to the same value
                    document.getElementById("modalImage").src = src;
                    // Display the modal overlay
                    document.getElementById("modalOverlay").style.display = "block";
                });
            });

            // Hide the modal when clicking anywhere on the overlay
            document.getElementById("modalOverlay").addEventListener("click", function (event) {
                if (event.target === this) { // Only hide if clicking on the overlay itself
                    this.style.display = "none";
                }
            });

            // Add functionality to the Save button
            document.getElementById("saveButton").addEventListener("click", function () {
                var imageSrc = document.getElementById("modalImage").src;
                var link = document.createElement("a");
                link.href = imageSrc;
                link.download = "QRCode.png"; // Default filename for the downloaded image
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            });
</script>




    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  </body>

</html>
