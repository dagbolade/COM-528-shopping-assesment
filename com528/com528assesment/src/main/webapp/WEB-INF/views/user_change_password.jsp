<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        	<meta http-equiv="X-UA-Compatible" content="IE=edge">
        	<meta name="viewport" content="width=device-width,initial-scale=1">
        	<meta name="keywords" content="#">
        	<meta name="description" content="#">
        	<title>Login Demo | Homepage</title>
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
        	<!-- Pe-icons -->
        	<link href="/assets/css/pe-icon-7-stroke.css" rel="stylesheet">
        	<!-- Swiper Slider -->
        	<link href="/assets/css/swiper.min.css" rel="stylesheet">
        	<!-- Range Slider -->
        	<link href="/assets/css/ion.rangeSlider.min.css" rel="stylesheet">
        	<!-- magnific popup -->
        	<link href="/assets/css/magnific-popup.css" rel="stylesheet">
        	<!-- Nice Select -->
        	<link href="/assets/css/nice-select.css" rel="stylesheet">
        	<!-- Custom Stylesheet -->
        	<link href="/assets/css/style.css" rel="stylesheet">
        	<link href="/assets/css/responsive.css" rel="stylesheet">
        	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,500,600,700&amp;display=swap" rel="stylesheet">
        	<link href="https://fonts.googleapis.com/css?family=Libre+Franklin:400,500,600,700&amp;display=swap" rel="stylesheet">

        <script>
            function change_passwoord(){
                var email = document.getElementById("email").value;
                var oldpassword = document.getElementById("oldpassword").value;
                var newpassword = document.getElementById("newpassword").value;
                var confirmpassword = document.getElementById("confirmpassword").value;

                if(email == "" || oldpassword == "" || newpassword == "" || confirmpassword == ""){
                    alert("All fields are required.");
                }
                else if(newpassword === confirmpassword){
                     var xhttp = new XMLHttpRequest();

                     xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var ans = xhttp.responseText.trim();
                            if(ans === "success"){
                                alert(ans);
                            }
                            else {
                                alert("password not match with our database.");
                            }
                        }
                    };

                    xhttp.open("GET", "./change_password?email="+email+"&oldpassword="+oldpassword+"&newpassword="+newpassword, true);    // true --> async request

                    xhttp.send();
                }
                else {
                     alert("Password and confirm password must match.");
                }

            }
            </script>
    </head>
    <body>

<!-- Navigation -->
<header class="header">
    <div class="container-fluid custom-container">
        <div class="row">
            <div class="col-12">
                <div class="navigation">
                    <div class="logo">
                        <a href="/home">
                            <img src="/assets/img/logo1.png" class="image-fit" alt="logo">
                        </a>
                    </div>
                    <div class="main-navigation">
                        <nav>
                            <ul class="main-menu">
                                <li class="menu-item"> <a href="/home" class="text-light-black">Home</a>


                                </li>
                                 <%
                            if (session.getAttribute("user_email") != null) {
                            %>

                             <li class="menu-item"> <a href="/user_change_password" class="text-light-black">Change Password</a>
                                </li>
                                <li class="menu-item"> <a href="/ViewUser" class="text-light-black">View User</a>
                                </li>
                                <li class="menu-item"> <a href="/upload" class="text-light-black">Upload Document</a>
                                </li>
                           <%
                            }

                        %>


                            </ul>
                        </nav>
                    </div>
                    <div class="right-side-navigation">
                        <%                                                        String user_name = "";
                            if (session.getAttribute("user_email") == null) {
                        %>





                        <ul>


                            <li class="user-details">
                                <a href="/login"> <i class="pe-7s-user"></i> <span>Hi, </span>
                                </a>
                            </li>

                            <%
                            } else {
                                user_name = session.getAttribute("user_name").toString();
                            %>
                            </ul>
                            <ul>

                                <li class="user-details">
                                    <a href="/login"> <i class="pe-7s-user"></i> <span>Hi, <%=user_name%></span>
                                    </a>
                                </li>

       <%
                    int count = 0;
                    ResultSet rs_fetch_cart_count = DBLoader.executeQuery("select * from cart_table where useremail='" + session.getAttribute("user_email") + "'");
                    while (rs_fetch_cart_count.next()) {
                        count++;
                        System.out.println("count === " + count);
                    }
                %>
                <li class="cart"> <a  style="color: white" href="view_user_cart.jsp" class="nav-link"><i class="pe-7s-cart"></i><%=count%></a>



                </li>
                                <%

                                    }


                                %>
                            </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="main-sec"></div>
        <br>
        <br>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                     <div class="login-sec">
                                <div class="login-box">
                                    <form>
                                        <h4 class="text-light-black fw-600">Change Password</h4>
                                        <div class="row">
                                            <div class="col-12">

                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">Email</label>
                                                     <input type="email" id="email" class="form-control form-control-submit" placeholder="Email I'd" value="<%=session.getAttribute("user_email").toString()%>" readonly required>
                                                </div>
                                                <div class="form-group">
                                                    <label class="text-light-white fs-14"> Old Password</label>
                                                    <input type="password" id="oldpassword" name="#" class="form-control form-control-submit"  placeholder="Password" required>
                                                </div>
                                                 <div class="form-group">
                                                    <label class="text-light-white fs-14"> New Password</label>
                                                    <input type="password" id="newpassword" name="#" class="form-control form-control-submit"  placeholder="Password" required>
                                                </div>

                                                <div class="form-group">
                                                    <label class="text-light-white fs-14"> Confirm  Password</label>
                                                    <input type="password" id="confirmpassword" name="#" class="form-control form-control-submit"  placeholder="Password" required>
                                                </div>


                                            </div>
                                        </div>
                                    </form>
                                     <div class="form-group">
                                                    <button type="submit" onclick="change_passwoord()" class="btn-second-2 btn-submit full-width">Sign in</button>
                                                </div>


                                </div>
                            </div>

                </div>

            </div>

        </div>

        <!-- footer -->
        	<footer class="section-padding bg-light-theme pt-0 u-line bg-black">


        	</footer>

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
</html>
