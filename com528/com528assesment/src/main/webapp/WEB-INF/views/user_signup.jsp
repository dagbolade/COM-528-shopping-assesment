<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!-- Mirrored from slidesigma.com/themes/html/gemstone/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Feb 2020 08:21:07 GMT -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="keywords" content="#">
        <meta name="description" content="#">
        <title>Gemstone | Register</title>
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="#">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="#">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="#">
        <link rel="apple-touch-icon-precomposed" href="#">
        <link rel="shortcut icon" href="#">
        <!-- Bootstrap -->
        <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- Fontawesome -->
        <link href="/assets/css/font-awesome.css" rel="stylesheet">
        <!-- Flaticons -->
        <link href="/assets/css/font/flaticon.css" rel="stylesheet">
        <!-- Swiper Slider -->
        <link href="/assets/css/swiper.min.css" rel="stylesheet">
        <!-- Pe-icons -->
        <link href="/assets/css/pe-icon-7-stroke.css" rel="stylesheet">
        <!-- Range Slider -->
        <link href="/assets/css/ion.rangeSlider.min.css" rel="stylesheet">
        <!-- magnific popup -->
        <link href="/assets/css/magnific-popup.css" rel="stylesheet">
        <!-- Nice Select -->
        <link href="/assets/css/nice-select.css" rel="stylesheet">
        <!-- Custom Stylesheet -->
        <link href="/assets/css/style.css" rel="stylesheet">
        <!-- Custom Responsive -->
        <link href="/assets/css/responsive.css" rel="stylesheet">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,500,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Libre+Franklin:400,500,600,700&amp;display=swap" rel="stylesheet">
         <script>
           function add_users()
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
                             if (res === "success")
                            {
                                alert("Signup Successfully !!!!");
                               window.location.href = "/login";

                            } else
                            {
                                alert(res);
                            }

                        }
                    };

                    xhr.open("POST", "./addusers", true);

//                    alert("Sending Request to Server");


                    xhr.send(formdata);
                }
            }
    </script>
    </head>


    <body>
        <div class="inner-wrapper">
            <div class="container-fluid no-padding">
                <div class="row no-gutters overflow-auto">
                    <div class="col-md-6">
                        <div class="main-banner">
                            <img src="assets/img/slider.jpg" class="img-fluid full-width main-img" alt="banner">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="section-2 user-page main-padding"  style="height: 182vh !important">
                            <div class="login-sec">
                                <div class="login-box">

                                    <form id="form1">
                                        <div class="form-group text-center">
                                                    <p class="text-light-black mb-0">Have an account? <a href="user_login.jsp">Sign in</a>
                                                    </p>
                                                </div>
                                        <h4 class="text-light-black fw-600">Create your account</h4>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-6">
                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">First name</label>
                                                    <input type="text" name="first" id="first" class="form-control form-control-submit" placeholder="First Name" required>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">Email</label>
                                                    <input type="email" name="email" id="email" class="form-control form-control-submit" placeholder="Email I'd" required>
                                                </div>



                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">Password (8 character minimum)</label>
                                                    <input type="password" id="password"  name="password" class="form-control form-control-submit"  placeholder="Password" required>
                                                     </div>
                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">Confirm Password (8 character minimum)</label>
                                                    <input type="password" id="confirmpassword" name="confirmpassword" class="form-control form-control-submit"  placeholder="Confirm Password" required>
                                                 </div>
                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">Mobile no </label>
                                                    <input type="number" id="mobile" name="mobile" class="form-control form-control-submit"  placeholder="Mobile no" required>
                                                </div>
                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">Security Question (8 character minimum)</label>
                                                    <!--<input type="text" id="password-field" name="#" class="form-control form-control-submit"   required>-->
                                                 <select class="form-control"id="secques"name="secques">
                            <option value="-1"> select starting hrs.</option>
                            <option value="Whats ur pet name"> Whats ur pet name</option>
                            <option value="fav place"> fav place</option>
                            <option value="fav food"> fav food</option>
                                                 </select>
                                                </div>
                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">Security Ans </label>
                                                    <input type="text" id="secans" name="secans" class="form-control form-control-submit"  placeholder="Security Ans" required>
                                                </div>
                                                <div class="form-group">
                                                    <label class="text-light-white fs-14">Photo </label>
                                                    <input type="file" id="photo" name="photo"/>
                                                </div>



                                                <div class="form-group checkbox-reset">
                                                    <label class="custom-checkbox mb-0">
                                                        <input type="checkbox" name="#"> <span class="checkmark"></span> Keep me signed in</label>
                                                </div>
                                                   </div>
                                        </div>
                                    </form>
                                     <div class="form-group">
                                         <button type="submit" class="btn-second-2 btn-submit full-width" onclick="add_users()">Create your account</button>
                                                </div>
                                                <div class="form-group text-center"> <span>or</span>
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" class="btn-second-2 btn-facebook full-width">
                                                        <img src="/assets/img/facebook-logo.svg" alt="btn logo">Continue with Facebook</button>
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" class="btn-second-2 btn-google full-width">
                                                        <img src="/assets/img/google-logo.png" alt="btn logo">Continue with Google</button>
                                                </div>

      <span class="text-light-black fs-12 terms">By creating your Ecom account, you agree to the <a href="#"> Terms of Use </a> and <a href="#"> Privacy Policy.</a></span>

                                </div>
                            </div>
                        </div>
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


    <!-- Mirrored from slidesigma.com/themes/html/gemstone/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Feb 2020 08:21:07 GMT -->
</html>
