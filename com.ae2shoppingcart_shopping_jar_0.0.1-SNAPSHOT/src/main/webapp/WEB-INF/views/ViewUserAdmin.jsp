
<%@page import="com.javaDemo1.demojava2.vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
          <header class="header">
                    <div class="container-fluid custom-container">
                        <div class="row">
                            <div class="col-12">
                                <div class="navigation">
                                    <div class="logo">
                                        <a href="index.jsp">
                                            <img src="/assets/img/logo12.png" style="width:60px;" alt="logo">
                                        </a>
                                    </div>
                                    <div class="main-navigation">
                                        <nav>
                                            <ul class="main-menu">
                                                <li class="menu-item"> <a href="/admin_home" class="text-light-black">Home</a>
                                                    <!--										<ul class="sub-menu">
                                                                                                                                            <li class="menu-item"> <a href="index.jsp">HomePage 1</a>
                                                                                                                                            </li>
                                                                                                                                            <li class="menu-item"> <a href="homepage-1.html">Homepage 2</a>
                                                                                                                                            </li>
                                                                                                                                            <li class="menu-item"> <a href="homepage-2.html">Homepage 3</a>
                                                                                                                                            </li>
                                                                                                                                    </ul>-->
                                                </li>

                                                <li class="menu-item menu-item-has-children"> <a href="#" class="text-light-black">Manage Category</a>
                                                    <ul class="sub-menu">

                                                        <li class="menu-item"> <a href="/admin_add_category">Add category</a>
                                                        </li>

                                                        <li class="menu-item"> <a href="/admin_view_category">View category</a>
                                                        </li>


                                                    </ul>
                                                </li>
                                                 <li class="menu-item menu-item-has-children"> <a href="#" class="text-light-black">Manage Products</a>
                                                    <ul class="sub-menu">

                                                        <li class="menu-item"> <a href="/admin_add_product">Add Product</a>
                                                        </li>

                                                        <li class="menu-item"> <a href="/admin_view_product">View Product</a>
                                                        </li>


                                                    </ul>
                                                </li>
<li class="menu-item"> <a href="/ViewUserAdmin" class="text-light-black">View User</a>
</li>
                                                <li class="menu-item"> <a href="/admin_manage_orders" class="text-light-black">Manage Orders</a>



                                                <!--									<li class="menu-item menu-item-has-children"> <a href="index.jsp" class="text-light-black">Pages</a>
                                                                                                                                <ul class="sub-menu">
                                                                                                                                        <li class="menu-item"> <a href="compare.html">Compare</a>
                                                                                                                                        </li>
                                                                                                                                        <li class="menu-item"> <a href="wishlist.html">Wishlist</a>
                                                                                                                                        </li>
                                                                                                                                        <li class="menu-item"> <a href="checkout.html">Check Out</a>
                                                                                                                                        </li>
                                                                                                                                        <li class="menu-item"> <a href="order-details.html">Order</a>
                                                                                                                                        </li>
                                                                                                                                        <li class="menu-item"> <a href="404.html">404 ERROR</a>
                                                                                                                                        </li>
                                                                                                                                        <li class="menu-item"> <a href="login.html">Log In</a>
                                                                                                                                        </li>
                                                                                                                                        <li class="menu-item"> <a href="register.html">Register</a>
                                                                                                                                        </li>
                                                                                                                                </ul>
                                                                                                                        </li>-->
                                                <!--									<li class="menu-item menu-item-has-children"> <a href="index.jsp" class="text-light-black">Blog</a>
                                                                                                                                <ul class="sub-menu">
                                                                                                                                        <li class="menu-item"> <a href="blog-right.html">Blog Right</a>
                                                                                                                                        </li>
                                                                                                                                        <li class="menu-item"> <a href="blog-left.html">Blog Left</a>
                                                                                                                                        </li>
                                                                                                                                        <li class="menu-item"> <a href="blog-details.html">Blog Detail</a>
                                                                                                                                        </li>
                                                                                                                                </ul>
                                                                                                                        </li>-->
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="right-side-navigation">





                                        <ul>
                                            <li class="hamburger-menu">
                                                <a href="#" class="menu-btn"> <span></span>
                                                    <span></span>
                                                    <span></span>
                                                </a>
                                            </li>

                                            <li class="user-details">
                                                <a href="admin_login.jsp"> <i class="pe-7s-user"></i> <span>Hi, </span>
                                                </a>
                                            </li>
                <!--                             <li class="wishlist"> <a href="#" class="text-dark-red"><i class="pe-7s-bell"></i></a>
                                                    <span class="cart">3</span>
                                                </li>
                                                <li class="cart"> <a href="#" class="text-dark-red"><i class="pe-7s-cart"></i></a>
                                                    <span class="cart">3</span>
                                                </li>-->



                                            </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
        <div class="col-12">

            <%                                                        if (session.getAttribute("admin_email") == null) {
                    response.sendRedirect("/admin_login");
                } else {
                    String useremail = session.getAttribute("admin_email").toString();
                    ResultSet rs_c = DBLoader.executeQuery("select * from users ");
            %>
            <table class="table">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Name</th>
                        <th>Photo</th>
                        <th>Phone</th>
                        
                    </tr>
                </thead>
                <tbody>



                    <%
                        while (rs_c.next()) {
                    %>
                    <tr class="active">
                        <td><%=rs_c.getString("email")%></td>
                        <td><%=rs_c.getString("name")%></td>
                        <td><img src="<%=rs_c.getString("photo")%>" width="100" height="100"/></td>
                        
                        <td><%=rs_c.getString("mobileno")%></td>
                        
                        
                    </tr>
                    <%
                        }
            }
                    %>

                </tbody>
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
