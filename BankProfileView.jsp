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
        <title>AntiPhishing::BankProfileView</title>
    </head>
    <body>
        <h3 align="center">Bank profile</h3>
        <form>       
              <table align="center" border="2">
              <tr>
                   <th>sl.no</th>
                    <th>Branch name</th>
                    <th>Contact no</th>
                    <th>Email id</th>
                    <th>User name</th>
                    <th>Address</th>
                    <th>Place</th>
                    <th>Pin no</th>                    
                </tr>
                
                <%
                int i=0; 
                String sel="select * from tbl_bank b inner join tbl_place d on b.palce_id=d.palce_id where bank_id='"+session.getAttribute("bankid")+"'";
                    ResultSet rsd=obj.selectCommand(sel);
                    while(rsd.next())
                    {
                     String id=rsd.getString("bank_id");
                     i++;
                 %>
                 
                 
                 <tr>
                    <td><%=i%></td>
                    <td><%=rsd.getString("bank_name")%></td>
                    <td><%=rsd.getString("bank_contactno")%></td>
                    <td><%=rsd.getString("bank_email")%></td>
                    <td><%=rsd.getString("bank_username")%></td> 
                    <td><%=rsd.getString("bank_address")%></td>
                    <td><%=rsd.getString("palce_name")%></td>
                    <td><%=rsd.getString("pincode")%></td>
                 </tr>
                    <%  
                    }
                    %>                     
          </table>    
         </form>
          <br>
        <h4 align="center"> <a href="../Admin/BankEditProfile.jsp"> Edit</a></h4>
    </body>
</html>
