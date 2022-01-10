<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <title>JSP Page</title>
        <script>
            function go() {
//                alert("");
                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;

                if (email === "" || password === "") {
                    alert("All fields are required.");
                } else {
                    var xhttp = new XMLHttpRequest();

                    // Step 4
                    // Callback method
                    // This method is called when server gives answer
                    xhttp.onreadystatechange = function()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var ans = xhttp.responseText.trim();
                            if (ans === "success")
                             {
                                alert(ans);

                                alert("user");
                                    window.location.href = "/home";

                              }
                            else {
                                alert("Invalid Credentials.")
                                  }
                        }
                    };

                    // Step 2
                    xhttp.open("GET", "./user_login?email=" + email + "&password=" + password, true);    // true --> async request

                    // Step 3
                    xhttp.send();
                }

            }
        </script>
    </head>

    <body>
        <div class="container">
            <form id="form1" class="form-horizontal" >
                <h4 >Sign in</h4>
                <div class="form-group text-center">
                                                    <p class="text-light-black mb-0">Create new Acount <a href="/signup">Sign up</a>
                                                    </p>
                                                </div>

</div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Email</label>
                    <div class="col-sm-10">
                        <input type="email" id="email"  placeholder="Email I'd" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="password" >Password</label>
                    <div class="col-sm-10">
                        <input type="password" id="password" name="#"  placeholder="Password" required></br>

                    </div>
                </div>



            </form>


            <button type="submit" class="btn btn-success" onclick="go()" >Sign in</button>
        </div>
    </body>
</html>
