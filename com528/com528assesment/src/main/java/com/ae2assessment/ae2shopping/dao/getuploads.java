package com.ae2assessment.ae2shopping.dao;

import com.ae2assessment.ae2shopping.vmm.DBLoader;
import com.ae2assessment.ae2shopping.vmm.RDBMS_TO_JSON;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;

@RestController
@RequestMapping("/getuploads")
public class getuploads
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.POST ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(@RequestParam String pid)
    {


        try
        {


            String ans = new RDBMS_TO_JSON().generateJSON("select * from product_gallery where pid='"+pid+"'");

        }
        catch (Exception  e){
            e.printStackTrace();
        }


        return ans;
    }

}

