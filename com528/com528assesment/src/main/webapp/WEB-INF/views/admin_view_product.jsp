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
              function getcat()
            {
                var xhr = new XMLHttpRequest();
                var ans = "";
                xhr.open("POST", "./getallcategorynames", true);
                xhr.onreadystatechange = function ()
                {
                    if (xhr.status === 200 && xhr.readyState === 4)
                    {
                        var s = xhr.responseText.trim();
                        //alert(s);
                        var mainjson = JSON.parse(s);
                        catar = mainjson["ans"];
                        console.log(catar);
                        ans = ans + "<option>-Select Category-</option>";
                        for (var i = 0; i < catar.length; i++)
                        {
                            var obj = catar[i];
                            ans = ans + "<option>" + obj.category_name + "</option>";
                        }

                    }
                    document.getElementById("categoryname").innerHTML = ans;

                };
                xhr.send();
            }
            function view()
            {
                var xhr = new XMLHttpRequest();
                var categoryname = document.getElementById("categoryname").value;
                xhr.open("POST", "./getallproducts?categoryname=" + categoryname, true);
                xhr.onreadystatechange = function ()
                {
                    var s = xhr.responseText.trim();
                    console.log(s);

                    var mainjson = JSON.parse(s);
                    ar = mainjson["ans"];
                    console.log(ar);
                    var ans = "";
                    ans += "<h1 style=\"text-align:center;margin:20px;\">Added Product</h1>";
                    ans += "<br>";
                    ans += "<table class=\"table table-responsive\" style=\"text-align: center;\">";
                    ans += "<tr>";
                    //ans += "<th>Product Id </th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\"> Name </th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Description </th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\"> Max Price </th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Offer Price</th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Image</th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Delete</th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Gallery</th>";
                    ans += "</tr>";
                    for (var i = 0; i < ar.length; i++)
                    {
                        var obj = ar[i];
                        ans += "<tr>";
                        //ans += "<td>" + obj["product_id"] + "</td>";
                        ans += "<td style=\"color:black;\">" + obj["product_name"] + "</td>";
                        ans += "<td style=\"color:black;\">" + obj["product_desc"] + "</td>";
                        ans += "<td style=\"color:black;\">" + obj["max_price"] + "</td>";
                        ans += "<td style=\"color:black;\">" + obj["offer_price"] + "</td>";
                        ans += "<td><img src=\"./" + obj["product_image"] + "\"  style=\"width:100px;height:100px;\" /></td>";
                        ans += "<td><button type=\"button\"  onclick=\"deleteproduct(" + i + ")\" class=\"btn btn-danger\" ><span class=\"glyphicon glyphicon-trash\"></span>Delete</button></td>";
                       // ans += "<td><button type=\"button\"  onclick=\"managegallery(" + i + ")\" class=\"btn btn-warning\"><span class=\"glyphicon glyphicon-picture\"></span>Manage Gallery</button> </td>";
                        ans += "</tr>";
                    }
                    ans += "</table>";
                    document.getElementById("viewcontent").innerHTML = ans;

                };
                xhr.send();
            }
            function deleteproduct(i){
               
                var obj = ar[i];
                alert(obj["pid"]);
                  var xhr = new XMLHttpRequest();
               
                xhr.open("POST", "./delete_product?pid="+obj["pid"], true);
                xhr.onreadystatechange = function ()
                {
                    if (xhr.status === 200 && xhr.readyState === 4)
                    {
                        var s = xhr.responseText.trim();
                        //alert(s);
                        if(s === "success"){
                            view();
                        }
                        else {
                            alert(s);
                        }

                    }
                   

                };
                xhr.send();
            }
            
             function managegallery(i){
               
                var obj = ar[i];
//                alert(obj["pid"]);
                  window.location.href = "/admin_manage_products?pid="+obj["pid"];
            }
            
            
            
            </script>
        
    </head>
    <body onload="getcat()">
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

        <div class="container">
        <h1 style="text-align: center">View Products</h1>
            <div class="row">
                <div class="col-sm-9" >
                    <select class="form-control" id="categoryname">
                        
                    </select>
                    
                </div>
                
                <div class="col-sm-3">
                    <input type="button" value="Submit" onclick="view()" class="btn btn-primary">
                </div>
            </div>
             <div class="row">
               
                
                 <div class="col-sm-12" id="viewcontent">
                    </div>
            </div>
        </div>
        
        
        
        <%@include file="public_footer.jsp" %>
    </body>
</html>
