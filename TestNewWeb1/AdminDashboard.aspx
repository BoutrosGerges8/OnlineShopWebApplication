<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="TestNewWeb1.AdminDashboard"%>
<%@ Register Src="/Components/Sidebar.ascx" TagPrefix="uc" TagName="Sidebar" %>
<%@ Register Src="/Components/AdminHeader.ascx" TagPrefix="uc" TagName="AdminHeader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="/assets/icon/favicon.ico" />

    <title>Administrator Dashboard</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/assets/css/font-awesome.css">

    <link rel="stylesheet" href="/assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="/assets/css/owl-carousel.css">

    <link rel="stylesheet" href="/assets/css/lightbox.css">

    <link rel="stylesheet" href="/assets/css/MyCSSCodes.css">


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


    <style>
        .table-responsive{
            max-height: 100vh;
        }
        .wholeText {
            max-width: 400px !important;
        }
    </style>

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

    <!-- main-panel ends -->
    <div class="container-scroller add-item-card" id="AddItemContainer" runat="server">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <button type="button" class="delete-image-btn" id="HideAddWindow" 
                        style="display: block;" onclick="HideAddWindowFunction()">X</button>
                    <h1 class="card-title">Add New Item</h1>
                    <form class="form-sample" runat="server">
                        <input runat="server" id="ProId" hidden />
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


    <!-- add user -->
<div class="container-scroller add-item-card" id="AddUserDiv" runat="server">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <button type="button" class="delete-image-btn" id="HideAddUserWindow" 
                    style="display: block;" onclick="HideAddUserWindowFunction()">X</button>
                <h1 class="card-title">Add New User</h1>

                <div id="errorAlert" class="alert alert-danger" role="alert" style="display:none;">
                    Email already exists.
                </div>

                <div id="successAlert" class="alert alert-success" role="alert" style="display:none;">
                    User added successfully!
                </div>

                <form class="forms-sample" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="inputUsername">Username</label>
                        <input type="text" class="form-control" id="inputUsername" 
                            placeholder="Username" runat="server" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail">Email address</label>
                        <input type="email" class="form-control" id="inputEmail" 
                            placeholder="Email" runat="server" required>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="inputPassword" 
                                placeholder="Password" runat="server" required>
                            <div class="input-group-append">
                                <span class="input-group-text" onclick="togglePasswordVisibility('inputPassword')">
                                    <i class="fas fa-eye" id="eyeIconinputPassword"></i>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputConfirmPassword">Confirm Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="inputConfirmPassword" 
                                placeholder="Confirm Password" runat="server" required>
                            <div class="input-group-append">
                                <span class="input-group-text" onclick="togglePasswordVisibility('inputConfirmPassword')">
                                    <i class="fas fa-eye" id="eyeIconinputConfirmPassword"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <button type="submit" class="btn btn-primary" runat="server"
                            id="AddUserButton">Add</button>
                        <button type="submit" class="btn btn-primary" runat="server"
                            id="EditUserButton" style="display:none;">Edit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
    <!-- add user -->


    <uc:AdminHeader runat="server" ID="AdminHeaderControl" />
        <!-- ***** Header Area End ***** -->

        <div class="container-fluid page-body-wrapper">


            <!-- partial:../../partials/_sidebar.html -->
            <uc:Sidebar runat="server" ID="SidebarControl" />


            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">


               <!-- <div class="row">
                    <div class="col-md-7 grid-margin stretch-card">
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
                   -->


                    <div class="row">
                        <div class="col-lg-12 grid-margin stretch-card" id="productsTable">
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
                                                    <th>Created</th>
                                                    <th>Last Modify</th>
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


                        <div class="col-lg-12 grid-margin stretch-card" id="ordersTable">
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
                                                    <th>Progess</th>
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

                        <div class="col-lg-12 grid-margin stretch-card" id="usersTable">
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
                                                        Total Amount Spent
                                                    </th>
                                                    <th>
                                                        Edit
                                                    </th>
                                                    <th>
                                                        Delete
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="userTableBody" runat="server">
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="ButtonAddItem">
                                        <button id="ButtonAddUser" type="button" class="btn btn-primary btn-rounded btn-icon" onclick="switchToAddMode()">
                                                +
                                            </button>
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

        let isEditMode = false; // Track whether we're in edit mode
        let currentUserId = null; // Track the ID of the user being edited

        function validateForm() {
            // Get form values
            var username = document.getElementById('inputUsername').value;
            var email = document.getElementById('inputEmail').value;
            var password = document.getElementById('inputPassword').value;
            var confirmPassword = document.getElementById('inputConfirmPassword').value;

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

            if (isEditMode) {
                // If in edit mode, call the EditUser WebMethod
                editUser(currentUserId, username, email, password);
            } else {
                // If in add mode, check if the email exists
                checkEmailExists(email, function (exists) {
                    if (exists) {
                        showErrorAlert("Email already exists.");
                    } else {
                        // If email does not exist, add the user
                        addUser(username, email, password);
                    }
                });
            }

            return false; // Prevent form submission
        }

        function checkEmailExists(email, callback) {
            // Create an AJAX request
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AdminDashboard.aspx/CheckEmailExists", true);
            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.d === "exists") {
                        callback(true); // Email exists
                    } else {
                        callback(false); // Email does not exist
                    }
                }
            };

            // Send the email as JSON
            xhr.send(JSON.stringify({ email: email }));
        }

        function addUser(username, email, password) {
            // Create an AJAX request
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AdminDashboard.aspx/AddUser", true);
            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.d === "success") {
                        showSuccessAlert("User added successfully!");
                        // Optionally, redirect or clear the form
                        setTimeout(function () {
                            window.location.href = "AdminDashboard.aspx"; // Redirect to the same page or another page
                        }, 2000);
                    } else {
                        showErrorAlert("Error adding user: " + response.d);
                    }
                }
            };

            // Send the user data as JSON
            xhr.send(JSON.stringify({ username: username, email: email, password: password }));
        }

        function editUser(userId, username, email, password) {
            // Create an AJAX request
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AdminDashboard.aspx/EditUser", true);
            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.d === "success") {
                        showSuccessAlert("User updated successfully!");
                        // Optionally, redirect or clear the form
                        setTimeout(function () {
                            window.location.href = "AdminDashboard.aspx"; // Redirect to the same page or another page
                        }, 2000);
                    } else {
                        showErrorAlert("Error updating user: " + response.d);
                    }
                }
            };

            // Send the user data as JSON
            xhr.send(JSON.stringify({ userId: userId, username: username, email: email, password: password }));
        }

        function showErrorAlert(message) {
            var errorDiv = document.getElementById("errorAlert");
            errorDiv.innerText = message; // Set error message inside the div
            errorDiv.style.display = "block"; // Show the error div
        }

        function showSuccessAlert(message) {
            var successDiv = document.getElementById("successAlert");
            successDiv.innerText = message; // Set success message inside the div
            successDiv.style.display = "block"; // Show the success div
        }

        // Function to switch to edit mode
        function switchToEditMode(userId, username, email, password) {
            isEditMode = true;
            currentUserId = userId;

            // Populate the form fields
            document.getElementById('inputUsername').value = username;
            document.getElementById('inputEmail').value = email;
            document.getElementById('inputPassword').value = password;
            document.getElementById('inputConfirmPassword').value = password;

            // Show the Edit button and hide the Add button
            document.getElementById('AddUserButton').style.display = 'none';
            document.getElementById('EditUserButton').style.display = 'block';

            document.body.style = "max-height: 100vh;";
            document.getElementById("AddUserDiv").style = "top: 0;";

        }

        // Function to switch to add mode
        function switchToAddMode() {
            isEditMode = false;
            currentUserId = null;

            // Clear the form fields
            document.getElementById('inputUsername').value = '';
            document.getElementById('inputEmail').value = '';
            document.getElementById('inputPassword').value = '';
            document.getElementById('inputConfirmPassword').value = '';

            // Show the Add button and hide the Edit button
            document.getElementById('AddUserButton').style.display = 'block';
            document.getElementById('EditUserButton').style.display = 'none';

            document.body.style = "max-height: 100vh;";
            document.getElementById("AddUserDiv").style = "top: 0;";
        }


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
    </script>



    <script>

        //document.addEventListener("DOMContentLoaded", function () {
        //    const input = document.getElementById("navbar-search-input");
        //    const options = document.getElementById("search-options");
        //    const optionElements = document.querySelectorAll(".option");

        //    let selectedOption = ""; // Track the selected option

        //    // Show options when input is focused
        //    input.addEventListener("focus", function () {
        //        options.style.display = "block";
        //    });

        //    // Hide options when input loses focus
        //    input.addEventListener("blur", function () {
        //        setTimeout(() => {
        //            options.style.display = "none";
        //        }, 200);
        //    });

        //    // Handle option selection
        //    optionElements.forEach(option => {
        //        option.addEventListener("click", function () {
        //            selectedOption = this.getAttribute("data-value"); // Update selected option
        //            input.value = selectedOption + ": "; // Add selected option to input
        //            input.focus(); // Keep focus on the input
        //        });
        //    });

        //    // Handle Backspace key to clear the selected option
        //    input.addEventListener("keydown", function (event) {
        //        if (event.key === "Backspace") {
        //            const prefix = input.value.split(": ")[0]; // Get the current prefix
        //            if (prefix === selectedOption && input.selectionStart <= prefix.length+2) {
        //                // If Backspace is pressed at the start of the input and the prefix is selected
        //                event.preventDefault(); // Prevent deleting individual characters
        //                input.value = ""; // Clear the input
        //                selectedOption = ""; // Reset the selected option
        //                options.style.display = "block"; // Show the options dropdown again
        //            }
        //        }
        //    });
        //});








        document.addEventListener("DOMContentLoaded", function () {
            const input = document.getElementById("navbar-search-input");
            const options = document.getElementById("search-options");
            const optionElements = document.querySelectorAll(".option");

            let selectedOption = ""; // Track the selected option

            // Show options when input is focused
            input.addEventListener("focus", function () {
                options.style.display = "block";
            });

            // Hide options when input loses focus
            input.addEventListener("blur", function () {
                setTimeout(() => {
                    options.style.display = "none";
                }, 200);
            });

            // Handle option selection
            optionElements.forEach(option => {
                option.addEventListener("click", function () {
                    selectedOption = this.getAttribute("data-value"); // Update selected option
                    input.value = selectedOption + ": "; // Add selected option to input
                    input.focus(); // Keep focus on the input

                    // Scroll to the selected table
                    scrollToTable(selectedOption);
                });
            });

            // Handle Backspace key to clear the selected option
            input.addEventListener("keydown", function (event) {
                if (event.key === "Backspace") {
                    const prefixWithColon = selectedOption + ": "; // Full prefix including ": "
                    const inputValue = input.value;

                    // Check if the cursor is at the start of the input and the prefix is present
                    if (inputValue.startsWith(prefixWithColon)) {
                        if (input.selectionStart <= prefixWithColon.length) {
                            event.preventDefault(); // Prevent deleting individual characters
                            input.value = ""; // Clear the input
                            selectedOption = ""; // Reset the selected option
                            options.style.display = "block"; // Show the options dropdown again
                        }
                    }
                }
            });

            // Handle search input to filter the selected table
            input.addEventListener("input", function () {
                const searchQuery = input.value.replace(selectedOption + ": ", "").toLowerCase(); // Remove prefix and convert to lowercase
                filterTable(selectedOption, searchQuery); // Filter the selected table
            });

            //// Function to filter the selected table
            //function filterTable(tableType, searchQuery) {
            //    let tableBody;
            //    switch (tableType) {
            //        case "products":
            //            tableBody = document.getElementById("productsTableBody");
            //            break;
            //        case "orders":
            //            tableBody = document.getElementById("OrderesTable");
            //            break;
            //        case "users":
            //            tableBody = document.getElementById("userTableBody");
            //            break;
            //        default:
            //            return; // Exit if no table is selected
            //    }

            //    if (!tableBody) return; // Exit if the table body is not found

            //    const rows = tableBody.getElementsByTagName("tr");

            //    for (let row of rows) {
            //        const cells = row.getElementsByTagName("td");
            //        let rowMatches = false;

            //        for (let cell of cells) {
            //            if (cell.textContent.toLowerCase().includes(searchQuery)) {
            //                rowMatches = true;
            //                break;
            //            }
            //        }

            //        // Show or hide the row based on the search query
            //        row.style.display = rowMatches ? "" : "none";
            //    }

            //}


            // Function to filter the selected table
            function filterTable(tableType, searchQuery) {
                let tableBody;
                switch (tableType) {
                    case "products":
                        tableBody = document.getElementById("productsTableBody");
                        break;
                    case "orders":
                        tableBody = document.getElementById("OrderesTable");
                        break;
                    case "users":
                        tableBody = document.getElementById("userTableBody");
                        break;
                    default:
                        return; // Exit if no table is selected
                }

                if (!tableBody) return; // Exit if the table body is not found

                const rows = tableBody.getElementsByTagName("tr");
                let firstVisibleRow = null; // Track the first visible row

                for (let row of rows) {
                    const cells = row.getElementsByTagName("td");
                    let rowMatches = false;

                    for (let cell of cells) {
                        if (cell.textContent.toLowerCase().includes(searchQuery)) {
                            rowMatches = true;
                            break;
                        }
                    }

                    // Show or hide the row based on the search query
                    row.style.display = rowMatches ? "" : "none";

                    // Track the first visible row
                    if (rowMatches && !firstVisibleRow) {
                        firstVisibleRow = row;
                    }
                }

                // Scroll to the first visible row
                if (firstVisibleRow) {
                    firstVisibleRow.scrollIntoView({ behavior: "smooth", block: "start" });
                }
            }


            // Function to scroll to the selected table
            function scrollToTable(tableType) {
                let tableElement;
                switch (tableType) {
                    case "products":
                        tableElement = document.getElementById("productsTable");
                        //console.log("Products Table Element:", tableElement); // Debugging
                        break;
                    case "orders":
                        tableElement = document.getElementById("ordersTable");
                        //console.log("Orders Table Element:", tableElement); // Debugging
                        break;
                    case "users":
                        tableElement = document.getElementById("usersTable");
                        //console.log("Users Table Element:", tableElement); // Debugging
                        break;
                    default:
                        return; // Exit if no table is selected
                }

                if (tableElement) {
                    tableElement.scrollIntoView({ behavior: "smooth", block: "start" }); // Smooth scroll to the table
                } else {
                    console.error("Table element not found for:", tableType); // Debugging
                }
            }
        });

    </script>


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
                document.body.style = "max-height: 100vh;";

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

            }
            function HideAddWindowFunction() {
                document.getElementById("AddItemContainer").style = "top: -100%;";
                document.body.style = "max-height: auto;";

                deleteImage("productImagePreview", "deleteProductImage");
                deleteImage("sideImagePreview", "deleteSideImage");
            }

            function AddUserFunction() {
                document.body.style = "max-height: 100vh;";

                document.getElementById("AddUserButton").style = "display:block";
                document.getElementById("EditUserButton").style = "display:none";
                document.getElementById("AddUserDiv").style = "top: 0;";

                document.getElementById('inputUsername').value = "";
                document.getElementById('inputEmail').value = "";
                document.getElementById('inputPassword').value = "";
                document.getElementById('inputConfirmPassword').value = "";

                switchToAddMode();
            }
              
            function ShowAddUserFunctionAsEdit(id, name, email, password) {
                document.body.style = "max-height: 100vh;";

                document.getElementById("AddUserButton").style = "display:none";
                document.getElementById("EditUserButton").style = "display:block";
                document.getElementById("AddUserDiv").style = "top: 0;";

                document.getElementById('inputUsername').value = name;
                document.getElementById('inputEmail').value = email;
                document.getElementById('inputPassword').value = password;
                document.getElementById('inputConfirmPassword').value = password;
                }

            function HideAddUserWindowFunction() {
                //document.getElementById("ButtonEditProduct").style = "display:none";
                document.getElementById("AddUserDiv").style = "top: -100%;";
                document.body.style = "max-height: auto;";
            }

            function ShowAddWindowFunctionAsEdit(id, title, desc1, desc2, price,
                           no, img1, img2, category) {
                document.getElementById("ButtonAddProduct").style = "display:none";
                document.getElementById("ButtonEditProduct").style = "display:block";
                document.getElementById("AddItemContainer").style = "top: 0;";

                document.getElementById("ProId").value = id;
                document.getElementById("ProTitle").value = title;
                document.getElementById("ProShortDesc").value = desc1;
                document.getElementById("ProLongDesc").value = desc2;
                document.getElementById("ProPrice").value = price;
                document.getElementById("ProQuantity").value = no;
                document.getElementById("ProCategory").selectedIndex = category;
                loadImageFromPath("productImagePreview", "deleteProductImage", "/AllUploadedImages/" + img1);
                loadImageFromPath("sideImagePreview", "deleteSideImage", "/AllUploadedImages/" + img2);

                const productImageInput = document.getElementById('productImageInput');
                const sideImageInput = document.getElementById('sideImageInput');
                productImageInput.removeAttribute('required');
                sideImageInput.removeAttribute('required');


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
            
            function DeleteUser(userId) {
                console.log("Deleting user with ID:", userId); // Debugging

                return $.ajax({
                    type: "POST",
                    url: "/AdminDashboard.aspx/DeleteUser", // Correct URL for the WebMethod
                    data: JSON.stringify({ userId: userId }), // Send the userId as data
                    contentType: "application/json; charset=utf-8", // Ensure content type is set to JSON
                    dataType: "json", // Expect JSON response
                    success: function (response) {
                        console.log("Response from server:", response); // Debugging
                        if (response.d === "Success") {
                            location.reload(); // Reload the page immediately
                        } else {
                            Swal.fire({
                                title: 'Error!',
                                text: "Failed to delete the user: " + response.d,
                                icon: 'error',
                                confirmButtonText: 'Close'
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX Error:", error); // Debugging
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