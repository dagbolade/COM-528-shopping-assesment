<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.javaDemo1.demojava2.vmm.DBLoader"%>
         <%@page import="java.sql.ResultSet"%>
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


    String pid=session.getAttribute("user_email").toString();





            %>

        <script>
              function add_product_gallery()
            {
               // var phne= document.getElementById("").value;


                var ans = "";
                var formdata = new FormData();

                var controls = document.getElementById("form1").elements;
                var flag = 0;

                for (var i = 0; i < controls.length; i++)
                {
                    if (controls[i].name == "" || controls[i].name == null)
                    {
                        flag = 1;
                    }
                    if (controls[i].type == "file")
                    {
                        if (controls[i].files.length > 0)
                        {
                             ans = ans + controls[i].name + ": " + controls[i].files[0].name + "\n";
                            formdata.append(controls[i].name, controls[i].files[0]);

                        } else
                        {
                            flag = 2;
                        }
                    } else    // if not file, text control
                    {
                        formdata.append(controls[i].name, controls[i].value);
//                        alert(formdata.append(controls[i].name, controls[i].value));
                    }

                }

                if (flag == 1)
                {
                    alert("CHECK: --> Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("CHECK: --> Select Files for file controls");
                } else
                {

                    // Send AJAX Request to send FORMDATA (text + files) to Server
                    var xhr = new XMLHttpRequest;

                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var res = xhr.responseText.trim();
//alert(res);
                            if (res === "success")
                            {
                                alert("Added");
                               document.getElementById("form1").reset();
                               view();

                            } else
                            {
                                alert(res);
                            }

                        }
                    };

            xhr.open("POST", "./addupload?pid=<%=pid%>", true);

//                    alert("Sending Request to Server");


                    xhr.send(formdata);
                }
            }

             function view()
            {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "./getuploads?pid=<%=pid%>", true);
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
                    ans += "<th style=\"background: black;color: white;text-align: center;\"> GID </th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Description </th>";
                     ans += "<th style=\"background: black;color: white;text-align: center;\">Date of Deadline </th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Document</th>";
                     ans += "<th style=\"background: black;color: white;text-align: center;\">Status</th>";
                    ans += "<th style=\"background: black;color: white;text-align: center;\">Delete</th>";
                    ans += "</tr>";
                    for (var i = 0; i < ar.length; i++)
                    {
                        var obj = ar[i];
                        ans += "<tr>";
                        ans += "<td style=\"color:black;\">" + obj["gid"] + "</td>";
                        ans += "<td style=\"color:black;\">" + obj["caption"] + "</td>";
                        ans += "<td style=\"color:black;\">" + obj["date"] + "</td>";
                        ans += "<td><a href=\"" + obj["gallery_image"] + "\"  download >Download</a><br></td>";
                         ans += "<td style=\"color:black;\">" + obj["status"] + "</td>";
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
                         alert(gid+" deleted");

                         // now call go2() again to reload
                         view();
                    }
                };

                xhttp.open("GET", "./DeleteUpload?gid="+gid, true);
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


<!--        <h1 class="jumbotron" style="text-align: center">Category</h1>-->

            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-8">
                        <div class="section-2 user-page main-padding"  style="height: 80vh !important">
                            <div class="login-sec">
                                <div class="login-box">
                                    <form id="form1">
                                        <h4 class="text-light-black fw-600">Add Your Uploads</h4>
                                        <div class="row">

                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">Description</label>
                                                    <input type="text" name="caption" id="caption" class="form-control form-control-submit" placeholder="Description" required>
                                                </div>

                                               <div class="form-group">
                                                    <label class="text-light-white fs-14">Date of Deadline</label>
                                                    <input type="text" name="date" id="date" class="form-control form-control-submit" placeholder="Date of Deadline" required>
                                                </div>


                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">Upload </label>
                                                    <input type="file" id="photo" name="photo"/>
                                                </div>




                                                   </div>



                                        </div>
                                    </form>
                                     <div class="form-group">
                                         <button type="submit" class="btn-second-2 btn-submit full-width" onclick="add_product_gallery()">Submit</button>
                                                </div>


                                </div>
                            </div>
                        </div>
                    </div>


                </div>

                 <div class="row">
               <div class="col-sm-7" id="viewcontent">k
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
