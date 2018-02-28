<%-- 
    Document   : ProfileView
    Created on : 22 Feb, 2018, 3:14:49 PM
    Author     : HP
--%>
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
        <br><br>
        <h1 align="center">Profile</h1>
        <form>       
              <table align="center" border="2">
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
                   
                    <td><%=rsd.getString("branch_name")%></td>
                    <td><%=rsd.getString("branch_contactno")%></td>
                    <td><%=rsd.getString("branch_email")%></td>
                    <td><%=rsd.getString("branch_username")%></td>
                    <td><%=rsd.getString("branch_address")%></td>
                    <td><%=rsd.getString("palce_name")%></td>
                    <td><%=rsd.getString("branch_pin")%></td>
                    <td><%=rsd.getString("branch_ifsc")%></td>
                     </tr>
                    <%  
                    }
                    %>                     
          </table>    
         </form>
          <h3 align="center"><a href="../Branch/BranchEditProfile.jsp">Edit</a></h3>
    </body>
</html>
