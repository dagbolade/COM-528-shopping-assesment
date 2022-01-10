
<%@page import="com.javaDemo1.demojava2.vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from slidesigma.com/themes/html/gemstone/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Feb 2020 08:21:05 GMT -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="keywords" content="#">
    <meta name="description" content="#">
    <title>Gemstone | Login</title>
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="#">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="#">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="#">
    <link rel="apple-touch-icon-precomposed" href="#">
    <link rel="shortcut icon" href="#">
    <!-- Bootstrap -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Fontawesome -->
    <link href="/assets/css/font-awesome.css" rel="stylesheet">
    <!-- Flaticons -->
    <link href="/assets/css/font/flaticon.css" rel="stylesheet">
    <!-- Swiper Slider -->
    <link href="/assets/css/swiper.min.css" rel="stylesheet">
    <!-- Pe-icons -->
    <link href="/assets/css/pe-icon-7-stroke.css" rel="stylesheet">
    <!-- Range Slider -->
    <link href="/assets/css/ion.rangeSlider.min.css" rel="stylesheet">
    <!-- magnific popup -->
    <link href="/assets/css/magnific-popup.css" rel="stylesheet">
    <!-- Nice Select -->
    <link href="/assets/css/nice-select.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="/assets/css/style.css" rel="stylesheet">
    <!-- Custom Responsive -->
    <link href="/assets/css/responsive.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,500,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Libre+Franklin:400,500,600,700&amp;display=swap" rel="stylesheet">

    <script>
            function go() {
//                alert("");
                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;
                if (email === "" || password === "")
                {
                    alert("All fields are required.");
                } else
                {
                    var xhttp = new XMLHttpRequest();

                    // Step 4
                    // Callback method
                    // This method is called when server gives answer
                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var ans = xhttp.responseText.trim();
                            if (ans === "success")
                             {
//                                alert(ans);
                                window.location.href = "/admin_home";
                              }
                              else
                              {
                                alert("Invalid Credentials.")
                              }
                         }
                    };

                    // Step 2
                    xhttp.open("GET", "./adminlogin?email=" + email + "&password=" + password, true);    // true --> async request

                    // Step 3
                    xhttp.send();
                }

            }
        </script>

</head>

<body>
<div class="inner-wrapper">
    <div class="container-fluid no-padding">
        <div class="row no-gutters overflow-auto">
            <div class="col-md-6">
                <div class="main-banner">
                    <img src="assets/img/slider.jpg" class="img-fluid full-width main-img" alt="banner">
                </div>
            </div>
            <div class="col-md-6">
                <div class="section-2 user-page main-padding">
                    <div class="login-sec">
                        <div class="login-box">
                            <form>
                                <h4 class="text-light-black fw-600">Admin Login</h4>
                                <div class="row">
                                    <div class="col-12">

                                        <div class="form-group">
                                            <label class="text-light-white fs-14">Email</label>
                                            <input type="email" id="email" class="form-control form-control-submit" placeholder="Email I'd" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="text-light-white fs-14">Password</label>
                                            <input type="password" id="password" name="#" class="form-control form-control-submit"  placeholder="Password" required>
                                            <div data-name="#password" class="fa fa-fw fa-eye field-icon toggle-password"></div>
                                        </div>

                                    </div>
                                </div>
                            </form>
                            <div class="form-group">
                                <button type="submit" onclick="go()" class="btn-second-2 btn-submit full-width">Sign in</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Place all Scripts Here -->
<!-- jQuery -->
<script src="/assets/js/jquery.min.js"></script>
<!-- Popper -->
<script src="/assets/js/popper.min.js"></script>
<!-- Bootstrap -->
<script src="/assets/js/bootstrap.min.js"></script>
<!-- Range Slider -->
<script src="/assets/js/ion.rangeSlider.min.js"></script>
<!-- Swiper Slider -->
<script src="/assets/js/swiper.min.js"></script>
<!-- Nice Select -->
<script src="/assets/js/jquery.nice-select.min.js"></script>
<!-- magnific popup -->
<script src="/assets/js/jquery.magnific-popup.min.js"></script>
<!-- Maps -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnd9JwZvXty-1gHZihMoFhJtCXmHfeRQg"></script>
<!-- sticky sidebar -->
<script src="/assets/js/sticksy.js"></script>
<!-- Gemstone Js -->
<script src="/assets/js/main.js"></script>
<!-- /Place all Scripts Here -->
</body>


<!-- Mirrored from slidesigma.com/themes/html/gemstone/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Feb 2020 08:21:06 GMT -->
</html>

