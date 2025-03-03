<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="TestNewWeb1.contact" %>
<%@ Register Src="~/Components/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Components/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
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

    <title>Hexashop - Contact Page</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">

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
    <div class="page-heading about-page-heading" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-content">
                        <h2>Contact Us</h2>
                        <span>Have questions or need assistance? Our team is here to help. Get in touch with us today!</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** Contact Area Starts ***** -->
    <div class="contact-us">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div id="map">
                      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d90186.37207676383!2d-80.13495239500924!3d25.9317678710111!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88d9ad1877e4a82d%3A0xa891714787d1fb5e!2sPier%20Park!5e1!3m2!1sen!2sth!4v1637512439384!5m2!1sen!2sth" width="100%" height="400px" frameborder="0" style="border:0" allowfullscreen></iframe>
                      <!-- You can simply copy and paste "Embed a map" code from Google Maps for any location. -->
                      
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>Say Hello. Don't Be Shy!</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                    <form id="contact" action="" method="post" runat="server">
                        <input hidden runat="server" id="country" />
                        <input hidden runat="server" id="city" />
                        <input hidden runat="server" id="region" />
                        <input hidden runat="server" id="timezone" />

                        <div class="row">
                            <div class="col-lg-6">
                                <fieldset>
                                    <input name="name" type="text" placeholder="Your name" required="" id="name" runat="server">
                                </fieldset>
                            </div>
                            <div class="col-lg-6">
                                <fieldset>
                                    <input name="email" type="text" placeholder="Your email" required="" id="email" runat="server">
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <fieldset>
                                    <textarea name="message" rows="6" placeholder="Your message" required="" id="message" runat="server" maxlength="2000"></textarea>
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <fieldset>
                                    <button type="submit" id="FormSubmit" class="main-dark-button" runat="server">
                                        <i class="fa fa-paper-plane"></i>
                                    </button>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Contact Area Ends ***** -->

    <!-- ***** Subscribe Area Starts ***** -->
    <uc:Subscribe ID="SubscribeControl" runat="server" />
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


    <script>
        // Function to fetch and set location data
        function fetchAndSetLocation() {
            fetch('https://ipinfo.io/json')
                .then(response => response.json())
                .then(data => {
                    // Set values in the hidden input fields
                    document.getElementById("country").value = data.country || "Unknown";
                    document.getElementById("city").value = data.city || "Unknown";
                    document.getElementById("region").value = data.region || "Unknown";
                    document.getElementById("timezone").value = data.timezone || "Unknown";

                    // Log the data for debugging
                    console.log("Location data fetched:", data);
                })
                .catch(error => {
                    console.error("Error fetching location:", error);

                    // Set default values in case of an error
                    document.getElementById("country").value = "Unknown";
                    document.getElementById("city").value = "Unknown";
                    document.getElementById("region").value = "Unknown";
                    document.getElementById("timezone").value = "Unknown";
                });
        }

        // Run the function when the DOM is fully loaded
        document.addEventListener("DOMContentLoaded", fetchAndSetLocation);
    </script>


        <script>
            function SubmitContactForm() {
                event.preventDefault();

                // Get form data
                var name = document.getElementById("name").value;
                var email = document.getElementById("email").value;
                var message = document.getElementById("message").value;
                var country = document.getElementById("country").value;
                var city = document.getElementById("city").value;
                var region = document.getElementById("region").value;
                var timezone = document.getElementById("timezone").value;


                // Send AJAX request
                $.ajax({
                    type: "POST",
                    url: "contact.aspx/SubmitContactForm",
                    data: JSON.stringify({
                        name: name,
                        email: email,
                        message: message,
                        country: country,
                        city: city,
                        region: region,
                        timezone: timezone
                    }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        // Parse the JSON response
                        var result = response.d; // ASP.NET Web Methods wrap the response in a "d" object
                        if (result.status === "success") {
                            Swal.fire({
                                title: 'Success!',
                                text: result.message,
                                icon: 'success',
                                confirmButtonText: 'OK'
                            }).then((res) => {
                                location.reload();
                            });

                            document.getElementById("contact").reset(); // Reset the form
                        } else {
                            Swal.fire({
                                title: 'Error!',
                                text: result.message, // Show the error message from the response
                                icon: 'error',
                                confirmButtonText: 'Close'
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("An error occurred while sending the message. Please try again.");
                        console.error(xhr.responseText);
                    }
                });
            }

            // Attach the function to the form's submit event
            document.getElementById("contact").addEventListener("submit", SubmitContactForm);
</script>

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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  </body>

</html>
