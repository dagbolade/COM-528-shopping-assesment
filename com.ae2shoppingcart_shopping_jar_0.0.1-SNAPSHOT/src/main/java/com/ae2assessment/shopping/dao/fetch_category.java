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
@RequestMapping("/fetch_category")
public class fetch_category
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.GET ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some()
    {
        String ans = new RDBMS_TO_JSON().generateJSON("select * from category");

        return ans;
    }

}

