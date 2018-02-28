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
        <title>AntiPhishing::Customer Profile</title>
    </head>
    <body>
        <h1 align="center">Profile</h1>
        <form>
            <table align="center" border="1">
                <tr>
                    
                    <td>Name</td>
                    <td>Date of Birth</td>
                    <td>Address</td>
                    <td>Nationality</td>
                    <td>Pan No</td>
                    <td>Contact No</td>
                    <td>Email</td>
                    <td>District</td>
                </tr>
                
                <%
                int i=1;
                String sel="select * from tbl_customerdetails b inner join tbl_district d on b.district_id=d.district_id  where Customer_id='"+session.getAttribute("cusid")+"'";
                ResultSet rsd=obj.selectCommand(sel);
                while(rsd.next())
                 {
                  String id=rsd.getString("Customer_id");
                  
                 %>
                  <tr>
                    
                    <td><%=rsd.getString("Customer_name")%></td>
                    <td><%=rsd.getString("Customer_dob")%></td>
                    <td><%=rsd.getString("Customer_address")%></td>
                    <td><%=rsd.getString("Customer_nation")%></td>
                    <td><%=rsd.getString("Customer_panno")%></td>
                    <td><%=rsd.getString("Customer_conact")%></td>
                    <td><%=rsd.getString("Customer_email")%></td>
                    <td><%=rsd.getString("district_name")%></td>
                    <td><a href="CustomerDetails.jsp?did=<%=id%>">Delete</a>
                    <a href="CustomerDetails.jsp?editid=<%=id%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                    }
                    %>
                    
            </table>
        </form>
                    <h3 align="center"><a href="../Customer/CustomerEditProfile.jsp">Edit profile</a></h3>
    </body>
</html>
