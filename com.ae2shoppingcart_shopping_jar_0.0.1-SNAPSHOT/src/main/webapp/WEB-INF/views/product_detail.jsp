

<%@page import="com.javaDemo1.demojava2.vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">


    <!-- Mirrored from slidesigma.com/themes/html/gemstone/shop-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Feb 2020 08:20:35 GMT -->
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
            String productname = "", product_desc = "", categoryname = "", product_image = "";
            int max_price = 0, offer_price = 0;
            int pid = Integer.parseInt(request.getParameter("pid"));
            System.out.println("....." + pid);
            ResultSet rs_product = DBLoader.executeQuery("select * from products where pid = " + pid + "");
            if (rs_product.next()) {
                productname = rs_product.getString("product_name");
                product_desc = rs_product.getString("product_desc");
                categoryname = rs_product.getString("category_name");
                product_image = rs_product.getString("product_image");
                max_price = rs_product.getInt("max_price");
                offer_price = rs_product.getInt("offer_price");

            }
        %>
        <script>

            function add_to_cart() {
                var qty = document.getElementById("qty").value;

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
                xhttp.open("POST", "./add_to_cart?qty="+qty+"&pid=<%=pid%>&offer_price=<%=offer_price%>&max_price=<%=max_price%>", true);    // true --> async request

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
        <div class="main-sec"></div>
        <!-- breadcrumb -->
        <div class="breadcrumb-area">
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div class="breadcrumb-content">
                    <h2 class="text-white"><%=categoryname%></h2>
                    <ul>
                        <li><a href="index.jsp">Home</a>
                        </li>
                        <li><a href="shop-left.html">Shop</a>
                        </li>
                        <li class="active">Shop Details</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- breadcrumb -->
        <!--Shop-Details-->
        <section class="section-padding bg-light-theme">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="shop-detail-image">
                            <div class="detail-slider">
                                <div class="swiper-container gallery-top">
                                    <div class="swiper-wrapper">
                                        <%
                                            ResultSet rs_product_gallery2 = DBLoader.executeQuery("select * from product_gallary where pid =" + pid);
                                            while (rs_product_gallery2.next()) {


                                        %>



                                        <div class="swiper-slide">
                                            <a href="#" class="popup">
                                                <img src="<%=rs_product_gallery2.getString("gallary_image")%>" class="img-fluid full-width" alt="slider">
                                            </a>
                                            <div class="shop-type-tag"> <a href="#" class="bg-custom-black type-tag">Sale</a>
                                            </div>
                                        </div>


                                        <%
                                            }
                                        %>





                                    </div>
                                    <!-- Add Arrows -->
                                    <!-- Add Arrows -->
                                    <div class="swiper-button-next swiper-button-white"></div>
                                    <div class="swiper-button-prev swiper-button-white"></div>
                                </div>
                                <div class="swiper-container gallery-thumbs ">
                                    <div class="swiper-wrapper">
                                        <%
                                            ResultSet rs_product_gallery = DBLoader.executeQuery("select * from product_gallary where pid =" + pid);
                                            while (rs_product_gallery.next()) {


                                        %>


                                        <div class="swiper-slide">
                                            <img src="<%=rs_product_gallery.getString("gallary_image")%>" class="img-fluid full-width" alt="slider">
                                        </div>
                                        <%
                                            }
                                        %>


                                    </div>
                                    <!-- Add Arrows --> <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="shop-detail-contents mb-md-40 mt-md-40">
                            <div class="shop-detail-content-wrapper">
                                <h3 class="text-custom-black"><%=productname%></h3>
                            </div>
                            <div class="ratings d-flex mb-xl-20"> <span class="text-yellow"><i class="fas fa-star"></i></span>
                                <span class="text-yellow"><i class="fas fa-star"></i></span>
                                <span class="text-yellow"><i class="fas fa-star"></i></span>
                                <span class="text-dark-white"><i class="fas fa-star"></i></span>
                                <span class="text-dark-white"><i class="fas fa-star"></i></span>
                                <div class="pro-review"> <span>1 Reviews</span>
                                </div>
                            </div>
                            <div class="price">
                                <h4 class="text-custom-red price-tag">$ <%=offer_price%> <span class="text-light-white fw-400 fs-14">$ <del><%=max_price%></del></span></h4>
                            </div>
                            <div class="product-full-des mb-20">
                                <p class="mb-0"><%=product_desc%></p>
                            </div>
                            <div class="availibity mt-20">
                                <h6 class="text-custom-black fw-600">Avability: <span class="text-success ml-2">In Stock</span></h6>
                            </div>
                            <div class="quantity mb-xl-20">
                                <h6 class="text-custom-black mb-0 mr-2 fw-600">Qty:</h6>
                                <div class="product-qty-input">
                                    <button class="minus-btn" type="button" name="button"> <i class="fas fa-minus"></i>
                                    </button>
                                    <input type="text" id="qty" class="form-control form-control-qty text-center" name="name" value="1">
                                    <button class="plus-btn" type="button" name="button"> <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="shop-bottom">
                                <div class="shop-meta mt-20">
                                    <h6 class="text-custom-black mb-0 fw-600">Categories:</h6>
                                    <ul class="list-inline ml-2">
                                        <li class="list-inline-item"><a href="#"><%=categoryname%></a>
                                        </li>

                                    </ul>
                                </div>
                                <!--                                <div class="shop-meta mt-20">
                                                                    <h6 class="text-custom-black mb-0 fw-600">Tags:</h6>
                                                                    <ul class="list-inline ml-2">
                                                                        <li class="list-inline-item"><a href="#">Luxary</a>
                                                                        </li>
                                                                        <li class="list-inline-item"><a href="#">Diamond</a>
                                                                        </li>
                                                                        <li class="list-inline-item"><a href="#">New Arrivel</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>-->
                                <div class="product-btn mt-20"> <a href="#" onclick="add_to_cart()" class="btn-solid with-line ml-2">Add to Cart </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="shop-detail-description-sec">
                            <div class="tabs">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item"> <a class="nav-link  active" data-toggle="tab" href="#description">Description</a>
                                    </li>
                                    <li class="nav-item"> <a class="nav-link " data-toggle="tab" href="#reviews">Reviews (4)</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="description">
                                        <p class=" mb-xl-20">
                                            <%=product_desc%></p>
                                    </div>
                                    <div class="tab-pane fade" id="reviews">
                                        <!-- comments -->
                                        <div class="comment-box p-relative">
                                            <div id="comment-box">
                                                <ul class="comments">
                                                    <li class="comment">
                                                        <article>
                                                            <div class="comment-avatar">
                                                                <img src="assets/img/user/user-1.png" class="rounded-circle" alt="comment">
                                                            </div>
                                                            <div class="comment-content">
                                                                <div class="comment-meta">
                                                                    <div class="comment-meta-header">
                                                                        <h5 class="text-custom-red fw-600 author mb-3">Rosalina Pong</h5>
                                                                        <div class="post-date">
                                                                            <div class="date bg-custom-black">29 Jan <span class="year bg-custom-red ">2020</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="comment-meta-reply"> <a href="#" class="comment-reply-link btn-first red-btn text-custom-black">Reply</a>
                                                                    </div>
                                                                </div>
                                                                <div class="comment">
                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                                </div>
                                                            </div>
                                                        </article>
                                                    </li>
                                                    <li class="comment">
                                                        <article>
                                                            <div class="comment-avatar ">
                                                                <img src="assets/img/user/user-2.png" class="rounded-circle" alt="comment">
                                                            </div>
                                                            <div class="comment-content">
                                                                <div class="comment-meta">
                                                                    <div class="comment-meta-header">
                                                                        <h5 class="text-custom-red fw-600 author mb-3">Brian Wright</h5>
                                                                        <div class="post-date">
                                                                            <div class="date bg-custom-black">30Ja <span class="year bg-custom-red ">2020</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="comment-meta-reply"> <a href="#" class="comment-reply-link btn-first red-btn text-custom-black">Reply</a>
                                                                    </div>
                                                                </div>
                                                                <div class="comment">
                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                                </div>
                                                            </div>
                                                        </article>
                                                        <ul class="children">
                                                            <li class="comment">
                                                                <article>
                                                                    <div class="comment-avatar">
                                                                        <img src="assets/img/user/user-3.png" class="rounded-circle" alt="comment">
                                                                    </div>
                                                                    <div class="comment-content ">
                                                                        <div class="comment-meta">
                                                                            <div class="comment-meta-header">
                                                                                <h5 class="text-custom-red fw-600 author mb-3">Sarah Wright</h5>
                                                                                <div class="post-date">
                                                                                    <div class="date bg-custom-black ">30 Jan <span class="year bg-custom-red">2020</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="comment-meta-reply"> <a href="#" class="comment-reply-link btn-first red-btn text-custom-black">Reply</a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="comment">
                                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                                        </div>
                                                                    </div>
                                                                </article>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- comments -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Shop-Details End-->
        <!-- Shop-Details-Description -->
        <section class="section-padding shop-description">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-header-left">
                            <h3 class="text-light-black header-title title">Related Items <span class="fs-14">
                                    <a href="order-details.html">See all</a></span></h3>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                        <div class="product-box mb-md-20">
                            <div class="product-img">
                                <a href="#">
                                    <img src="assets/img/shop/product8.jpg" class="img-fluid full-width" alt="product-img">
                                </a>
                                <div class="product-badge">
                                    <div class="product-label new"> <span>Sale</span>
                                    </div>
                                    <div class="product-label discount"> <span>15%</span>
                                    </div>
                                </div>
                                <div class="button-group"> <a href="wishlist.html" data-toggle="tooltip" data-placement="left" title="" data-original-title="Add to wishlist" tabindex="-1"><i class="pe-7s-like"></i></a>
                                    <a href="compare.html" data-toggle="tooltip" data-placement="left" title="" data-original-title="Add to Compare" tabindex="-1"><i class="pe-7s-refresh-2"></i></a><a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip" data-placement="left" title="" data-original-title="Quick View"><i class="pe-7s-search"></i></span></a>
                                </div>
                                <div class="cart-hover"> <a href="#" class="btn-cart white-btn text-light-green fw-600" tabindex="-1">Add To Cart</a>
                                </div>
                            </div>
                            <div class="product-caption text-center"> <span class="product-category"><a href="#">Sliver</a></span>
                                <h6 class="product-title fw-500 mt-10"><a href="shop-details.html" class="text-light-black">Sliver Bracelets</a></h6>
                                <div class="product-money mt-10"> <span class="text-dark-red fw-500">$90.00</span>
                                    <span class="text-price">$250.00</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                        <div class="product-box mb-md-20">
                            <div class="product-img">
                                <a href="#">
                                    <img src="assets/img/shop/product9.jpg" class="img-fluid full-width" alt="product-img">
                                </a>
                                <div class="product-badge">
                                    <div class="product-label new"> <span>Sale</span>
                                    </div>
                                    <div class="product-label discount"> <span>15%</span>
                                    </div>
                                </div>
                                <div class="button-group"> <a href="wishlist.html" data-toggle="tooltip" data-placement="left" title="" data-original-title="Add to wishlist" tabindex="-1"><i class="pe-7s-like"></i></a>
                                    <a href="compare.html" data-toggle="tooltip" data-placement="left" title="" data-original-title="Add to Compare" tabindex="-1"><i class="pe-7s-refresh-2"></i></a><a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip" data-placement="left" title="" data-original-title="Quick View"><i class="pe-7s-search"></i></span></a>
                                </div>
                                <div class="cart-hover"> <a href="#" class="btn-cart white-btn text-light-green fw-600" tabindex="-1">Add To Cart</a>
                                </div>
                            </div>
                            <div class="product-caption text-center"> <span class="product-category"><a href="#">Sliver</a></span>
                                <h6 class="product-title fw-500 mt-10"><a href="shop-details.html" class="text-light-black">Sliver Pendant</a></h6>
                                <div class="product-money mt-10"> <span class="text-dark-red fw-500">$90.00</span>
                                    <span class="text-price">$250.00</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                        <div class="product-box mb-md-20">
                            <div class="product-img">
                                <a href="#">
                                    <img src="assets/img/shop/product11.jpg" class="img-fluid full-width" alt="product-img">
                                </a>
                                <div class="product-badge">
                                    <div class="product-label new"> <span>Sale</span>
                                    </div>
                                    <div class="product-label discount"> <span>15%</span>
                                    </div>
                                </div>
                                <div class="button-group"> <a href="wishlist.html" data-toggle="tooltip" data-placement="left" title="" data-original-title="Add to wishlist" tabindex="-1"><i class="pe-7s-like"></i></a>
                                    <a href="compare.html" data-toggle="tooltip" data-placement="left" title="" data-original-title="Add to Compare" tabindex="-1"><i class="pe-7s-refresh-2"></i></a><a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip" data-placement="left" title="" data-original-title="Quick View"><i class="pe-7s-search"></i></span></a>
                                </div>
                                <div class="cart-hover"> <a href="#" class="btn-cart white-btn text-light-green fw-600" tabindex="-1">Add To Cart</a>
                                </div>
                            </div>
                            <div class="product-caption text-center"> <span class="product-category"><a href="#">Sliver</a></span>
                                <h6 class="product-title fw-500 mt-10"><a href="shop-details.html" class="text-light-black">Sliver Earring</a></h6>
                                <div class="product-money mt-10"> <span class="text-dark-red fw-500">$90.00</span>
                                    <span class="text-price">$250.00</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                        <div class="product-box mb-md-20">
                            <div class="product-img">
                                <a href="#">
                                    <img src="assets/img/shop/product10.jpg" class="img-fluid full-width" alt="product-img">
                                </a>
                                <div class="product-badge">
                                    <div class="product-label new"> <span>Sale</span>
                                    </div>
                                    <div class="product-label discount"> <span>15%</span>
                                    </div>
                                </div>
                                <div class="button-group"> <a href="wishlist.html" data-toggle="tooltip" data-placement="left" title="" data-original-title="Add to wishlist" tabindex="-1"><i class="pe-7s-like"></i></a>
                                    <a href="compare.html" data-toggle="tooltip" data-placement="left" title="" data-original-title="Add to Compare" tabindex="-1"><i class="pe-7s-refresh-2"></i></a><a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip" data-placement="left" title="" data-original-title="Quick View"><i class="pe-7s-search"></i></span></a>
                                </div>
                                <div class="cart-hover"> <a href="#" class="btn-cart white-btn text-light-green fw-600" tabindex="-1">Add To Cart</a>
                                </div>
                            </div>
                            <div class="product-caption text-center"> <span class="product-category"><a href="#">Sliver</a></span>
                                <h6 class="product-title fw-500 mt-10"><a href="shop-details.html" class="text-light-black">Sliver Bracelet</a></h6>
                                <div class="product-money mt-10"> <span class="text-dark-red fw-500">$90.00</span>
                                    <span class="text-price">$250.00</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop-Details-Description END -->
        <!-- Sucscriber -->
        <section class="section-padding bg-theme-primary block_newsletter">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-header-left text-center">
                            <h3 class="text-light-black header-title">Grab Our Newsletter</h3>
                            <p>To receive latest offers and discounts from the shop. </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="subscribe-wrapper">
                            <form id="subscribe-form" method="post" action="#">
                                <div class="subscribe-content">
                                    <input type="text" name="subscribe-input" id="subscribe-input" value="" placeholder="Enter Your Email Address" class="form-control input-text required-entry validate-email">
                                    <button class="button" type="submit"><span>Subscribe</span></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END Subscriber -->
        <%@include file="public_footer.jsp" %>
        <!-- /Place all Scripts Here -->
    </body>


    <!-- Mirrored from slidesigma.com/themes/html/gemstone/shop-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Feb 2020 08:20:43 GMT -->
</html>
