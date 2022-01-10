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

          <script>
                      function fetch_orders()
                     {
                         var xmlhttp = new XMLHttpRequest();
                         xmlhttp.onreadystatechange = function ()
                         {
                             var res = xmlhttp.responseText.trim();
                             var mainjson = JSON.parse(res);
                             var jsonar = mainjson["ans"];
                             console.log(jsonar);
                             if (jsonar.length == 0)
                             {
                                 alert("No record found");
                             } else
                             {
                                 var tab = "<table border=1 class='table table-bordered'>";
                                 tab += "<thead><tr><td>Bill id</td><td>Actual amount</td><td>Paid amount</td><td>Date time</td><td>Address</td><td>Email</td><td>Payment Mode</td><td>Phone no</td><td>Status</td></tr></thead>";
                                 tab += "<tbody>";
                                 for (var i = 0; i < jsonar.length; i++)
                                 {
                                     var obj = jsonar[i];
                                     tab += "<tr><td>" + obj.billid + "</td>";
                                     tab += "<td>" + obj.actual_amount + "</td>";
                                     tab += "<td>" + obj.paidamount + "</td>";
                                     tab += "<td>" + obj.datetime + "</td>";
                                     tab += "<td>" + obj.address + "</td>";
                                     tab += "<td>" + obj.username + "</td>";
                                     tab += "<td>" + obj.payment_mode + "</td>";
                                     tab += "<td>" + obj.phoneno + "</td>";
                                     tab += "<td>" + obj.status + "</td>";

         //                            tab+="<td><img src='" +obj.category_photo+ "'  style='width: 150px; height: 150px '/></td>";
                              //  tab +="<td><input type='button' id='confirm' value='View Details' class='btn btn-success' onclick='vieworders("+obj.billid+")'/></td>";

                                 }
                                 tab += "</tbody>";
                                 tab += "</table>";
                                 document.getElementById("div1").innerHTML = tab;
                             }
                         };
                         xmlhttp.open("GET", "./fetch_delivered_orders", true);
                         xmlhttp.send();
                     }

                     function vieworders(billid){
         //                alert(billid);
                         $('#test').modal("show");
                         var xmlhttp = new XMLHttpRequest();
                         xmlhttp.onreadystatechange = function ()
                         {
                             var res = xmlhttp.responseText.trim();
                             var mainjson = JSON.parse(res);
                             var jsonar = mainjson["ans"];
                             console.log(jsonar);
                             if (jsonar.length == 0)
                             {
                                 alert("No record found");
                             } else
                             {
                                 var tab = "<table border=1 class='table table-bordered'>";
                                 tab += "<thead><tr><td>Bill id</td><td>Product Name</td><td>Actual amount</td><td>Paid amount</td><td>QTY</td></tr></thead>";
                                 tab += "<tbody>";
                                 for (var i = 0; i < jsonar.length; i++)
                                 {
                                     var obj = jsonar[i];
                                     tab += "<tr><td>" + obj.bill_id + "</td>";
                                     tab += "<td>" + obj.product_name + "</td>";
                                     tab += "<td>" + obj.price + "</td>";
                                     tab += "<td>" + obj.offerprice + "</td>";
                                     tab += "<td>" + obj.qty + "</td>";

         //                            tab+="<td><img src='" +obj.category_photo+ "'  style='width: 150px; height: 150px '/></td>";
         //                       tab +="<td><input type='button' id='confirm' value='View Details' class='btn-success' onclick='vieworders("+obj.bill_id+")'/></td>";

                                 }
                                 tab += "</tbody>";
                                 tab += "</table>";
                                 document.getElementById("div2").innerHTML = tab;
                             }
                         };
                         xmlhttp.open("GET", "./fetch_user_orders_details?bill_id="+billid, true);
                         xmlhttp.send();
                     }

                     </script>
        
    </head>
    <body onload="fetch_orders()">
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
                                                <a href="/admin_login"> <i class="pe-7s-user"></i> <span>Hi, </span>
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
        <h1 style="text-align: center">View Delivered  Orders</h1>
        <div class="container">
            <div class="row">
                <div class="col-sm-12" id="div1">
                    
                </div>
            </div>
        </div>
        
         <div class="modal fade" id="test">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
					<h4 class="modal-title fw-700"></h4>
				</div>
				<div class="modal-body">
					  <div class="container">
            <div class="row">
                <div class="col-sm-12" id="div2">
                    
                </div>
            </div>
        </div>
				</div>
			</div>
		</div>
	</div>
        
        
        
        <%@include file="public_footer.jsp" %>
    </body>
</html>
