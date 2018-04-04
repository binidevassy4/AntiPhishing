<%-- 
    Document   : ProfileView
    Created on : 22 Feb, 2018, 3:14:49 PM
    Author     : HP
--%>
<%@include file="Header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::Branch Profile</title>
    </head>
    <body>
               
             <div class="fbg">
    <div class="fbg_resize">
      
        <h2><span>Profile</span> </h2>
     
    </div>
 </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav"> 
               
        <form>       
              <table align="center" cellpadding="8" bgcolor="#00000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
              <tr>
                   
                    <th>Branch name</th>
                    <th>Contact no</th>
                    <th>Email id</th>
                    <th>User name</th>
                    <th>Address</th>
                    <th>Place</th>
                    <th>Pin no</th>
                    <th>IFSC Code</th> 
                </tr>
                
                <%
                int i=0;
                String sel="select * from tbl_branch b inner join tbl_place d on b.palce_id=d.palce_id where branch_id='"+session.getAttribute("brid")+"'";
                ResultSet rsd=obj.selectCommand(sel);
                while(rsd.next())
                    {
                     String id=rsd.getString("branch_id");
                     i++;
                 %>
                 
                 
                 <tr>
                   
                    <td align="center"><%=rsd.getString("branch_name")%></td>
                    <td align="center"><%=rsd.getString("branch_contactno")%></td>
                    <td align="center"><%=rsd.getString("branch_email")%></td>
                    <td align="center"><%=rsd.getString("branch_username")%></td>
                    <td align="center"><%=rsd.getString("branch_address")%></td>
                    <td align="center"><%=rsd.getString("palce_name")%></td>
                    <td align="center"><%=rsd.getString("branch_pin")%></td>
                    <td align="center"><%=rsd.getString("branch_ifsc")%></td>
                     </tr>
                    <%  
                    }
                    %>                     
          </table>    
         </form>
          <h3 align="center"><a href="../Branch/BranchEditProfile.jsp"><h2>Edit</h2></a></h3>
                </div>
            </div>
        </div>
          <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                            <%@include file="Footer.jsp" %>     
    </body>
</html>
