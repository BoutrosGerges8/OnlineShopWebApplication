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
        }
        .ButtonAddItem button{
            color: white;
        }
    </style>


    <style>
        /* Style for the delete button */
        .delete-image-btn {
            position: absolute;
            top: 5px;
            right: 5px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 50%;
            font-size: 14px;
            padding: 5px;
            cursor: pointer;
        }

        /* To position the image container */
        .add-item-card {
            position: relative;
            display: flex;
            background-color: #cfcdcdb5;
        }

        /* Ensure image is displayed within the container */
        .add-item-card img {
            max-width: 20%;
            max-height: 20%;
            object-fit: contain;
            display: block;
            margin: 0 auto;
        }

        .add-item-card{
            padding: 30px;
            position: fixed;
            width: 100vw;
            z-index: 9999;
            top: -100%;
            transition-duration: 2s;
            transition-property: top;
        }
    </style>


    <!-- plugins:css -->
    <link rel="stylesheet" href="/DashBoardStyles/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="/DashBoardStyles/vendors/base/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/DashBoardStyles/css/style.css">



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
                    <h1 class="card-title">Add New Item</h1>
                    <form class="form-sample">
                        <p class="card-description">
                            Personal info
                        </p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Product Title</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Price</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Category</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>Category1</option>
                                            <option>Category2</option>
                                            <option>Category3</option>
                                            <option>Category4</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Quantity</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control">
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
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Provide a detailed description</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control">
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
                                    <img id="productImagePreview" style="display:none;" alt="Image Preview">
                                    <!-- Delete button -->
                                    <button type="button" class="delete-image-btn" id="deleteProductImage" style="display:none;">X</button>
                                </div>
                                <input type="file" name="img[]" class="file-upload-default" accept="image/*" id="productImageInput">
                                <div class="input-group col-xs-12">
                                    <input type="text" class="form-control file-upload-info" disabled="" id="imageName1" placeholder="Upload Image">
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
                                    <img id="sideImagePreview" style="display:none;" alt="Image Preview">
                                    <!-- Delete button -->
                                    <button type="button" class="delete-image-btn" id="deleteSideImage" style="display:none;">X</button>
                                </div>
                                <input type="file" name="img[]" class="file-upload-default" accept="image/*" id="sideImageInput">
                                <div class="input-group col-xs-12">
                                    <input type="text" class="form-control file-upload-info" disabled="" id="imageName2" placeholder="Upload Image">
                                    <span class="input-group-append">
                                        <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <button type="button" class="btn btn-primary">Add</button>
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
                <a class="navbar-brand brand-logo me-5" href="/index.aspx"><img src="/assets/images/logo.png"
                        class="me-2" alt="logo" /></a>
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
                                                    <!-- <th>User</th> -->
                                                    <th>First Name</th>
                                                    <th>Email</th>
                                                    <th>Progress</th>
                                                    <th>Amount</th>
                                                    <th>Deadline</th>
                                                </tr>
                                            </thead>
                                            <tbody id="userTableBody" runat="server">
                                                <!-- Rows will be populated dynamically from C# -->
                                            </tbody>
                                        </table>
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
                        </div>

                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Bordered table</h4>
                                    <p class="card-description">
                                        Add class <code>.table-bordered</code>
                                    </p>
                                    <div class="table-responsive pt-3">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        #
                                                    </th>
                                                    <th>
                                                        First name
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
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        1
                                                    </td>
                                                    <td>
                                                        Herman Beck
                                                    </td>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar bg-success" role="progressbar"
                                                                style="width: 25%" aria-valuenow="25"
                                                                aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        $ 77.99
                                                    </td>
                                                    <td>
                                                        May 15, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        2
                                                    </td>
                                                    <td>
                                                        Messsy Adam
                                                    </td>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar bg-danger" role="progressbar"
                                                                style="width: 75%" aria-valuenow="75"
                                                                aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        $245.30
                                                    </td>
                                                    <td>
                                                        July 1, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        3
                                                    </td>
                                                    <td>
                                                        John Richards
                                                    </td>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar bg-warning" role="progressbar"
                                                                style="width: 90%" aria-valuenow="90"
                                                                aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        $138.00
                                                    </td>
                                                    <td>
                                                        Apr 12, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        4
                                                    </td>
                                                    <td>
                                                        Peter Meggik
                                                    </td>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar bg-primary" role="progressbar"
                                                                style="width: 50%" aria-valuenow="50"
                                                                aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        $ 77.99
                                                    </td>
                                                    <td>
                                                        May 15, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        5
                                                    </td>
                                                    <td>
                                                        Edward
                                                    </td>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar bg-danger" role="progressbar"
                                                                style="width: 35%" aria-valuenow="35"
                                                                aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        $ 160.25
                                                    </td>
                                                    <td>
                                                        May 03, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        6
                                                    </td>
                                                    <td>
                                                        John Doe
                                                    </td>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                style="width: 65%" aria-valuenow="65"
                                                                aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        $ 123.21
                                                    </td>
                                                    <td>
                                                        April 05, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        7
                                                    </td>
                                                    <td>
                                                        Henry Tom
                                                    </td>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar bg-warning" role="progressbar"
                                                                style="width: 20%" aria-valuenow="20"
                                                                aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        $ 150.00
                                                    </td>
                                                    <td>
                                                        June 16, 2015
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Inverse table</h4>
                                    <p class="card-description">
                                        Add class <code>.table-dark</code>
                                    </p>
                                    <div class="table-responsive pt-3">
                                        <table class="table table-dark">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        #
                                                    </th>
                                                    <th>
                                                        First name
                                                    </th>
                                                    <th>
                                                        Amount
                                                    </th>
                                                    <th>
                                                        Deadline
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        1
                                                    </td>
                                                    <td>
                                                        Herman Beck
                                                    </td>
                                                    <td>
                                                        $ 77.99
                                                    </td>
                                                    <td>
                                                        May 15, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        2
                                                    </td>
                                                    <td>
                                                        Messsy Adam
                                                    </td>
                                                    <td>
                                                        $245.30
                                                    </td>
                                                    <td>
                                                        July 1, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        3
                                                    </td>
                                                    <td>
                                                        John Richards
                                                    </td>
                                                    <td>
                                                        $138.00
                                                    </td>
                                                    <td>
                                                        Apr 12, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        4
                                                    </td>
                                                    <td>
                                                        Peter Meggik
                                                    </td>
                                                    <td>
                                                        $ 77.99
                                                    </td>
                                                    <td>
                                                        May 15, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        5
                                                    </td>
                                                    <td>
                                                        Edward
                                                    </td>
                                                    <td>
                                                        $ 160.25
                                                    </td>
                                                    <td>
                                                        May 03, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        6
                                                    </td>
                                                    <td>
                                                        John Doe
                                                    </td>
                                                    <td>
                                                        $ 123.21
                                                    </td>
                                                    <td>
                                                        April 05, 2015
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        7
                                                    </td>
                                                    <td>
                                                        Henry Tom
                                                    </td>
                                                    <td>
                                                        $ 150.00
                                                    </td>
                                                    <td>
                                                        June 16, 2015
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Table with contextual classes</h4>
                                    <p class="card-description">
                                        Add class <code>.table-{color}</code>
                                    </p>
                                    <div class="table-responsive pt-3">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        #
                                                    </th>
                                                    <th>
                                                        First name
                                                    </th>
                                                    <th>
                                                        Product
                                                    </th>
                                                    <th>
                                                        Amount
                                                    </th>
                                                    <th>
                                                        Deadline
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="table-info">
                                                    <td>
                                                        1
                                                    </td>
                                                    <td>
                                                        Herman Beck
                                                    </td>
                                                    <td>
                                                        Photoshop
                                                    </td>
                                                    <td>
                                                        $ 77.99
                                                    </td>
                                                    <td>
                                                        May 15, 2015
                                                    </td>
                                                </tr>
                                                <tr class="table-warning">
                                                    <td>
                                                        2
                                                    </td>
                                                    <td>
                                                        Messsy Adam
                                                    </td>
                                                    <td>
                                                        Flash
                                                    </td>
                                                    <td>
                                                        $245.30
                                                    </td>
                                                    <td>
                                                        July 1, 2015
                                                    </td>
                                                </tr>
                                                <tr class="table-danger">
                                                    <td>
                                                        3
                                                    </td>
                                                    <td>
                                                        John Richards
                                                    </td>
                                                    <td>
                                                        Premeire
                                                    </td>
                                                    <td>
                                                        $138.00
                                                    </td>
                                                    <td>
                                                        Apr 12, 2015
                                                    </td>
                                                </tr>
                                                <tr class="table-success">
                                                    <td>
                                                        4
                                                    </td>
                                                    <td>
                                                        Peter Meggik
                                                    </td>
                                                    <td>
                                                        After effects
                                                    </td>
                                                    <td>
                                                        $ 77.99
                                                    </td>
                                                    <td>
                                                        May 15, 2015
                                                    </td>
                                                </tr>
                                                <tr class="table-primary">
                                                    <td>
                                                        5
                                                    </td>
                                                    <td>
                                                        Edward
                                                    </td>
                                                    <td>
                                                        Illustrator
                                                    </td>
                                                    <td>
                                                        $ 160.25
                                                    </td>
                                                    <td>
                                                        May 03, 2015
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
                <!-- partial:../../partials/_footer.html -->
                <footer class="footer">
                    <div class="d-sm-flex justify-content-center justify-content-sm-between">
                        <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © <a
                                href="https://www.bootstrapdash.com/" target="_blank">bootstrapdash.com
                            </a>2021</span>
                        <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Only the best <a
                                href="https://www.bootstrapdash.com/" target="_blank"> Bootstrap dashboard </a>
                            templates</span>
                    </div>
                </footer>
                <!-- partial -->
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->



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