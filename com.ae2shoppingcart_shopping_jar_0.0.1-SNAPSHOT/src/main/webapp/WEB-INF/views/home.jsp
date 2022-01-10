

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
                <li class="cart"> <a  style="color: black" href="/view_user_cart" class="nav-link"><i class="pe-7s-cart"></i><%=count%></a>



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
      <div class="main-sec">
  <!-- slider -->
        <!-- Browse by category -->
        <section class="browse-cat bg-theme-primary section-padding">
            <div class="container-fluid custom-container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-header-left">
                            <h3 class="text-light-black header-title title">Browse by Category <span class="fs-14 align-self-center">
                                    <!--<a href="viewall_category.jsp">See All Category</a></span></h3>-->
                                    </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="category-slider swiper-container">
                                            <div class="swiper-wrapper">
                                                <%
                                                ResultSet rs = DBLoader.executeQuery("select * from category");
                                                    while (rs.next()) {
                                                %>
                                                <div class="swiper-slide">
                                                    <a href="/product_category?categoryname=<%=rs.getString("category_name")%>" class="categories">
                                                        <div class="icon text-custom-white bg-light-green ">
                                                            <img src=<%=rs.getString("category_photo")%> class="rounded-circle" alt="categories">
                                                        </div> <span class="text-light-black cat-name"><%=rs.getString("category_name")%></span>
                                                    </a>
                                                </div>
                                                <%
                                                    }

                                                %>




                                            </div>

                                            <!-- Add Arrows -->
                                            <div class="swiper-button-next"></div>
                                            <div class="swiper-button-prev"></div>
                                        </div>
                                    </div>
                                    </div>
                                    </div>
                                    </section>
                                    <!-- Browse by category -->
                                    <!-- sell section -->

                                    <!-- sell section end -->
                                    <!--shopping section end-->
                                    <!-- advertisement banner-->

                                    <!-- advertisement banner-->
                                    <!-- Hot Deals -->

                                    <!--Hot deals End-->
                                    <!--shopping section-->
                                    <section class="section-padding our-product">
                                        <div class="container-fluid custom-container">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="section-header-left">
                                                        <h3 class="text-light-black header-title title">Our Latest Products</h3>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="large-product-box  p-relative">
                                                        <img src="/assets/img/promo/p-1.jpg" class="img-fluid full-width" alt="image">
                                                    </div>
                                                </div>
                                                <div class="col-lg-9 col-md-8">
                                                    <div class="row" id="fetch_data">


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <!--shopping section end-->

                                    <!--shopping section-->
                                    <section class="section-padding our-product">
                                        <div class="container-fluid custom-container">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="section-header-left">
                                                        <h3 class="text-light-black header-title title"> Our Featured Products</h3>
                                                    </div>
                                                </div>
                                                <div class="col-lg-9 col-md-8">
                                                    <div class="row">
                                                        <%                                                            ResultSet rs_products_random = DBLoader.executeQuery("select * from products limit 10");
                                                            while (rs_products_random.next()) {
                                                        %>
                                                        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                                                            <div class="product-box mb-md-20">
                                                                <div class="product-img">
                                                                    <a href="#">
                                                                        <img src="<%=rs_products_random.getString("product_image")%>" alt="product-img">
                                                                    </a>
                                                                    <div class="product-badge">

                                                                    </div>

                                                                    <div class="cart-hover"> <a href="/productdetail?pid=<%=rs_products_random.getString("pid")%>" class="btn-cart  fw-600" tabindex="-1">Add To Cart</a>
                                                                    </div>
                                                                </div>
                                                                <div class="product-caption text-center"> <span class="product-category"><a href="#"><%=rs_products_random.getString("category_name")%></a></span>
                                                                    <h6 class="product-title fw-500 mt-10"><a href="product_detail.jsp?pid=<%=rs_products_random.getString("pid")%>" class="text-light-black"><%=rs_products_random.getString("product_name")%></a></h6>
                                                                    <div class="product-money mt-10"> <span class="text-dark-red fw-500">$<%=rs_products_random.getString("offer_price")%></span>
                                                                        <span class="text-price">$ <%=rs_products_random.getString("max_price")%> </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>



                                                        <%
                                                            }
                                                        %>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="large-product-box  p-relative">
                                                        <img src="/assets/img/promo/p-2.jpg" class="img-fluid full-width" alt="image">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <!--shopping end section-->
                                    <!--Special offer-->
                                    <!-- advertisement banner-->
                                    <section class="section-padding advertisement-banner">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="advertisement-text">
                                                    <h3 class="fs-60 text-white">SALE <span class="text-dark-red">More than 40%</span>OFF</h3>
                                                    <p class="fs-18">Applying For All Products & Shoes and Upto 40% Off Special Promo Stay Cosy With Extra 10% to 20% Off On Mens Wears.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <!-- advertisement banner-->
                                    <!-- Hot Deals -->
                                    <section class="ex-collection section-padding bg-theme-primary">
                                        <div class="container-fluid custom-container">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="section-header-left">
                                                        <h3 class="text-light-black header-title title"> Our Hot Deals</h3>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="large-product-box  p-relative">
                                                        <img src="/assets/img/promo/p-3.jpg" class="img-fluid full-width" alt="image">
                                                    </div>
                                                </div>
                                                <%
                                                    ResultSet rs_products_random11 = DBLoader.executeQuery("select * from products where discount > 40 limit 10 ");
                                                    while (rs_products_random11.next()) {
                                                %>
                                                <div class="col-xl-4 col-lg-6 col-md-6 col-12">
                                                    <figure class="banner-statistics">
                                                        <a href="#" class="promo-lines">
                                                            <img src="<%=rs_products_random11.getString("product_image")%>" alt="product banner"
                                                        </a>
                                                        <div class="banner-content text-left">
                                                            <h6 class="banner-text1"><%=rs_products_random11.getString("category_name")%></h6>
                                                            <h4 class="banner-text2"><%=rs_products_random11.getString("product_name")%><span>$<%=rs_products_random11.getString("offer_price")%></span>
                                                            </h4><span STYLE="text-decoration:line-through">
                                                                $ <%=rs_products_random11.getString("max_price")%>
                                                            </span>
                                                            <h6><%=rs_products_random11.getString("discount")%> % Discount</h6>
                                                            <a href="product_detail.jsp?pid=<%=rs_products_random11.getString("pid")%>" class="btn btn-text">Shop Now</a>
                                                            <div class="cart-hover"> <a href="product_detail.jsp?pid=<%=rs_products_random11.getString("pid")%>" class="btn-cart white-btn text-light-green fw-600" tabindex="-1">Add To Cart</a>
                                                            </div>
                                                        </div>

                                                    </figure>
                                                </div>


                                                <%
                                                    }
                                                %>

                                            </div>

                                        </div>

                                    </section>
                                    <!--Hot deals End-->
                                    <!--shopping section-->
                                    <!--Testimonail-->

                                    <!--Testimonail End-->
                                    <!-- Sucscriber -->

                                    <!-- END Subscriber -->


      </div>






      	<!-- footer -->
             	<div class="modal" id="quick_view">
             		<div class="modal-dialog modal-lg modal-dialog-centered">
             			<div class="modal-content">
             				<div class="modal-body">
             					<button type="button" class="close" data-dismiss="modal">×</button>
             					<!-- product details inner end -->
             					<div class="product-details-inner">
             						<div class="row">
             							<div class="col-lg-5 align-self-center">
             								<div class="shop-detail-image">
             									<div class="detail-slider">
             										<div class="swiper-container">
             											<div class="swiper-wrapper">
             												<div class="swiper-slide">
             													<a href="#" class="popup">
             														<img src="/assets/img/shop/maindetail.jpg" class="img-fluid full-width" alt="slider">
             													</a>
             												</div>
             											</div>
             										</div>

             									</div>
             								</div>
             							</div>
             							<div class="col-lg-7">
             								<div class="shop-detail-contents mb-md-40 mt-md-40">
             									<div class="shop-detail-content-wrapper">
             										<h3 class="text-custom-black">Handmade Golden Necklace Full Family Package</h3>
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
             										<h4 class="text-custom-red price-tag">$45 <span class="text-light-white fw-400 fs-14">$50</span></h4>
             									</div>
             									<div class="product-full-des mb-20">
             										<p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip</p>
             									</div>
             									<div class="availibity mt-20">
             										<h6 class="text-custom-black fw-600">Avability: <span class="text-success ml-2">In Stock</span></h6>
             									</div>
             									<div class="quantity mb-xl-20">
             										<h6 class="text-custom-black mb-0 mr-2 fw-600">Qty:</h6>
             										<div class="product-qty-input">
             											<button class="minus-btn" type="button" name="button"> <i class="fas fa-minus"></i>
             											</button>
             											<input type="text" class="form-control form-control-qty text-center" name="name" value="1">
             											<button class="plus-btn" type="button" name="button"> <i class="fas fa-plus"></i>
             											</button>
             										</div>
             									</div>
             									<div class="shop-bottom">
             										<div class="shop-meta mt-20">
             											<h6 class="text-custom-black mb-0 fw-600">Categories:</h6>
             											<ul class="list-inline ml-2">
             												<li class="list-inline-item"><a href="#">Necklace</a>
             												</li>
             												<li class="list-inline-item"><a href="#">Diamond</a>
             												</li>
             												<li class="list-inline-item"><a href="#">Sale</a>
             												</li>
             											</ul>
             										</div>
             										<div class="shop-meta mt-20">
             											<h6 class="text-custom-black mb-0 fw-600">Tags:</h6>
             											<ul class="list-inline ml-2">
             												<li class="list-inline-item"><a href="#">Luxary</a>
             												</li>
             												<li class="list-inline-item"><a href="#">Diamond</a>
             												</li>
             												<li class="list-inline-item"><a href="#">New Arrivel</a>
             												</li>
             											</ul>
             										</div>
             										<div class="product-btn mt-20"> <a href="#" class="btn-solid with-line ml-2">Add to Cart <i class="pe-7s-cart"></i></a>
             										</div>
             									</div>
             								</div>
             							</div>
             						</div>
             					</div> <!-- product details inner end -->
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
</html>
