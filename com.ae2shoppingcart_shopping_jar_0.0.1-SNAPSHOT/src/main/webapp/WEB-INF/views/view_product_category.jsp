

<%@page import="com.javaDemo1.demojava2.vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
      	<meta name="viewport" content="width=device-width, initial-scale=1">
              <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
              <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
              <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <%
            int pid = 0 , offer_price = 0 , max_price =0;
        %>

        <script>
              function add_to_cart(pid,offer_price,max_price) {

                var qty = "1";

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        var ans = xhttp.responseText.trim();

                        alert(ans);
                        if (ans === "NOTLOGIN") {
                            window.location.href = "user_login.jsp";
                        }
                    }
                };

                // Step 2
                xhttp.open("POST", "./add_to_cart?qty="+qty+"&pid="+pid+"&offer_price="+offer_price+"&max_price="+max_price, true);    // true --> async request

                // Step 3
                xhttp.send();
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
        <%             String categoryname = request.getParameter("categoryname");
        %>

        <div class="main-sec"></div>
        <!-- breadcrumb -->
        <div class="breadcrumb-area">
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div class="breadcrumb-content">
                    <h2 class="text-white"><%=categoryname%></h2>
                    <ul>
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">Shop Left Sidebar</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- breadcrumb -->
        <!--product Start-->
        <section class="section-padding our-product bg-light-theme">
            <div class="container-fluid custom-container">
                <div class="row">
                    <div class="col-xl-12 col-lg-12">
                        <div class="full-width">
                            <div class="row">
                                <%
                                    ResultSet rs_products = DBLoader.executeQuery("select * from products where category_name = '" + categoryname + "'");
                                    while (rs_products.next()) {
                                %>
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                                    <div class="product-box mb-md-20">
                                        <div class="product-img">
                                            <a href="#">
                                                <img src="<%=rs_products.getString("product_image")%>" class="img-fluid full-width" alt="product-img">
                                            </a>
                                            <div class="product-badge">
                                                <div class="product-label new"> <span>New</span>
                                                </div>

                                            </div>

                                            <div class="cart-hover"> <a href="/productdetail?pid=<%=rs_products.getString("pid")%>" class="btn-cart white-btn text-light-green fw-600" tabindex="-1">Add To Cart</a>
                                            </div>
                                        </div>
                                        <div class="product-caption text-center"> <span class="product-category"><a href="#"><%=categoryname%></a></span>
                                            <h6 class="product-title fw-500 mt-10"><a href="product_detail.jsp?pid=<%=rs_products.getString("pid")%>" class="text-light-black"><%=rs_products.getString("product_name")%></a></h6>
                                            <div class="product-money mt-10"> <span class="text-dark-red fw-500">$<%=rs_products.getString("offer_price")%></span>
                                                <span class="text-price">$<%=rs_products.getString("max_price")%></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%
                                    }
                                %>





                            </div>
                        </div>
                        <!--					<div class="custom-pagination align-item-center">
                                                                        <nav aria-label="Page navigation example">
                                                                                <ul class="pagination">
                                                                                        <li class="page-item">
                                                                                                <a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">«</span>
                                                                                                        <span class="sr-only">Previous</span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="page-item"><a class="page-link" href="#">1</a>
                                                                                        </li>
                                                                                        <li class="page-item active"><a class="page-link" href="#">2</a>
                                                                                        </li>
                                                                                        <li class="page-item"><a class="page-link" href="#">3</a>
                                                                                        </li>
                                                                                        <li class="page-item">
                                                                                                <a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">»</span>
                                                                                                        <span class="sr-only">Next</span>
                                                                                                </a>
                                                                                        </li>
                                                                                </ul>
                                                                        </nav>
                                                                </div>-->
                    </div>
                </div>
            </div>
        </section>
        <!--Product-end-->





    </body>
</html>
