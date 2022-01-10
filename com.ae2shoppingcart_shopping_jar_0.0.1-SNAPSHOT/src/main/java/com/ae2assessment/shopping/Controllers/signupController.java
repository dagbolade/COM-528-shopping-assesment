package com.ae2assessment.shopping.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class signupController
{
    @GetMapping("/admin_add_category")
    public String goa()
    {
        return "admin_add_category";
    }
    @GetMapping("/admin_add_product")
    public String goa1()
    {
        return "admin_add_product";
    }
    @GetMapping("/admin_manage_orders")
    public String goa2()
    {
        return "admin_manage_orders";
    }
    @GetMapping("/admin_manage_products")
    public String goa3()
    {
        return "admin_manage_products";
    }
    @GetMapping("/admin_view_category")
    public String goa4()
    {
        return "admin_view_category";
    }
    @GetMapping("/admin_view_product")
    public String goa5()
    {
        return "admin_view_product";
    }

    @GetMapping("/signup")
    public String go()
    {
        return "user_signup";
    }
    @GetMapping("/productdetail")
    public String gopro()
    {
        return "product_detail";
    }
    @GetMapping("/view_user_cart")
    public String go00()
    {
        return "view_user_cart";
    }
    @GetMapping("/login")
    public String go1()
    {
        return "user_login";
    }

    @GetMapping("/product_category")
    public String go0()
    {
        return "view_product_category";
    }
    @GetMapping("/")
    public String go22()
    {
        return "home";
    }
    @GetMapping("/home")
    public String go2()
    {
        return "home";
    }
    @GetMapping("/user_change_password")
    public String go3()
    {
        return "user_change_password";
    }

    @GetMapping("/freelancer_home")
    public String go4()
    {
        return "freelancer_home";
    }

    @GetMapping("/ViewUser")
    public String go6()
    {
        return "viewuser";
    }
    @GetMapping("/admin_home")
    public String go7()
    {
        return "admin_home";
    }

    @GetMapping("/admin_login")
    public String go8()
    {
        return "admin_login";
    }

    @GetMapping("/upload")
    public String go9()
    {
        return "upload";
    }

    @GetMapping("/viewAdminupload")
    public String go10()
    {
        return "viewAdminupload";
    }
    @GetMapping("/ViewUserAdmin")
    public String go11()
    {
        return "ViewUserAdmin";
    }
}
