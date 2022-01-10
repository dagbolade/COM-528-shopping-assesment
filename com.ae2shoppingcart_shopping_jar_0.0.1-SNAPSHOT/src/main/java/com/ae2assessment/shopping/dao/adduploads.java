package com.ae2assessment.shopping.dao;

import com.ae2assessment.shopping.vmm.DBLoader;
import com.ae2assessment.shopping.vmm.FileUploader;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.sql.ResultSet;

@RestController
@RequestMapping("/addupload")
public class adduploads
{
    String ans="fail";
    @RequestMapping(
            method = RequestMethod.POST ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String something( @RequestParam String pid, @RequestParam String date, @RequestParam String caption, @RequestParam MultipartFile photo)
    {
        long random=System.currentTimeMillis();
        String abspath=photo.getOriginalFilename();
        String filename1 =abspath+random;
        FileUploader.Uploads(photo,random);
        String status = "pending";
        try {
            ResultSet rs = DBLoader.executeQuery("select * from product_gallery");

            rs.moveToInsertRow();
            rs.updateString("caption",caption );
            rs.updateString("pid",pid );
            rs.updateString("status",status );
            rs.updateString("date",date );
            rs.updateString("gallery_image","./upload_folder/"+filename1 );

            rs.insertRow();

            ans="success";

        }
        catch (Exception e){
            e.printStackTrace();
        }


        return ans;
    }

}

