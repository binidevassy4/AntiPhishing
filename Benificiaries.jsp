<%-- 
    Document   : Benificiaries
    Created on : 28 Feb, 2018, 1:49:15 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::Benificiary</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="content">
            <div class="content_resize">
                <div class="mainbar">
                    <div class="article">
                        <h2><span>Payee</span> For Easy Fund Transfer</h2>
                        <br /><br /><br />

                        <form name="frmview">
                            <table align="center"cellpadding="8" bgcolor="#fff" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                                <tr>
                                    <td align="center">SL.NO</td>
                                    <td align="center">ACCOUNT NUMBER</td>
                                    <td align="center">ACCOUNT HOLDER NAME</td>
                                    <td align="center">EMAIL-ID</td>
                                    <td align="center">CONTACT NO</td>
                                    


                                </tr>
                                <%
                                    int i = 1;
                                    String sel = "select * from tbl_benificiaryadding b inner join tbl_branch br on b.branch_id=br.branch_id inner join tbl_accounts a on b.accounts_id=a.accounts_id inner join tbl_customerdetails cs on a.Customer_id=cs.Customer_id inner join tbl_accounttype aty on a.accounttype_id=aty.accounttype_id where b.Customer_id='" + session.getAttribute("cusid") + "' and b.status=1";
                                    ResultSet rsc = obj.selectCommand(sel);
                                    while (rsc.next()) {
                                        String id = rsc.getString("Benificiary_id");

                                %>
                                <tr>
                                    <td align="center"><%=i%></td>
                                    <td align="center"><%=rsc.getString("accounts_no")%></td>
                                    <td align="center"><%=rsc.getString("Customer_name")%></td>
                                    <td align="center"><%=rsc.getString("Customer_email")%></td>
                                    <td align="center"><%=rsc.getString("Customer_conact")%></td>
                                    

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
        <%@include file="Footer.jsp" %>  
    </body>
</html>
