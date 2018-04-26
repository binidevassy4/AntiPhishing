<%-- 
    Document   : Registration
    Created on : 7 Apr, 2018, 7:45:46 PM
    Author     : Bini Devassy
--%>

<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
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
        
        <%
            String saltStr="",text="",cshare="",formate="",sshare="";
            String id="";
            String image="";
        if(request.getParameter("cbtn")!=null)
        {
            text=request.getParameter("pass");
             String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd1 = new Random();
        while (salt.length() < 3) { // length of the random string.
            int index = (int) (rnd1.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
           saltStr = salt.toString();
           cap.main(text+saltStr); 
         //  BufferedImage bf=cap.text_to_captcha(text+saltStr);
            // cap.share_generate(bf);
           formate=text+saltStr+".jpg";
           cshare="C"+text+saltStr+".png";
           sshare="S"+text+saltStr+".png";
         out.println(formate);
       String ins="insert into tbl_registration(pass,captcha,cshare,sshare,name,Customer_id,Username)values('"+request.getParameter("pass")+"','"+formate+"','"+cshare+"','"+sshare+"','"+text+saltStr+"','"+session.getAttribute("custid")+"','"+request.getParameter("username")+"')" ; 
      boolean b= obj.executeCommand(ins);
      System.out.println(ins);
       if(b==true)
       {
        response.sendRedirect("captcha.jsp");
       }else
       {
           out.println(ins);
       }
        }
        
        %>
        <form>
            <table align="left" cellpadding="14">
                <tr>
                     <td>
                         <input type="text" name="username" required="" pattern="[A-Z, ,a-z]{8,20}" placeholder="        User Name" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" >
                    </td>
                    
                </tr>
                <tr>
                   
                     <td>
                         <input type="text" name="pass" maxlength="4" required=""  placeholder="        User Name" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" >
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="cbtn" value="GenerateCaptcha" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">   
                    </td>
                </tr>
                <tr>
                  
                </tr>
            </table>
        </form>
      
    </body>
</html>
