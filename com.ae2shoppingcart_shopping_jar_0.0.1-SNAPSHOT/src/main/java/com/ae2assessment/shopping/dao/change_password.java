package com.ae2assessment.shopping.dao;

import com.ae2assessment.shopping.vmm.DBLoader;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;

@RestController
@RequestMapping("/change_password")
public class change_password
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.GET ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some( @RequestParam String email, @RequestParam String oldpassword, @RequestParam String newpassword)
    {


        try{
        ResultSet rs = DBLoader.executeQuery("select * from users where email = '"+email + "' and password = '"+oldpassword+"'");
        if(rs.next()){
            rs.moveToCurrentRow();
            rs.updateString("password", newpassword);
            rs.updateRow();
           ans="success";
        }
        else {
            ans="fails";
        }


    }
          catch (Exception  e)
        {
        e.printStackTrace();
    }


        return ans;
    }

}

