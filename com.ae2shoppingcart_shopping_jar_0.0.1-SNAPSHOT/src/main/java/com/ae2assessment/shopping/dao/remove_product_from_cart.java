package com.ae2assessment.shopping.dao;

import com.ae2assessment.shopping.vmm.FileUploader;
import com.ae2assessment.shopping.vmm.DBLoader;
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
@RequestMapping("/remove_product_from_cart")
public class remove_product_from_cart
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.POST ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(@RequestParam int cartid) {


        System.out.println("...." + cartid);
        try {
            ResultSet rs = DBLoader.executeQuery("select * from cart_table where cartid = " + cartid);
            if (rs.next()) {
                rs.deleteRow();
                return "success";
            } else {
                return "fails";
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

return "";
    }


}

