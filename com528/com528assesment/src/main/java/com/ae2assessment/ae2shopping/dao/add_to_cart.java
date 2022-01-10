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
@RequestMapping("/add_to_cart")
public class add_to_cart
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.POST ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(HttpServletRequest request,@RequestParam int pid,@RequestParam int offer_price, @RequestParam int max_price,@RequestParam int qty)
    {




            HttpSession session = request.getSession();
            if(session.getAttribute("user_email") == null){
             //   out.println("NOTLOGIN");
            }
            else {

                String email = session.getAttribute("user_email").toString();

                try{
                    ResultSet rs = DBLoader.executeQuery("select * from cart_table where useremail = '"+email+"' and pid ="+pid);
                    if(rs.next()){

                        int old_qty = rs.getInt("qty");
                        int test = old_qty + qty;
                        System.out.println(".........."+test);
                        rs.moveToCurrentRow();
                        rs.updateInt("qty", test);
                        rs.updateRow();
                        //out.println("QTY UPDATED");
                        return "QTY UPDATED";
                    }
                    else {
                        rs.moveToInsertRow();
                        rs.updateString("useremail", email);
                        rs.updateInt("pid", pid);
                        rs.updateInt("cart_max_price", max_price);
                        rs.updateInt("cart_offer_price", offer_price);
                        rs.updateInt("qty", qty);
                        rs.insertRow();
                        return "success";
                       // out.println("success");
                    }


                }
                catch(Exception e){
                    e.printStackTrace();
                }


            }



        return ans;
    }

}

