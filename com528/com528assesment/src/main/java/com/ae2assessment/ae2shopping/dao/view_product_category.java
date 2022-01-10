package com.ae2assessment.ae2shopping.dao;

import com.ae2assessment.ae2shopping.vmm.FileUploader;
import com.ae2assessment.ae2shopping.vmm.DBLoader;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;

@RestController
@RequestMapping("/view_product_category")
public class view_product_category
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.GET ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(HttpServletRequest request,@RequestParam String email, @RequestParam String password)
    {


        try{
            ResultSet rs = DBLoader.executeQuery("select * from users where email = '"+email + "' and password = '"+password+"'");
            if(rs.next())
            {
                String name=rs.getString("name");


                HttpSession session = request.getSession();
                session.setAttribute("user_email",email);
                session.setAttribute("user_name",name);

                ans="success";


            }
            else
            {
                ans="fails";
            }


        }
        catch (Exception  e){
            e.printStackTrace();
        }


        return ans;
    }

}

