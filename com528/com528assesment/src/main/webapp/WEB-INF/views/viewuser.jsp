
<%@page import="com.javaDemo1.demojava2.vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
<style>
        img {
    max-width: 100%;
    width: 200px;
    height: 200px;
    border-radius: 25px;
    transition: 17.5s;
}
    </style>
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

                                     <li class="menu-item"> <a href="user_change_password.jsp" class="text-light-black">Change Password</a>
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

        <div class="col-12">

            <%
            if (session.getAttribute("user_email") == null) {
                    response.sendRedirect("/home");
                } else {
                    String useremail = session.getAttribute("user_email").toString();
                    ResultSet rs_c = DBLoader.executeQuery("select * from users where email='" + useremail + "'");
            %>
            <table class="table">

                    <tr>
                        <th>Email</th>
                        <th>Name</th>
                        <th>Photo</th>
                        <th>Phone</th>
                    </tr>





                    <%
                        while (rs_c.next()) {
                    %>
                    <tr class="active">
                        <td><%=rs_c.getString("email")%></td>
                        <td><%=rs_c.getString("name")%></td>
                        <td><img src="/upload_folder/aa.png" width="20" height="20"></td>

                        <td><%=rs_c.getString("mobileno")%></td>


                    </tr>
                    <%
                        }
            }
                    %>


            </table>


        </div>

        <!-- Add Arrows -->





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

