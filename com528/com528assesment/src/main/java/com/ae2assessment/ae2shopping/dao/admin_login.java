package com.ae2assessment.ae2shopping.dao;

import com.ae2assessment.ae2shopping.vmm.DBLoader;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;

@RestController
@RequestMapping("/adminlogin")
public class admin_login
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.GET ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(HttpServletRequest request, @RequestParam String email, @RequestParam String password)
    {


        try{
            ResultSet rs = DBLoader.executeQuery("select * from admin where email = '"+email + "' and password = '"+password+"'");
            if(rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("admin_email", email);
                ans="success";
            }
            else {
                ans="fails";
            }


        }
        catch (Exception  e){
            e.printStackTrace();
        }

        return ans;
    }

}


