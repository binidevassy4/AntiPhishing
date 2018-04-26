<%-- 
    Document   : Accountdetails
    Created on : 25 Apr, 2018, 7:48:04 PM
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
        <title>AntiPhishing::Personal Accounts</title>
    </head>
    <body>

        <%@include file="Header.jsp" %>
        <div class="content">
            <div class="content_resize">
                <div class="mainbar">
                    <div class="article">
                        <h2><span>Your</span> Account details</h2>
                        <br /><br /><br />

                        <form name="frmview">
                            <table align="center"cellpadding="8" bgcolor="#fff" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                                <tr>
                                    <td align="center">SL.NO</td>
                                    <td align="center">ACCOUNT NUMBER</td>
                                    <td align="center">ACCOUNT TYPE</td>
                                    <td align="center">BALANCE</td>

                                </tr>
                                <%
                                    int i = 1;
                                    String sel = "select * from tbl_accounts where Customer_id='" + session.getAttribute("cusid") + "'";
                                    ResultSet rsc = obj.selectCommand(sel);
                                    while (rsc.next()) {
                                        String id = rsc.getString("accounts_id");

                                %>
                                <tr>
                                    <td align="center"><%=i%></td>
                                    <td align="center"><%=rsc.getString("accounts_no")%></td>
                                    <td align="center"><%=rsc.getString("accounts_no")%></td>
                                    <td align="center"><%=rsc.getString("accounts_balance")%></td>



                                </tr>
                                <%
                                        i++;
                                    }
                                %>
                            </table>
                        </form>
                    </div>
                                </div>
                            <%@include file="Slider.jsp" %>  
                                </div>
                                
                                </div>
                                </div>
                                <%@include file="Footer.jsp" %>  
                                </body>
                                </html>
