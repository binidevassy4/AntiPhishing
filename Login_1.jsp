<%-- 
    Document   : Login
    Created on : 9 Apr, 2018, 1:23:06 PM
    Author     : BINI DEVASSY
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<jsp:useBean id="cap" class="captcha_generator.captcha"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
      
        <form action="CaptchaUploadAction.jsp" method="post" enctype="multipart/form-data">        
            <table cellpadding="12">
               
                <tr>
                <td>
                    <input type="text" name="pass" required=""  placeholder="        PassWord" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" >
                </td>
                
                </tr>
                <tr>
                    
                <td>
                     <input type="file" name="share"> 
                   
                </td>
                
              
                    
            
            </tr>
            <tr>
                <td>
                     <input type="submit" name="upload" value="Upload and Continue"  size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                </td>
            </tr>
            
        </table>
         </form> 
        
    </body>
</html>
