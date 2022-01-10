package com.ae2assessment.ae2shopping.vmm;

import org.springframework.web.multipart.MultipartFile;

import java.io.DataInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileUploader {
    public static String Uploads(MultipartFile photo,long random) {


        try {
            InputStream in = photo.getInputStream();
            FileOutputStream out = new FileOutputStream("C:/Users/user/Downloads/demojava2/demojava2/upload_folder/" + random+photo.getOriginalFilename());

            long filesize =photo.getSize();
            long count = 0;
            int r;
            byte b[] = new byte[1000];

            while (true) {
                r = in.read(b, 0, 1000);
                out.write(b, 0, r);

                count = count + r;

                if (count == filesize) {
                    break;
                }
            }

            out.close();



        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "";
    }

}