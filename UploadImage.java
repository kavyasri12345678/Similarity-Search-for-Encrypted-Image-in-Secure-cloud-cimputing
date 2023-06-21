/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import com.database.Dbconnection;
import com.database.Queries;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author KishanVenky
 */
@MultipartConfig(maxFileSize=16*1024*1024)
public class UploadImage extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       try
       {
           HttpSession session=request.getSession();
   String id=(String)session.getAttribute("id");
   String username=(String)session.getAttribute("username");
   String email=(String)session.getAttribute("email");
           
       String index=request.getParameter("index");    
           Part p=request.getPart("image");
   String title=request.getParameter("title");

    String description=request.getParameter("description");
           
             
          KeyGenerator keygen=KeyGenerator.getInstance("AES");
           keygen.init(128);
           SecretKey s=keygen.generateKey();
           //converting secret keyto string
           byte[] b=s.getEncoded();//encoding secret key
           String skey=Base64.encode(b);
           
           InputStream in=p.getInputStream();
                   InputStream in1=p.getInputStream();
          String imagename=p.getName();
           System.out.println("imagename:"+imagename);
           
           String cipher=new encryption().encrypt(index,s);
           
               
                   InputStreamReader inn=new InputStreamReader(in1);
                   BufferedReader br=new BufferedReader(inn);
                   StringBuffer sb=new StringBuffer();
                   
                   String str;
                   while((str=br.readLine())!=null){
                       sb.append(str);
                   }
                   str=sb.toString();
           
          
           
          String query="insert into image values(null,'"+id+"','"+username+"','"+index+"','"+skey+"','"+title+"','"+description+"','"+cipher+"',?,now())";
           Connection con=Dbconnection.getcon();
           PreparedStatement pst=con.prepareStatement(query);
           pst.setBlob(1, in);
           int i=pst.executeUpdate();
         if(i>0)
          {
               File f = new File("D:\\image\\ImageData.jpg");
                                FileWriter fw = new FileWriter(f);
                                fw.write(str);
                                fw.close();
                                Ftpcon ftpcon = new Ftpcon();
                                ftpcon.upload(f, "ImageData.jpg");
              
             
                                response.sendRedirect("UploadImage.jsp?msg=successful...!!");
          }else{
              response.sendRedirect("UploadImage.jsp?msg=Failed...!!");
         }
           
           
       }catch(Exception e){
           System.out.println(e);
       }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
