<%-- 
    Document   : captcha
    Created on : 8 Apr, 2018, 11:03:09 PM
    Author     : Bini Devassy
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
              Thread.sleep(10000);
                        String img="",name1="",cshare="";
            String sel="select max(id)as id from tbl_registration";
           ResultSet rs=obj.selectCommand(sel);
           while(rs.next())
           {
               session.setAttribute("id", rs.getString("id"));
           }
                       String capaa="select * from tbl_registration where id='"+session.getAttribute("id")+"'";
                       ResultSet rscap=obj.selectCommand(capaa);
                      System.out.println("REG"+capaa);
                       if(rscap.next())
                       {
                         img=rscap.getString("captcha");
                          name1=rscap.getString("name");
                         cshare=rscap.getString("cshare");
                         System.out.println("CSHARE"+cshare);
                          session.setAttribute("share", cshare);
                       }
                     if(request.getParameter("btn")!=null)
                     {
                          String name=request.getParameter("cptcha");
                         if(name1.equals(name))
                         {
                             
                             
                             System.out.println("session"+session.getAttribute("share"));

                         
                         }else
                         {
                              System.out.println("incorrect");
                         }
                     //   out.print("iddd"+session.getAttribute("share")); 
                         
                     }
                     
                        %>
                        <form action="downloadshare.jsp" method="post" enctype="multipart/form-data">
                <table align="center" cellpadding="12">
                    <tr>
                        <td>
                            
                            <img src="Captchas/Original/<%=img%>">
                        </td>
                    </tr>
                    <tr>
                        
                        <td>
                            <input type="text" name="cptcha" required="" placeholder="         Enter The Captcha Here To Download" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="center">
                            <input type="submit" name="btn" value="download captcha" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"> 
                        </td>
                    </tr>
                      
                    
                </table>
                        
                        <h3 align="center"><i>  After download captcha you can login <br />go to<a href="Home.jsp"> login</a></i></h3>
                
            </form>
            
        
    </body>
</html>
