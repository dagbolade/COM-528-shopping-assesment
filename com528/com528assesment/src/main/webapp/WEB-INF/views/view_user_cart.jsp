<%@page import="com.javaDemo1.demojava2.vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from slidesigma.com/themes/html/gemstone/wishlist.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Feb 2020 08:20:52 GMT -->
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

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <%
        int totalprice = 0;
        int actualamount = 0;
        %>


</head>

<body>
  <!-- Navigation -->
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
        <h2 class="text-white">Wishlist</h2>
        <ul>
          <li><a href="index.html">Home</a>
          </li>
          <li><a href="shop-left.html">Shop</a>
          </li>
          <li class="active">Wishlist</li>
        </ul>
      </div>
    </div>
  </div>
  <!-- breadcrumb -->
  <section class="compare-page-wrapper section-padding">
    <!-- compare main wrapper start -->
    <div class="container">
      <div class="section-bg-color">
        <div class="row">
          <div class="col-lg-12">
            <!-- Wishlist Table Area -->
            <div class="cart-table table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="pro-remove">Remove</th>
                    <th class="pro-thumbnail">PIC</th>
                    <th class="pro-title">Product</th>
                    <th class="pro-price">Price</th>
                    <th class="pro-quantity">QTY</th>
                    <th class="pro-subtotal">Total</th>

                  </tr>
                </thead>
                <tbody>

                    <%


                        if(session.getAttribute("user_email")==null){
                        response.sendRedirect("index.jsp");
                    }
                    else  {
                        String useremail  = session.getAttribute("user_email").toString();
                        ResultSet rs_cart = DBLoader.executeQuery("select * from cart_table where useremail='"+useremail+"'");
                        while(rs_cart.next()){
                            int cart_pid = rs_cart.getInt("pid");
                           ResultSet rs_products = DBLoader.executeQuery("select * from products where pid="+cart_pid);
                           if(rs_products.next()){

                          %>

                          <tr>
                              <td class="pro-remove"><a href="#" onclick="delete_from_cart(<%=rs_cart.getInt("cartid")%>)"><i class="pe-7s-trash"></i></a></td>
                    <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="<%=rs_products.getString("product_image")%>" alt="Product" /></a></td>
                    <td class="pro-title"><a href="#"><%=rs_products.getString("product_name")%></a></td>
                    <td class="pro-price"><span>$ <%=rs_cart.getInt("cart_offer_price")%>  <del>$ <%=rs_cart.getInt("cart_max_price")%></del></span></td>
                    <td class="pro-quantity"><span class="text-success"><%=rs_cart.getInt("qty")%></span></td>
                    <td class="pro-subtotal">
                        <span class="text-success"><%=rs_cart.getInt("cart_offer_price") * rs_cart.getInt("qty") %></span>
                    </td>

                  </tr>


                          <%
                              totalprice += rs_cart.getInt("cart_offer_price") * rs_cart.getInt("qty");
                              actualamount += rs_cart.getInt("cart_max_price") * rs_cart.getInt("qty");

                              }
                        }


                    }

                        %>






                </tbody>
              </table>


            </div>
          </div>
        </div>
                        <br>
                        <br>
            <div class="row">
							<div class="col-lg-7">
                                                            <div class="section-header-left">
										<h3 class="text-light-black header-title">Delivery Instructions</h3>
									</div>
									<div class="form-group">
                                                                            <textarea class="form-control form-control-submit" id="address" name="address" rows="4" placeholder="Delivery Details"></textarea>
									</div>
                                                             <div class="form-group">
                                                                 <h5 class="text-light-black fw-600">Contact Number</h5>
                                                                 <input type="number" id="phoneno" name="phoneno" class="form-control " placeholder="Enter Mobile number"/>
										<!--<textarea class="form-control form-control-submit" rows="4" placeholder="Delivery Details"></textarea>-->
									</div>

								<div class="payment-method mb-md-40">
									<h5 class="text-light-black fw-600">Payment Method</h5>
									<div class="method-type"> <i class="far fa-credit-card text-dark-white"></i>
										<span class="text-light-white">All Cards Accepted</span>
									</div>
								</div>

                                                            <br>
                                                            <br>

							</div>
							<div class="col-lg-5">
								<div class="price-table u-line">
									<div class="item"> <span class="text-light-white">Item subtotal:</span>
										<span class="text-light-white"><%=totalprice%></span>
									</div>
									<div class="item"> <span class="text-light-white">Delivery fee:</span>
										<span class="text-light-white">0</span>
									</div>
									<div class="item"> <span class="text-light-white">Tax and fees:</span>
										<span class="text-light-white">0</span>
									</div>
<!--									<div class="item"> <span class="text-light-white">Driver tip:</span>
										<span class="text-light-white">$30.5</span>
									</div>-->
								</div>
								<div class="total-price padding-tb-10">
									<h5 class="title text-light-black fw-700">Total: <span><%=totalprice%></span></h5>
								</div>

							</div>

							<div class="col-12 d-flex">
                                                            <a href="#" id="cashbtn" onclick="go()" style="width: 180px;  margin-left: 15px" class="btn-first white-btn fw-600 help-btn">Pay Online </a>
                                                            <a href="#" onclick="pay_cod()" style="width: 180px;  margin-left: 15px" class="btn-first white-btn fw-600 help-btn">Cash On delivery</a>
							</div>


						</div>
      </div>
    </div>
    <!-- compare main wrapper end -->
  </section>
  <!-- Sucscriber -->
  <section class="section-padding block_newsletter bg-theme-primary">
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

   <script>
        var paymentmode = "COD";
        var online_txn_id = "COD";
        function delete_from_cart(cartid){
            alert(cartid);
             var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        var ans = xhttp.responseText.trim();

                        alert(ans);
                        if (ans === "success") {
                            window.location.reload();
                        }
                    }
                };

                // Step 2
                xhttp.open("POST", "./remove_product_from_cart?cartid="+cartid, true);

                // Step 3
                xhttp.send();

        }
         function go(){
             var total = <%=totalprice%>;
//             alert(total);
              var options = {
//                  rzp_live_6R4RfSxoYaN6a7
//rzp_test_96HeaVmgRvbrfT

                "key": "///---enter key", // Enter the Key ID generated from the Dashboard
                "amount":total *100, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise or INR 500.
                "currency": "INR",
                "name": "Fast Food Ordering",
                "description": "Fast Food Order",
                "image": "https://example.com/your_logo",
                "handler": function (response) {
                    paymentmode = "ONLINE";
                    online_txn_id = response.razorpay_payment_id;
                    pay_cod();
//                paynow();

                 },
                "prefill": {
                    "name": "abc", "email": "abc@gmail.com",
                    "contact": ""
                },
                "notes": {
                    "address": ""
                },
                "theme": {
                    "color": "#F37254"
                }
            };
            var rzp1 = new Razorpay(options);
            document.getElementById('cashbtn').onclick = function (e) {
                rzp1.open();
                e.preventDefault();
            }
        }

        function  pay_cod(){
            var address = document.getElementById("address").value;
            var phoneno = document.getElementById("phoneno").value;

            if(address == "" || phoneno == ""){
                alert("All fields are required.");

            }
            else {
                 var xhttp = new XMLHttpRequest();

                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var ans = xhttp.responseText.trim();
                            alert(ans);
                            if (ans === "success") {

 window.location.reload();
 window.location.href = "/home";
                            } else {
                                alert("Invalid Credentials.")
                            }
                        }
                    };


            xhttp.open("GET", "./placing_order?actualamount=<%=actualamount%>&paidamount=<%=totalprice%>&address=" +address  + "&paymentmode=" + paymentmode+"&phoneno="+phoneno+"&online_txn_id="+online_txn_id, true);    // true --> async request

                    xhttp.send();
            }
        }



    </script>
</body>


<!-- Mirrored from slidesigma.com/themes/html/gemstone/wishlist.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Feb 2020 08:20:52 GMT -->
</html>

