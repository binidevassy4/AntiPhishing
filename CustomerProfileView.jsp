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
        <%@include file="Header.jsp" %>
        <div class="content">
            <div class="content_resize">
                <div class="mainbar">
                    <div class="article">
                        <h2><span>Profile </span> </h2>
                        <br /><br /><br />

                        <form>
                            <table align="center" cellpadding="8" bgcolor="#fff" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                                <tr>

                                    <th>Name</th>
                                    <th>Date of Birth</th>
                                    <th>Address</th>
                                    <th>Nationality</th>
                                    <th>Pan No</th>
                                    <th>Contact No</th>
                                    <th>Email</th>
                                    <th>District</th>
                                </tr>

                                <%
                                    int i = 1;
                                    String sel = "select * from tbl_customerdetails b inner join tbl_district d on b.district_id=d.district_id  where Customer_id='" + session.getAttribute("cusid") + "'";
                                    ResultSet rsd = obj.selectCommand(sel);
                                    while (rsd.next()) {
                                        String id = rsd.getString("Customer_id");

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

                                </tr>
                                <%
                                        i++;
                                    }
                                %>

                            </table>
                        </form>   
                                <br/><br/>
                        <h2 align="center"><a href="../Customer/CustomerEditProfile.jsp">Edit profile</a></h2>

                    </div>
                </div>
                <%@include file="Slider.jsp" %>  

            </div>
        </div>

        <%@include file="Footer.jsp" %> 
    </body>
</html>
