

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

        <%


    String pid=session.getAttribute("admin_email").toString();





            %>

        <script>


             function view()
            {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "./getAdminUploads", true);
                xhr.onreadystatechange = function ()
                {
                    var s = xhr.responseText.trim();
                    console.log(s);

                    var mainjson = JSON.parse(s);
                    ar = mainjson["ans"];
                    console.log(ar);
                    var ans = "";
                    ans += "<h1 style=\"text-align:center;margin:20px;\">Already addes document</h1>";
                    ans += "<br>";
                    ans += "<table class=\"table table-responsive\" style=\"text-align: center;\">";
                    ans += "<tr>";
                    //ans += "<th>Product Id </th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\"> ID </th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\"> User </th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Description </th>";
                     ans += "<th style=\"background: black;color: white;text-align: center;\">Date of Deadline </th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Document</th>";
                     ans += "<th style=\"background: black;color: white;text-align: center;\">Status</th>";
                      ans += "<th style=\"background: black;color: white;text-align: center;\">Update</th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Delete</th>";
                    ans += "</tr>";
                    for (var i = 0; i < ar.length; i++)
                    {
                        var obj = ar[i];
                        ans += "<tr>";
                        ans += "<td style=\"color:black;\">" + obj["gid"] + "</td>";
                        ans += "<td style=\"color:black;\">" + obj["pid"] + "</td>";
                        ans += "<td style=\"color:black;\">" + obj["caption"] + "</td>";
                        ans += "<td><input type =\"text\" id =\"date1\" value=\"" + obj["date"] + "\" /></td>";
                        ans += "<td><a href=\"" + obj["gallery_image"] + "\"  download >Download</a><br></td>";
                         ans += "<td><input type =\"text\" id =\"status1\" value=\"" + obj["status"] + "\" /></td>";
                         ans += "<td><button type=\"button\"  onclick=\"updateUpload(" + obj["gid"] + ")\" class=\"btn btn-danger\" ><span class=\"glyphicon glyphicon-trash\"></span>Update</button></td>";

                        ans += "<td><button type=\"button\"  onclick=\"deleteUpload(" + obj["gid"] + ")\" class=\"btn btn-danger\" ><span class=\"glyphicon glyphicon-trash\"></span>Delete</button></td>";
                        ans += "</tr>";
                    }
                    ans += "</table>";
                    document.getElementById("viewcontent").innerHTML = ans;

                };
                xhr.send();
            }



            function deleteUpload(gid)
           {
               alert("pid to be deleted "+gid);

                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("d1").innerHTML = this.responseText;
                        view();
                    }
                };

                xhttp.open("GET", "./DeleteUpload?gid="+gid, true);
                xhttp.send();

           }



           function updateUpload(gid)
           {
               alert("gid to be Update "+gid);

                var status = document.getElementById("status1").value;
                var date = document.getElementById("date1").value;
                alert("Sending AJAX Request for ");

                // Send AJAX Request and get Response From Server
                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        var res = this.responseText;
                        alert(res);
                        view();
                    }
                };

                xhttp.open("GET", "./update?gid=" + gid + "&status=" + status + "&date=" + date, true);
                xhttp.send();
           }
            </script>
    </head>
    <body onload="view()">
        <!-- Navigation -->
                 <header class="header">
                     <div class="container-fluid custom-container">
                         <div class="row">
                             <div class="col-12">
                                 <div class="navigation">
                                     <div class="logo">
                                         <a href="/admin_home">
                                             <img src="/assets/img/logo1.png" class="image-fit" alt="logo">
                                         </a>
                                     </div>
                                     <div class="main-navigation">
                                         <nav>
                                             <ul class="main-menu">
                                                 <li class="menu-item"> <a href="/admin_home" class="text-light-black">Home</a>


                                                 </li>
                                                  <%
                                             if (session.getAttribute("admin_email") != null) {
                                             %>


                                                 <li class="menu-item"> <a href="/ViewUserAdmin" class="text-light-black">View User info</a>
                                                 </li>
                                                 <li class="menu-item"> <a href="/viewAdminupload" class="text-light-black">View Uploads</a>
                                                 </li>
                                            <%
                                             }

                                         %>


                                             </ul>
                                         </nav>
                                     </div>
                                     <div class="right-side-navigation">
                                         <%                                                        String user_name = "";
                                             if (session.getAttribute("admin_email") == null) {
                                         %>





                                         <ul>


                                             <li class="user-details">
                                                 <a href="/admin_login"> <i class="pe-7s-user"></i> <span>Hi, </span>
                                                 </a>
                                             </li>

                                             <%
                                             } else {
                                                 user_name = session.getAttribute("admin_email").toString();
                                             %>
                                         </ul>
                                             <ul>


                                                 <li class="user-details">
                                                     <a href="/admin_login"> <i class="pe-7s-user"></i> <span>Hi, <%=user_name%></span>
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
<!--        <h1 class="jumbotron" style="text-align: center">Category</h1>-->

            <div class="container">


                 <div class="row">
               <div class="col-sm-12" id="viewcontent">k
                    </div>
                     <div class="col-sm-7" id="d1">k
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
