package com.ae2assessment.ae2shopping.dao;
import com.ae2assessment.ae2shopping.vmm.FileUploader;
import com.ae2assessment.ae2shopping.vmm.DBLoader;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;

@RestController
@RequestMapping("/addusers")
public class user_signup
{
    String ans="fail";
    @RequestMapping(
            method = RequestMethod.POST ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String something(@RequestParam String first,@RequestParam String email,  @RequestParam String password, @RequestParam String mobile, @RequestParam String secques, @RequestParam String secans, @RequestParam MultipartFile photo)
    {
long random=System.currentTimeMillis();
String abspath=photo.getOriginalFilename();
        String filename1 =random+abspath;
        FileUploader.Uploads(photo,random);

        try {

            ResultSet rs = DBLoader.executeQuery("select * from users where email = \"+email+\"") ;
            if(rs.next())
            {
                ans ="Email already exists!!!!!";
            }
            else {
                rs.moveToInsertRow();
                rs.updateString("email", email);
                rs.updateString("name", first );
                rs.updateString("photo", "./upload_folder/" + filename1);
                rs.updateString("sec_ques", secques);
                rs.updateString("sec_ans", secans);
                rs.updateString("mobileno", mobile);
                rs.updateString("password", password);

                rs.insertRow();
                 ans="success";

                         }
            }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }

        return ans;
    }

}
