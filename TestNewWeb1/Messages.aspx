<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="TestNewWeb1.Messages" %>
<%@ Register Src="/Components/Sidebar.ascx" TagPrefix="uc" TagName="Sidebar" %>
<%@ Register Src="/Components/AdminHeader.ascx" TagPrefix="uc" TagName="AdminHeader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="/assets/icon/favicon.ico" />

    <title>Administrator Dashboard</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/assets/css/font-awesome.css">

    <link rel="stylesheet" href="/assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="/assets/css/owl-carousel.css">

    <link rel="stylesheet" href="/assets/css/lightbox.css">

    <link rel="stylesheet" href="/assets/css/MyCSSCodes.css">

    <style>
        .table tbody td {
          max-width: 100px;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        .short-message {
          display: inline-block;
          max-width: 100px;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        .full-message {
          display: none; /* Hide the full message by default */
        }
    </style>

        <style>
        .search-container {
            position: relative;
            width: 300px;
        }

        #navbar-search-input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .search-options {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            background-color: #fff;
            border: 1px solid #ccc;
            border-top: none;
            border-radius: 0 0 4px 4px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .option {
            padding: 10px;
            cursor: pointer;
        }

        .option:hover {
            background-color: #f1f1f1;
        }
    </style>


    <link rel="stylesheet" href="/assets/css/ProductsIteme.css">


    <!-- plugins:css -->
    <link rel="stylesheet" href="/DashBoardStyles/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="/DashBoardStyles/vendors/base/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/DashBoardStyles/css/style.css">




    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.0/dist/sweetalert2.all.min.js"></script>
    <link rel="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" type="text/css" />

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



      <style>
        .table-responsive{
            max-height: 100vh;
        }
        .wholeText {
            max-width: 400px !important;
        }
    </style>


    <style>
        .modal {
    display: none;
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
    background-color: white;
    margin: 10% auto;
    padding: 20px;
    width: 50%;
    text-align: center;
    border-radius: 5px;
}

.close {
    color: red;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
}

    </style>

    <style>
        /* Modal Overlay */
        #modalOverlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }

        /* Modal Content */
        #modalOverlay > div {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Message Text */
        #modalMessage {
            font-size: 16px;
            color: black;
            word-wrap: break-word;
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



    <!-- Modal Overlay -->
<div id="modalOverlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.7); z-index: 1000;">
    <!-- Modal Content -->
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: white; padding: 20px; border-radius: 5px; max-width: 500px; width: 100%;">
        <div id="modalMessage" style="font-size: 16px; color: black;"></div>
    </div>
</div>

    

    <div class="container-scroller">

        <!-- ***** Header Area Start ***** -->
        <uc:AdminHeader runat="server" ID="AdminHeaderControl" />
        <!-- ***** Header Area End ***** -->

        <div class="container-fluid page-body-wrapper">


            <!-- partial:../../partials/_sidebar.html -->
            <uc:Sidebar runat="server" ID="SidebarControl" />


            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    

                <div class="row">
                    <div class="row">
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title mb-0">Messages</p>
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Message</th>
                                                    <th>Country</th>
                                                    <th>City</th>
                                                    <th>Region</th>
                                                    <th>Timezone</th>
                                                    <th>Submitted At</th>
                                                </tr>
                                            </thead>
                                            <tbody runat="server" id="tableBodyMessages">
                                                <!-- Rows will be dynamically inserted here -->
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
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->

    </div>
        

            
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <!-- jQuery -->
        <script src="/assets/js/jquery-2.1.0.min.js"></script>

        <!-- Bootstrap -->
        <script src="/assets/js/popper.js"></script>
        <script src="/assets/js/bootstrap.min.js"></script>

        <!-- Plugins -->
        <script src="/assets/js/owl-carousel.js"></script>
        <script src="/assets/js/accordions.js"></script>
        <script src="/assets/js/datepicker.js"></script>
        <script src="/assets/js/scrollreveal.min.js"></script>
        <script src="/assets/js/waypoints.min.js"></script>
        <script src="/assets/js/jquery.counterup.min.js"></script>
        <script src="/assets/js/imgfix.min.js"></script>
        <script src="/assets/js/slick.js"></script>
        <script src="/assets/js/lightbox.js"></script>
        <script src="/assets/js/isotope.js"></script>
        <script src="/assets/js/quantity.js"></script>

        <!-- Global Init -->
        <script src="assets/js/custom.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



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


          <script src="/DashBoardStylesjs/off-canvas.js"></script>
          <script src="/DashBoardStyles/js/hoverable-collapse.js"></script>
          <script src="/DashBoardStyles/js/todolist.js"></script>
        <script src="/DashBoardStyles/js/chart.js"></script>





        

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
        <script src="assets/js/quantity.js"></script>

        <!-- Global Init -->
        <script src="assets/js/custom.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>





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
        <script src="/DashBoardStyles/js/todolist.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src="/DashBoardStyles/js/dashboard.js"></script>
        <!-- End custom js for this page-->

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
            function showFullMessage(fullMessage) {
                // Find the closest parent <td> element
                const tdElement = event.target.closest('td');

                // Find the short message and full message elements within the same <td>
                const shortMessage = tdElement.querySelector('.short-message');
                const fullMessageElement = tdElement.querySelector('.full-message');

                // Toggle visibility
                if (shortMessage.style.display === 'none') {
                    shortMessage.style.display = 'inline-block';
                    fullMessageElement.style.display = 'none';
                    event.target.textContent = 'Read More';
                } else {
                    shortMessage.style.display = 'none';
                    fullMessageElement.style.display = 'inline-block';
                    event.target.textContent = 'Read Less';
                }
            }
        </script>


        <script>
            // Select all table cells with the class "read-more"
            var readMoreCells = document.querySelectorAll("td.read-more");

            // Attach a click event listener to each "read-more" cell
            readMoreCells.forEach(function (cell) {
                cell.addEventListener("click", function (event) {
                    event.stopPropagation(); // Prevent the event from bubbling up to the overlay
                    // Get the inner HTML of the cell (the full message)
                    var fullMessage = this.innerHTML;
                    // Set the modal message content
                    document.getElementById("modalMessage").innerHTML = fullMessage;
                    // Display the modal overlay
                    document.getElementById("modalOverlay").style.display = "block";
                });
            });

            // Hide the modal when clicking anywhere on the overlay
            document.getElementById("modalOverlay").addEventListener("click", function () {
                this.style.display = "none";
            });
        </script>



<style>
    /* Smooth transition effect */
    .highlight {
        transition: background-color 0.2s ease-in-out, border 0.2s ease-in-out;
    }
</style>

<script>
    // Function to get URL parameter by name
    function getParameterByName(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    // Function to apply effects with smooth transition
    function highlightElement() {
        const id = getParameterByName("id"); // Get the 'id' from the URL
        if (id) {
            const element = document.getElementById(id);
            if (element) {
                // Add a CSS class for smooth transition
                element.classList.add("highlight");

                // Add blue border
                element.style.border = "3px solid #248afd";

                let count = 0;
                const interval = setInterval(() => {
                    // Smoothly transition background color
                    element.style.backgroundColor = count % 2 === 0 ? "rgba(0,0,0,.075)" : "white";
                    count++;

                    // Stop after 3 flashes (3 seconds)
                    if (count === 6) {
                        clearInterval(interval);
                        setTimeout(() => {
                            element.style.backgroundColor = ""; // Remove background color
                            element.style.border = ""; // Remove border
                        }, 500);
                    }
                }, 500);
            }
        }
    }

    // Run the function when the page loads
    window.onload = highlightElement;
</script>



        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const input = document.getElementById("navbar-search-input"); // Search input field
                const tableBody = document.getElementById("tableBodyMessages"); // Table body to filter

                // Handle search input to filter the table
                input.addEventListener("input", function () {
                    const searchQuery = input.value.toLowerCase(); // Get the search query in lowercase

                    // Get all rows in the table body
                    const rows = tableBody.getElementsByTagName("tr");

                    // Loop through each row and check if it matches the search query
                    for (let row of rows) {
                        const cells = row.getElementsByTagName("td"); // Get all cells in the row
                        let rowMatches = false; // Track if the row matches the search query

                        // Check each cell in the row
                        for (let cell of cells) {
                            if (cell.textContent.toLowerCase().includes(searchQuery)) {
                                rowMatches = true; // If any cell matches, mark the row as matching
                                break; // Stop checking other cells in this row
                            }
                        }

                        // Show or hide the row based on whether it matches the search query
                        row.style.display = rowMatches ? "" : "none";
                    }
                });
            });
        </script>



</body>

</html>