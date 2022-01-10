package com.ae2assessment.ae2shopping.dao;

import com.ae2assessment.ae2shopping.vmm.RDBMS_TO_JSON;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/getAdminUploads")
public class viewAdminUpload
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
     String ans = new RDBMS_TO_JSON().generateJSON("select * from product_gallery  ORDER BY pid");
        }
        catch (Exception  e){
            e.printStackTrace();
        }


        return ans;
    }

}


