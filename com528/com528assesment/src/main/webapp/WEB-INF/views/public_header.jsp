
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