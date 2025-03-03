<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BestSales.aspx.cs" Inherits="TestNewWeb1.BestSales" %>
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
        .ButtonAddItem {
            display: flex;
            justify-content: center;
            align-items: center;
            border: none;
            margin: 10px;
            color: white;
            border: none;
            height: auto;
        }
        .ButtonAddItem button{
            color: white;
        }
        .file-upload-info{
            height: 100%;
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
/*        .container {
            width: 70%;
            margin: 15px auto;
        }*/
 
/*        body {
            text-align: center;
            color: green;
        }
 
        h2 {
            text-align: center;
            font-family: "Verdana", sans-serif;
            font-size: 30px;
        }*/
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
                    <div class="col-lg-6 grid-margin stretch-card">
                      <div class="card">
                        <div class="card-body">
                          <p class="card-title mb-0">Top Products</p>
                          <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>User</th>
                                            <th>Product</th>
                                            <th>Sale</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody runat="server" id="tableBody"></tbody>
                                </table>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!--
                    <div class="col-lg-6 grid-margin stretch-card">
                      <div class="card">
                        <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                          <h4 class="card-title">Bar chart</h4>
                          <canvas id="barChart" style="display: block; height: 150px; width: 301px;" width="376" height="187" class="chartjs-render-monitor"></canvas>
                        </div>
                      </div>
                    </div>
                    -->

                    <div class="col-lg-6 grid-margin stretch-card">
                      <div class="card">
                        <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                            <h4 class="card-title">Bar chart</h4>
                            <div>
                                <canvas id="myChart"></canvas>
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
    <!--<script>
        let ctx = document.getElementById("myChart").getContext("2d");
        let myChart = new Chart(ctx, {
            type: "line",
            data: {
                labels: [
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday",
                    "Sunday",
                ],
                datasets: [
                    {
                        label: "work load",
                        data: [2, 9, 3, 17, 6, 3, 7],
                        backgroundColor: "rgba(153,205,1,0.6)",
                    },
                    {
                        label: "free hours",
                        data: [2, 2, 5, 5, 2, 1, 10],
                        backgroundColor: "rgba(155,153,10,0.6)",
                    },
                ],
            },
        });
    </script>-->
        

        <!--<script>
            function loadChartData(orderData) {
                let labels = [];
                let ordersData = [];

                // Extract the days of the week and total orders from the received data
                orderData.forEach(item => {
                    labels.push(item.DayOfWeek);
                    ordersData.push(item.TotalOrders);
                });

                let ctx = document.getElementById("myChart").getContext("2d");
                let myChart = new Chart(ctx, {
                    type: "line",
                    data: {
                        labels: labels,
                        datasets: [{
                            label: "Orders per Day",
                            data: ordersData,
                            backgroundColor: "rgba(153,205,1,0.6)",
                            borderColor: "rgba(153,205,1,1)",
                            borderWidth: 1
                        }]
                    }
                });
            }
        </script>-->

        
        <!--
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            function loadChartData(data) {
                let labels = [];
                let values = [];

                // Process data from C#
                data.forEach(item => {
                    labels.push(item.DayOfWeek);
                    values.push(item.TotalOrders);
                });

                let ctx = document.getElementById("myChart").getContext("2d");
                let myChart = new Chart(ctx, {
                    type: "line",
                    data: {
                        labels: labels,  // Days of the week from SQL
                        datasets: [
                            {
                                label: "Total Orders",
                                data: values, // Order data from SQL
                                backgroundColor: "rgba(153,205,1,0.6)",
                                borderColor: "rgba(153,205,1,1)",
                                borderWidth: 2,
                                fill: false
                            }
                        ],
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            }
        </script>
        -->



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

</body>

</html>