package com.ae2assessment.shopping.dao;

import com.ae2assessment.shopping.vmm.FileUploader;
import com.ae2assessment.shopping.vmm.DBLoader;
import com.ae2assessment.shopping.vmm.RDBMS_TO_JSON;
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
@RequestMapping("/delete_category")
public class delete_category
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.GET ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(@RequestParam String categoryname)
    {


        try{

        ResultSet rs = DBLoader.executeQuery("select * from category where category_name='"+categoryname+"'");
        if(rs.next()){
            rs.deleteRow();
            return "success";
        }
        else {
            return "fail";

        }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return "";
    }

}

