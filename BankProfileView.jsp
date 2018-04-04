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
        <title>AntiPhishing::BankProfileView</title>
    </head>
    <body>


 <div class="fbg">
    <div class="fbg_resize">
      
        <h2><span>Bank</span> Profile</h2>
     
    </div>
 </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav">
                    <form>       
                        <table align="center" bgcolor="#000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                            <tr>

                            <th><h2>Name</h2></th>
                            <th><h2>Contact no</h2></th>
                            <th><h2>Email id</h2></th>
                            <th><h2>User name</h2></th>
                            <th><h2>Address</h2></th>
                            <th><h2>Place</h2></th>
                            <th><h2>Pin no</h2></th>                    
                            </tr>

                            <%
                                int i = 0;
                                String sel = "select * from tbl_bank b inner join tbl_place d on b.palce_id=d.palce_id where bank_id='" + session.getAttribute("bankid") + "'";
                                ResultSet rsd = obj.selectCommand(sel);
                                while (rsd.next()) {
                                    String id = rsd.getString("bank_id");
                                    i++;
                            %>


                            <tr>

                                <td align="center"><%=rsd.getString("bank_name")%></td>
                                <td align="center"><%=rsd.getString("bank_contactno")%></td>
                                <td align="center"><%=rsd.getString("bank_email")%></td>
                                <td align="center"><%=rsd.getString("bank_username")%></td> 
                                <td align="center"><%=rsd.getString("bank_address")%></td>
                                <td align="center"><%=rsd.getString("palce_name")%></td>
                                <td align="center"><%=rsd.getString("pincode")%></td>
                            </tr>
                            <%
                                }
                            %>                     
                        </table>    
                    </form>
                    <br>
                    <h2 align="center"> <a href="../Admin/BankEditProfile.jsp"> Edit</a></h2>
                     <div class="clr"></div>
                </div>
            </div>
        </div>
                        <br><br><br>
        <%@include file="Footer.jsp" %>   
</body>
</html>
