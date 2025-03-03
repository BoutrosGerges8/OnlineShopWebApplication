<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="single-product.aspx.cs" Inherits="TestNewWeb1.single_product" %>
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
    
    <link rel="icon" type="image/x-icon" href="/assets/icon/favicon.ico" />

    <title>Hexashop - Product Detail Page</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">

    <style>
        .qty{
            min-width: 80px;
        }
    </style>

    <style>
        .image-container {
            position: relative;
            width: 100%;
            padding-top: 53%;
            overflow: hidden;
            margin-bottom: 50px;
        }

        .image-container img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: auto;
            object-fit: cover;
        }
    </style>


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
    
    
    <!-- ***** Header Area Start ***** -->
    <uc:Header ID="HeaderControl" runat="server" />


    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->
    <div class="page-heading" id="top">
        <div class="container">
            
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->


    <!-- ***** Product Area Starts ***** -->
        <form runat="server" id="FormBuyTheProduct">
            <input type="hidden" runat="server" id="ProIdHidden" />
            <input type="hidden" runat="server" id="UserIdHidden" />
            <section class="section" id="product">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="left-images">
                                <div class="image-container">
                                    <img src="assets/images/single-product-01.jpg" alt="" runat="server" id="ProImg1">
                                </div>
                                <div class="image-container">
                                    <img src="assets/images/single-product-02.jpg" alt="" runat="server" id="ProImg2">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="right-content">
                                <h4 runat="server" id="ProTitle">New Green Jacket</h4>
                                <input type="hidden" runat="server" id="ProPriceValue" />
                                <span class="price" runat="server" id="ProPrice">$75.00</span>
                                <ul class="stars" runat="server" id="ProStars">
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                </ul>
                                <span runat="server" id="ProLongDesc">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod kon tempor incididunt ut labore.
                                </span>
                                <div class="quote">
                                    <i class="fa fa-quote-left"></i><p runat="server" id="ProShortDesc">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiuski smod.
                                    </p>
                                </div>
                                <div class="quantity-content" runat="server" id="RatingDiv">
                                    <div class="left-content">
                                        <h6>Rate Product</h6>
                                    </div>
                                    <div class="right-content">
                                        <div class="quantity buttons_added total">
                                            <input type="button" value="-" class="minus"> 
                                            <input type="number" step="1" id="RateProduct"
                                                min="0" max="5" name="quantity" value="0" title="Rate"
                                                class="input-text qty text" size="4" pattern="" inputmode=""
                                                onchange="updateQuantity()" oninput="validateInput(this)" runat="server" />
                                            <input type="button" value="+" class="plus">
                                            
                                            <div class="main-border-button" style="margin-top:20px;">
                                                <a href="javascript:void(0)" id="RateProductButton" onclick="rateProduct()">
                                                    Rate Product
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="quantity-content">
                                    <div class="left-content">
                                        <h6>No. of Orders</h6>
                                    </div>
                                    <div class="right-content">
                                        <div class="quantity buttons_added">
                                            <input type="button" value="-" class="minus">
                                            <input type="number" step="1" id="AddQuantityOrdered" 
                                                min="1" max="21" name="quantity" value="1" title="Qty"
                                                class="input-text qty text" size="4" pattern="" inputmode=""
                                                onchange="updateQuantity()" oninput="validateInput(this)" runat="server" />
                                            <input type="button" value="+" class="plus">
                                        </div>
                                    </div>
                                </div>
                                <!-- <div class="quantity-content">
                                    <div class="left-content">
                                        <h6>Rate the item</h6>
                                    </div>
                                    <div class="right-content">
                                        <div class="quantity buttons_added">
                                            <input type="button" value="-" class="minus">
                                            <input type="number" step="1" id="RateThePro" 
                                                min="0" max="5" name="quantity" value="1" title="Qty"
                                                class="input-text qty text" size="4" pattern="" inputmode=""
                                                onchange="updateQuantity()" oninput="validateRate(this)" runat="server">
                                            <input type="button" value="+" class="plus">
                                        </div>
                                    </div>
                                </div> ->
                                <!-- Hidden field to store the rating -->
                                <input type="hidden" id="RatingHiddenField" name="RatingHiddenField" />


                                <div class="total">
                                    <h4 runat="server" id="TotalPrice">Total: $210.00</h4>
                                    <!-- <div class="main-border-button"><a href="#">Add To Cart</a></div> -->
                                    <div class="main-border-button" runat="server" id="AddToCartVid">
                                        <a href="javascript:void(0)" id="AddToCart_1" runat="server"  onclick="addToCart()">
                                            Add To Cart
                                        </a>
                                        <!-- <a href="javascript:void(0)" id="AddToCart_2" runat="server"  onclick="addToCart()">
                                            Buy Now
                                        </a> -->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </form>
    
    <!-- ***** Product Area Ends ***** -->
    
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
    <script src="assets/js/quantity.js"></script>
    
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



        let Total = document.getElementById("TotalPrice");

        function updateQuantity() {
            const inputField = document.getElementById("AddQuantityOrdered");
            const quantityValue = parseInt(inputField.value, 10); // Convert to number
            const priceText = document.getElementById("ProPrice").innerText.replace('$', ''); // Remove "$" and get the price
            const price = parseFloat(priceText); // Convert to number

            Total.innerHTML = "Total: $" + (quantityValue * price).toFixed(2); // Keep 2 decimal places
        }

        function validateInput(input) {
            const max = parseInt(input.max, 10); // Get the max value
            const min = parseInt(input.min, 10); // Get the min value
            let value = input.value; // Get the input value as a string

            // Remove any non-numeric characters
            value = value.replace(/[^0-9]/g, '');

            // Parse the cleaned value into a number
            let numericValue = parseInt(value, 10);

            // Enforce max and min values
            if (numericValue > max) {
                numericValue = max;
            } else if (numericValue < min || isNaN(numericValue)) {
                numericValue = min;
            }

            // Update the input value with the valid number
            input.value = numericValue;

            // Set the hidden field value to the valid rating
            document.getElementById("RatingHiddenField").value = numericValue;
        }

        function validateRate(input) {
            validateInput(input);
            updateRating();
        }

        function updateRating() {
            const ratingValue = document.getElementById("RatingHiddenField").value;
            // Trigger the postback to send the updated rating to the server
            __doPostBack('RateThePro', ratingValue);
            console.log("yes");
        }
    </script>


    <script type="text/javascript">
        if (typeof __doPostBack === "undefined") {
            function __doPostBack(eventTarget, eventArgument) {
                var theForm = document.forms[0];
                if (!theForm) {
                    theForm = document.createElement("form");
                    document.body.appendChild(theForm);
                }
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;
                theForm.submit();
            }
        }
    </script>


        <script>
            //function rateProduct () {
            //    // Get the rating value
            //    var rating = document.getElementById("RateProduct").value;
            //    var productId = document.getElementById("ProIdHidden").value;
            //    var userId = document.getElementById("UserIdHidden").value;

            //    // Validate rating to ensure it is between 0 and 5
            //    if (rating >= 0 && rating <= 5) {
            //        // Send the AJAX request
            //        $.ajax({
            //            url: "single-product.aspx/RatingProduct",
            //            type: 'POST',
            //            data: JSON.stringify({ productId: productId, userId: userId, rating: rating }),
            //            contentType: "application/json; charset=utf-8",
            //            dataType: "json",
            //            success: function (response) {
            //                console.log("Response:", response); // Debugging

            //                // Parse the response.d property into a JavaScript object
            //                var responseData = JSON.parse(response.d);

            //                if (responseData.success) {
            //                    Swal.fire({
            //                        title: 'Success!',
            //                        text: responseData.message,
            //                        icon: 'success',
            //                        confirmButtonText: 'OK'
            //                    }).then((res) => {
            //                        location.reload();
            //                    });
            //                } else {
            //                    console.log(responseData.message);
            //                    Swal.fire({
            //                        title: 'Error!',
            //                        text: responseData.message,
            //                        icon: 'error',
            //                        confirmButtonText: 'Close'
            //                    });
            //                }
            //            },
            //            error: function (xhr, status, error) {
            //                console.error("AJAX Error:", xhr.responseText); // Debugging
            //                alert('An error occurred: ' + error);
            //            }
            //        });
            //    } else {
            //        alert('Please select a rating between 0 and 5.');
            //    }
            //}


            function rateProduct() {
                // Get the rating value
                var rating = document.getElementById("RateProduct").value;
                var productId = document.getElementById("ProIdHidden").value;
                var userId = document.getElementById("UserIdHidden").value;

                // Validate rating to ensure it is between 0 and 5
                if (rating >= 0 && rating <= 5) {
                    // Send the AJAX request
                    $.ajax({
                        url: "single-product.aspx/RatingProduct",
                        type: 'POST',
                        data: JSON.stringify({ productId: productId, userId: userId, rating: rating }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            console.log("Response:", response); // Debugging

                            // Parse the response.d property into a JavaScript object
                            var responseData = JSON.parse(response.d);

                            if (responseData.success) {
                                Swal.fire({
                                    title: 'Success!',
                                    text: responseData.message,
                                    icon: 'success',
                                    confirmButtonText: 'OK'
                                }).then((res) => {
                                    location.reload();
                                });
                            } else {
                                // Check if the redirectTo key exists in responseData
                                if (responseData.redirectTo) {
                                    console.log("Redirecting to login page");
                                    window.location.href = responseData.redirectTo; // Redirect to login page
                                } else {
                                    console.log("No redirect, showing error");
                                    Swal.fire({
                                        title: 'Error!',
                                        text: responseData.message, // Show the error message from the response
                                        icon: 'error',
                                        confirmButtonText: 'Close'
                                    });
                                }
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error("AJAX Error:", xhr.responseText); // Debugging
                            Swal.fire({
                                title: 'Error!',
                                text: 'An error occurred while processing your request.',
                                icon: 'error',
                                confirmButtonText: 'Close'
                            });
                        }
                    });
                } else {
                    alert('Please select a rating between 0 and 5.');
                }
            }

        </script>
        <!--<script>
            // Wait for the document to be ready
            $(document).ready(function () {
                // Listen for the 'change' event on the #RateProduct input field
                $('#RateProduct').on('change', function () {
                    // Get the rating value
                    var rating = $(this).val();
                    var productId = document.getElementById("ProIdHidden").value;
                    var userId = document.getElementById("UserIdHidden").value;

                    // Validate rating to ensure it is between 0 and 5
                    if (rating >= 0 && rating <= 5) {
                        // Send the AJAX request
                        $.ajax({
                            url: "single-product.aspx/RatingProduct",
                            type: 'POST',
                            data: JSON.stringify({ productId: productId, userId: userId, rating: rating }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                console.log("Response:", response); // Debugging

                                // Parse the response.d property into a JavaScript object
                                var responseData = JSON.parse(response.d);

                                // Check the success flag and display the message
                                if (responseData.success) {
                                    alert('Rating submitted successfully!');
                                } else {
                                    alert('Error: ' + responseData.message);
                                }
                            },
                            error: function (xhr, status, error) {
                                console.error("AJAX Error:", xhr.responseText); // Debugging
                                alert('An error occurred: ' + error);
                            }
                        });
                    } else {
                        alert('Please select a rating between 0 and 5.');
                    }
                });
            });
        </script>-->

    <script type="text/javascript">


        function addToCart() {
            var productId = document.getElementById("ProIdHidden").value;
            var quantity = document.getElementById('AddQuantityOrdered').value;
            var ProPrice = document.getElementById('ProPriceValue').value;

            // Ensure price is cleaned of "$" symbol and parsed as a float
            var totalPrice = parseFloat(quantity) * parseFloat(ProPrice);

            // Send the request to the server
            $.ajax({
                type: "POST",
                url: "single-product.aspx/BuyProduct",
                data: JSON.stringify({ productId: productId, quantity: quantity, totalPrice: totalPrice }),
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
                            location.reload();
                        });
                    } else {
                        // Check if the redirectTo key exists in responseData
                        if (responseData.redirectTo) {
                            console.log("Redirecting to login page");
                            window.location.href = responseData.redirectTo; // Redirect to login page
                        } else {
                            console.log("No redirect, showing error");
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



  </body>

</html>
