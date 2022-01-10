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
@RequestMapping("/placing_order")
public class placing_order
{
    //HttpServletRequest request;
    String ans="fail";

    @RequestMapping(
            method = RequestMethod.GET ,
            produces = MediaType.TEXT_HTML_VALUE
    )
    public String some(HttpServletRequest request,@RequestParam int actualamount,@RequestParam int paidamount, @RequestParam String address,@RequestParam String paymentmode,@RequestParam String phoneno,@RequestParam String online_txn_id)
    {


                HttpSession session = request.getSession();
                String useremail = session.getAttribute("user_email").toString();
                try{
                    ResultSet rs = DBLoader.executeQuery("select * from billtable");
                    rs.moveToInsertRow();
                    rs.updateInt("actual_amount", actualamount);
                    rs.updateInt("paidamount", paidamount);
                    rs.updateString("username", useremail);
                    rs.updateString("address", address);
                    rs.updateString("payment_mode", paymentmode);
                    rs.updateString("txn_id", online_txn_id);
                    rs.updateString("phoneno", phoneno);
                    rs.updateString("status", "pending");
                    rs.insertRow();


                    ResultSet rs2 = DBLoader.executeQuery("select max(billid) as billid from billtable");
                    if(rs2.next()){
                        int bill_id = rs2.getInt("billid");
                        System.out.println("billid........."+bill_id);

                        ResultSet rs_3 = DBLoader.executeQuery("select * from cart_table where useremail='"+useremail+"'");
                        while(rs_3.next()){

                            int pid = rs_3.getInt("pid");
                            int cartid = rs_3.getInt("cartid");
                            int cart_max_price = rs_3.getInt("cart_max_price");
                            int cart_offer_price = rs_3.getInt("cart_offer_price");
                            int qty = rs_3.getInt("qty");


                            ResultSet rs4 = DBLoader.executeQuery("select * from bill_detail");
                            rs4.moveToInsertRow();
                            rs4.updateInt("bill_id", bill_id);
                            rs4.updateInt("pid", pid);
                            rs4.updateInt("price", cart_max_price);
                            rs4.updateInt("offerprice", cart_offer_price);
                            rs4.updateInt("qty", qty);
                            rs4.insertRow();

                            rs_3.deleteRow();



                        }
                        return "success";


                    }





                }
            catch(Exception e){
                e.printStackTrace();
            }

        return "ans";
        }






}

