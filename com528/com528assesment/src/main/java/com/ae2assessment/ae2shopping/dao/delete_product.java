package com.ae2assessment.ae2shopping.dao;

import com.ae2assessment.ae2shopping.vmm.FileUploader;
import com.ae2assessment.ae2shopping.vmm.DBLoader;
import com.ae2assessment.ae2shopping.vmm.RDBMS_TO_JSON;
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
@RequestMapping("/delete_product")
public class delete_product
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.GET ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(@RequestParam int pid)
    {


        try{

            ResultSet rs = DBLoader.executeQuery("select * from products where pid="+pid);
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

