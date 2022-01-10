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
@RequestMapping("/addproduct")
public class addproduct
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.POST ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(@RequestParam String categoryname,@RequestParam String productname,@RequestParam int maxprice,@RequestParam int offerprice,@RequestParam String description, @RequestParam MultipartFile photo)
    {
        long random=System.currentTimeMillis();
        String abspath=photo.getOriginalFilename();
        String filename1 =random+abspath;
        FileUploader.Uploads(photo,random);

        try {
            ResultSet rs = DBLoader.executeQuery("select * from products where product_name = '"+productname+"' and category_name ='"+categoryname+"'");
            if(rs.next()){
                return "product  already exists in this category";
            }
            else {
                rs.moveToInsertRow();
                rs.updateString("product_name",productname );
                rs.updateString("product_desc",description );
                rs.updateInt("max_price", maxprice);
                rs.updateInt("offer_price",offerprice);

                rs.updateString("category_name",categoryname );
                rs.updateString("product_image","./product/"+filename1 );

                rs.insertRow();

                return "success";
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return "ans";
    }

}

