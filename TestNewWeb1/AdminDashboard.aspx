<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="TestNewWeb1.AdminDashboard"%>


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


    <link rel="stylesheet" href="/assets/css/ProductsIteme.css">


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

    <!-- main-panel ends -->
    <div class="container-scroller add-item-card" id="AddItemContainer" runat="server">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <button type="button" class="delete-image-btn" id="HideAddWindow" 
                        style="display: block;" onclick="HideAddWindowFunction()">X</button>
                    <h1 class="card-title">Add New Item</h1>
                    <form class="form-sample" runat="server">
                        <input runat="server" id="ProId"/>
                        <p class="card-description">
                            Personal info
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Product Title</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" runat="server" id="ProTitle" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Price</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" runat="server" id="ProPrice" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Category</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" runat="server" id="ProCategory">
                                            <option>Men's</option>
                                            <option>Women's</option>
                                            <option>Kid's</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Quantity</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" runat="server" id="ProQuantity" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="card-description">
                            More Information
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Short description</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" runat="server" id="ProShortDesc" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Provide a detailed description</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" runat="server" id="ProLongDesc" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Product image upload with preview -->
                        <div class="row">
                            <div class="form-group">
                                <label>Product image</label>
                                <!-- Image container with delete button -->
                                <div class="image-container">
                                    <img id="productImagePreview" style="display:none;" alt="Image Preview" runat="server">
                                    <!-- Delete button -->
                                    <button type="button" class="delete-image-btn" id="deleteProductImage" style="display:none;">X</button>
                                </div>
                                <input type="file" name="img[]" class="file-upload-default" accept="image/*" 
                                    id="productImageInput" runat="server" required>
                                <div class="input-group col-xs-12">
                                    
                                    <input type="text" class="form-control file-upload-info" disabled="" 
                                        id="imageName1" placeholder="Upload Image" runat="server">
                                    <span class="input-group-append">
                                        <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                    </span>
                                </div>
                            </div>
                            
                            <!-- Image from the other side upload with preview -->
                            <div class="form-group">
                                <label>Image from the other side</label>
                                <!-- Image container with delete button -->
                                <div class="image-container">
                                    <img id="sideImagePreview" style="display:none;" alt="Image Preview" runat="server">
                                    <!-- Delete button -->
                                    <button type="button" class="delete-image-btn" id="deleteSideImage" style="display:none;">X</button>
                                </div>
                                <input type="file" name="img[]" class="file-upload-default" 
                                    accept="image/*" id="sideImageInput" runat="server" required>
                                <div class="input-group col-xs-12">
                                    <input type="text" class="form-control file-upload-info" disabled="" 
                                        id="imageName2" placeholder="Upload Image" runat="server">
                                    <span class="input-group-append">
                                        <button class="file-upload-browse btn btn-primary" 
                                            type="button" runat="server">Upload</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <asp:Button ID="ButtonAddProduct" runat="server" Text="Add"
                                CssClass="btn btn-primary" OnClick="ButtonAdd_Click" style="display:none" />
                            <asp:Button ID="ButtonEditProduct" runat="server" Text="Edit"
                                CssClass="btn btn-primary" OnClick="ButtonEdit_Click" style="display:none" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- main-panel ends -->



    <div class="container-scroller">

        <!-- ***** Header Area Start ***** -->
        <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo me-5" href="/index.aspx">
                    <img src="/assets/images/logo.png" class="me-2" alt="logo">
                </a>
                <a class="navbar-brand brand-logo-mini" href="/index.aspx">
                    <img src="/assets/images/logo-2.png" alt="logo">
                </a>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button"
                    data-toggle="minimize">
                    <span class="ti-view-list"></span>
                </button>
                <ul class="navbar-nav mr-lg-2">
                    <li class="nav-item nav-search d-none d-lg-block">
                        <div class="input-group">
                            <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                                <span class="input-group-text" id="search">
                                    <i class="ti-search"></i>
                                </span>
                            </div>
                            <input type="text" class="form-control" id="navbar-search-input"
                                placeholder="Search now" aria-label="search" aria-describedby="search">
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav navbar-nav-right">
                    <li class="nav-item dropdown me-1">
                        <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
                            id="messageDropdown" href="#" data-bs-toggle="dropdown">
                            <i class="ti-email mx-0"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown"
                            aria-labelledby="messageDropdown">
                            <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
                            <a class="dropdown-item">
                                <div class="item-thumbnail">
                                    <img src="images/faces/face4.jpg" alt="image" class="profile-pic">
                                </div>
                                <div class="item-content flex-grow">
                                    <h6 class="ellipsis font-weight-normal">David Grey
                                    </h6>
                                    <p class="font-weight-light small-text text-muted mb-0">
                                        The meeting is cancelled
                                    </p>
                                </div>
                            </a>
                            <a class="dropdown-item">
                                <div class="item-thumbnail">
                                    <img src="images/faces/face2.jpg" alt="image" class="profile-pic">
                                </div>
                                <div class="item-content flex-grow">
                                    <h6 class="ellipsis font-weight-normal">Tim Cook
                                    </h6>
                                    <p class="font-weight-light small-text text-muted mb-0">
                                        New product launch
                                    </p>
                                </div>
                            </a>
                            <a class="dropdown-item">
                                <div class="item-thumbnail">
                                    <img src="images/faces/face3.jpg" alt="image" class="profile-pic">
                                </div>
                                <div class="item-content flex-grow">
                                    <h6 class="ellipsis font-weight-normal"> Johnson
                                    </h6>
                                    <p class="font-weight-light small-text text-muted mb-0">
                                        Upcoming board meeting
                                    </p>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#"
                            data-bs-toggle="dropdown">
                            <i class="ti-bell mx-0"></i>
                            <span class="count"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown"
                            aria-labelledby="notificationDropdown">
                            <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                            <a class="dropdown-item">
                                <div class="item-thumbnail">
                                    <div class="item-icon bg-success">
                                        <i class="ti-info-alt mx-0"></i>
                                    </div>
                                </div>
                                <div class="item-content">
                                    <h6 class="font-weight-normal">Application Error</h6>
                                    <p class="font-weight-light small-text mb-0 text-muted">
                                        Just now
                                    </p>
                                </div>
                            </a>
                            <a class="dropdown-item">
                                <div class="item-thumbnail">
                                    <div class="item-icon bg-warning">
                                        <i class="ti-settings mx-0"></i>
                                    </div>
                                </div>
                                <div class="item-content">
                                    <h6 class="font-weight-normal">Settings</h6>
                                    <p class="font-weight-light small-text mb-0 text-muted">
                                        Private message
                                    </p>
                                </div>
                            </a>
                            <a class="dropdown-item">
                                <div class="item-thumbnail">
                                    <div class="item-icon bg-info">
                                        <i class="ti-user mx-0"></i>
                                    </div>
                                </div>
                                <div class="item-content">
                                    <h6 class="font-weight-normal">New user registration</h6>
                                    <p class="font-weight-light small-text mb-0 text-muted">
                                        2 days ago
                                    </p>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li class="nav-item nav-profile dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" id="profileDropdown">
                            <img src="/DashBoardStyles/images/faces/face12.jpg" alt="profile" />
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown"
                            aria-labelledby="profileDropdown">
                            <a class="dropdown-item">
                                <i class="ti-settings text-primary"></i>
                                Settings
                            </a>
                            <a class="dropdown-item" href="/Logout.aspx">
                                <i class="ti-power-off text-primary"></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                    data-toggle="offcanvas">
                    <span class="ti-view-list"></span>
                </button>
            </div>
        </nav>
        <!-- ***** Header Area End ***** -->

        <div class="container-fluid page-body-wrapper">
            <!-- partial:../../partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/AdminDashboard.aspx">
                            <i class="ti-shield menu-icon"></i>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false"
                            aria-controls="auth">
                            <i class="ti-user menu-icon"></i>
                            <span class="menu-title">User Pages</span>
                            <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="auth">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="/login.aspx">
                                        Login </a></li>
                                <li class="nav-item"> <a class="nav-link" href="/signup.aspx">
                                        Sign Up </a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>


            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Products Table</h4>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Title</th>
                                                    <th>Long description</th>
                                                    <th>Short description</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Product image</th>
                                                    <th>Another image</th>
                                                    <th>Category</th>
                                                    <th>Rate</th>
                                                </tr>
                                            </thead>
                                            <tbody id="productsTableBody" runat="server">
                                                <!-- Rows will be populated dynamically from C# -->
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="ButtonAddItem">
                                        <button type="button"  runat="server" id="ButtonAddItem"
                                                class="btn btn-primary btn-rounded btn-icon"
                                                onclick="AddNewProduct()">
                                                +
                                            </button>
                                    </div>
                                </div>
                      
                            </div>
                        </div>


                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Orders Table</h4>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>User Name</th>
                                                    <th>Order Title</th>
                                                    <th>Order Image</th>
                                                    <th>Quantity</th>
                                                    <th>Total Price</th>
                                                    <th>Ordered Date</th>
                                                    <th>Status</th>
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

                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Users table</h4>
                                    <div class="table-responsive pt-3">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        #
                                                    </th>
                                                    <th>
                                                        Full name
                                                    </th>
                                                    <th>
                                                        Email address
                                                    </th>
                                                    <th>
                                                        Progress
                                                    </th>
                                                    <th>
                                                        Amount
                                                    </th>
                                                    <th>
                                                        Deadline
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="userTableBody" runat="server">
                                                
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
            // Image preview for the product image
            document.getElementById('productImageInput').addEventListener('change', function (event) {
                const file = event.target.files[0];
                if (file && file.type.startsWith('image/')) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        const imgElement = document.getElementById('productImagePreview');
                        const deleteBtn = document.getElementById('deleteProductImage');
                        imgElement.src = e.target.result;
                        imgElement.style.display = 'block'; // Show the image
                        deleteBtn.style.display = 'block'; // Show the delete button
                    };
                    reader.readAsDataURL(file);
                }
            });

            // Image preview for the side image
            document.getElementById('sideImageInput').addEventListener('change', function (event) {
                const file = event.target.files[0];
                if (file && file.type.startsWith('image/')) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        const imgElement = document.getElementById('sideImagePreview');
                        const deleteBtn = document.getElementById('deleteSideImage');
                        imgElement.src = e.target.result;
                        imgElement.style.display = 'block'; // Show the image
                        deleteBtn.style.display = 'block'; // Show the delete button
                    };
                    reader.readAsDataURL(file);
                }
            });

            // Delete the product image when the delete button is clicked
            document.getElementById('deleteProductImage').addEventListener('click', function () {
                const imgElement = document.getElementById('productImagePreview');
                const deleteBtn = document.getElementById('deleteProductImage');
                imgElement.src = ''; // Reset the image source
                imgElement.style.display = 'none'; // Hide the image
                deleteBtn.style.display = 'none'; // Hide the delete button
                document.getElementById('productImageInput').value = ''; // Clear the file input
                document.getElementById("imageName1").value = "";
            });

            // Delete the side image when the delete button is clicked
            document.getElementById('deleteSideImage').addEventListener('click', function () {
                const imgElement = document.getElementById('sideImagePreview');
                const deleteBtn = document.getElementById('deleteSideImage');
                imgElement.src = ''; // Reset the image source
                imgElement.style.display = 'none'; // Hide the image
                deleteBtn.style.display = 'none'; // Hide the delete button
                document.getElementById('sideImageInput').value = ''; // Clear the file input
                document.getElementById("imageName2").value = "";
            });


            function loadImageFromPath(imageId, deleteBtnId, imagePath) {
                const imgElement = document.getElementById(imageId);
                const deleteBtn = document.getElementById(deleteBtnId);

                imgElement.src = imagePath;
                imgElement.style.display = 'block';
                deleteBtn.style.display = 'block';
            }
            function deleteImage(imageId, deleteBtnId) {
                const imgElement = document.getElementById(imageId);
                const deleteBtn = document.getElementById(deleteBtnId);

                imgElement.src = ''; // Reset the image source
                imgElement.style.display = 'none'; // Hide the image
                deleteBtn.style.display = 'none'; // Hide the delete button
            }
        </script>

        <script>
            function AddNewProduct() {
                document.getElementById("ButtonAddProduct").style = "display:block";
                document.getElementById("ButtonEditProduct").style = "display:none";
                document.getElementById("AddItemContainer").style = "top: 0;";

                document.getElementById("ProTitle").value = "";
                document.getElementById("ProShortDesc").value = "";
                document.getElementById("ProLongDesc").value = "";
                document.getElementById("ProPrice").value = "";
                document.getElementById("ProQuantity").value = "";
                document.getElementById("OrderStatus").selectedIndex = 0;

                const productImageInput = document.getElementById('productImageInput');
                const sideImageInput = document.getElementById('sideImageInput');
                productImageInput.setAttribute('required');
                sideImageInput.setAttribute('required');

                document.body.style = "max-height: 100vh;";
            }
            function HideAddWindowFunction() {
                document.getElementById("AddItemContainer").style = "top: -100%;";
                document.body.style = "max-height: auto;";

                deleteImage("productImagePreview", "deleteProductImage");
                deleteImage("sideImagePreview", "deleteSideImage");
            }
            function ShowAddWindowFunctionAsEdit(id, title, desc1, desc2, price,
                           no, img1, img2, category) {
                document.getElementById("ButtonAddProduct").style = "display:none";
                document.getElementById("ButtonEditProduct").style = "display:block";

                document.getElementById("ProId").value = id;
                document.getElementById("ProTitle").value = title;
                document.getElementById("ProShortDesc").value = desc1;
                document.getElementById("ProLongDesc").value = desc2;
                document.getElementById("ProPrice").value = price;
                document.getElementById("ProQuantity").value = no;
                document.getElementById("OrderStatus").selectedIndex = category;
                loadImageFromPath("productImagePreview", "deleteProductImage", "/AllUploadedImages/" + img1);
                loadImageFromPath("sideImagePreview", "deleteSideImage", "/AllUploadedImages/" + img2);

                const productImageInput = document.getElementById('productImageInput');
                const sideImageInput = document.getElementById('sideImageInput');
                productImageInput.removeAttribute('required');
                sideImageInput.removeAttribute('required');

                document.getElementById("AddItemContainer").style = "top: 0;";

                document.body.style = "max-height: 100vh;";
            }
        </script>

        <script type="text/javascript">
            function DeleteOrder(orderId) {
                return $.ajax({  // Return the AJAX promise
                    type: "POST",
                    url: "/AdminDashboard.aspx/DeleteOrder",  // Correct URL for the WebMethod
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

            function DeleteProduct(proId) {
                return $.ajax({  // Return the AJAX promise
                    type: "POST",
                    url: "/AdminDashboard.aspx/DeleteProduct",  // Correct URL for the WebMethod
                    data: JSON.stringify({ proId: proId }), // Send the orderId as data
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

            function confirmAction(orderId, actionFunction) {
                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to undo this action!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#d33",
                    cancelButtonColor: "#3085d6",
                    confirmButtonText: "Yes, proceed!"
                }).then((result) => {
                    if (result.isConfirmed) {
                        actionFunction(orderId);
                    }
                });
            }

            //function confirmDelete(orderId) {
            //    Swal.fire({
            //        title: "Are you sure?",
            //        text: "You won't be able to undo this action!",
            //        icon: "warning",
            //        showCancelButton: true,
            //        confirmButtonColor: "#d33",
            //        cancelButtonColor: "#3085d6",
            //        confirmButtonText: "Yes, delete it!"
            //    }).then((result) => {
            //        if (result.isConfirmed) {
            //            DeleteOrder(orderId);
            //        }
            //    });
            //}


            //function DeleteOrder(orderId) {
            //    $.ajax({
            //        type: "POST",
            //        url: "/AdminDashboard.aspx/DeleteOrder",  // Correct URL for the WebMethod
            //        data: JSON.stringify({ orderId: orderId }), // Send the orderId as data
            //        contentType: "application/json; charset=utf-8",  // Ensure content type is set to JSON
            //        dataType: "json", // Expect JSON response
            //        success: function (response) {
            //            if (response.d === "Success") {
            //                Swal.fire({
            //                    title: 'Success!',
            //                    text: "Successfuly delete the order",
            //                    icon: 'success',
            //                    confirmButtonText: 'OK'
            //                }).then((result) => {
            //                    if (result.isConfirmed) {
            //                        location.reload(); // Reload the page
            //                    }
            //                });;
            //            } else {
            //                console.log(responseData.message);
            //                Swal.fire({
            //                    title: 'Error!',
            //                    text: "Failed to delete the order",
            //                    icon: 'error',
            //                    confirmButtonText: 'Close'
            //                });
            //            }
            //        },
            //        error: function (xhr, status, error) {
            //            // Handle error in AJAX call
            //            alert("AJAX error: " + error);
            //        }
            //    });

            //}
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <script type="text/javascript">
        function StatusChanged(selectElement) {
            var selectedStatus = selectElement.value; // Get the selected value
            var orderId = selectElement.getAttribute("data-order-id"); // Get the associated order ID

            // Call the WebMethod to update the status via AJAX
            $.ajax({
                type: "POST",
                url: "/AdminDashboard.aspx/UpdateOrderStatus",  // WebMethod URL
                data: JSON.stringify({ orderId: orderId, status: selectedStatus }), // Send orderId and status as JSON
                contentType: "application/json; charset=utf-8",  // Set content type to JSON
                dataType: "json",  // Expect JSON response
                success: function (response) {
                    if (response.d === "Success") {
                        //console.log("Status updated successfully!");
                        //Swal.fire({
                        //    title: 'Success!',
                        //    text: "Order status updated successfully",
                        //    icon: 'success',
                        //    confirmButtonText: 'OK'
                        //});
                    } else {
                        Swal.fire({
                            title: 'Error!',
                            text: "Failed to update order status",
                            icon: 'error',
                            confirmButtonText: 'Close'
                        });
                    }
                },
                error: function (xhr, status, error) {
                    alert("AJAX error: " + error);
                }
            });
        }
    </script>



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