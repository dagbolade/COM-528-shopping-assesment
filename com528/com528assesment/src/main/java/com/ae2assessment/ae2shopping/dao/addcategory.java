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
@RequestMapping("/addcategory")
public class addcategory
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.POST ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(@RequestParam String categoryname,@RequestParam String description, @RequestParam MultipartFile photo)
    {


        long random=System.currentTimeMillis();
        String abspath=photo.getOriginalFilename();
        String filename1 =random+abspath;
        FileUploader.Uploads(photo,random);

        try {
            ResultSet rs = DBLoader.executeQuery("select * from category where category_name = '"+categoryname+"'");
            if(rs.next()){
                return "category  already exists";
            }
            else {
                rs.moveToInsertRow();
                rs.updateString("category_name",categoryname );
                rs.updateString("category_desc",description );
                rs.updateString("category_photo","./upload_folder/"+filename1 );

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

