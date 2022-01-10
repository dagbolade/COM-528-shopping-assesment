package com.ae2assessment.ae2shopping.dao;

import com.ae2assessment.ae2shopping.vmm.DBLoader;
import com.ae2assessment.ae2shopping.vmm.RDBMS_TO_JSON;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.ResultSet;

@RestController
@RequestMapping("/DeleteUpload")
public class deleteuploads
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.GET ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(@RequestParam String gid)
    {


        try{
            ResultSet rs = DBLoader.executeQuery("select * from product_gallery where gid="+gid);
            if(rs.next()){
                rs.deleteRow();
               ans=gid+" deleted";

            }
            else {
               ans="fail";
            }}
        catch (Exception e){
            e.printStackTrace();
        }


        return ans;
    }

}


