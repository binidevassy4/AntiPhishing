<%-- 
    Document   : finalStep
    Created on : 9 Apr, 2018, 11:34:06 PM
    Author     : AkHiLeSh
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
           Thread.sleep(5000);
           String pass="";
       String sel="select * from tbl_registration where name='"+session.getAttribute("compainshare")+"'";
       ResultSet rs=obj.selectCommand(sel);
       
       if(rs.next())
       {
        pass=rs.getString("pass");
        session.setAttribute("cusid", rs.getString("Customer_id"));
       }
       String img=session.getAttribute("compainshare").toString()+".png";
      // out.println(img);
       if(request.getParameter("btn")!=null)
       {
           if(pass.equals(request.getParameter("pass")))
           {
                
               response.sendRedirect("../Customer/customer_home.jsp");
           }else
           {
              out.println("not done");  
           }
       }
       
       %>
    </body>
    <form>
    <table align="center" cellpadding="12">
        <tr>
            <td>
                <img src="Captchas/Compain/<%=img%>"
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" name="pass" required=""  placeholder="      Enter Your Password" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" > 
            </td>
            
        </tr>
        
        <tr>
            <td align="center">
        <input type="submit" name="btn" value="Log IN" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">  
        </td>
        </tr>
    </table>
            </form>
</html>
