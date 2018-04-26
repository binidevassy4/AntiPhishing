<%-- 
    Document   : BlockCard
    Created on : 24 Feb, 2018, 7:48:12 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::Block Card</title>
    </head>
    <body>
        <%
            String num = "";
            String pin = "";
            if (request.getParameter("btnsubmit") != null) {

                num = request.getParameter("txtnum");
                pin = request.getParameter("txtpin");
                String sel = "select * from tbl_issuedcards where issuedcards_number='" + num + "' and issuedcards_pinnumber='" + pin + "'";
                ResultSet sell = obj.selectCommand(sel);
                if (sell.next()) {
                    String up = "update tbl_issuedcards set issuedcards_status='Blocked' where issuedcards_number='" + num + "' and issuedcards_pinnumber='" + pin + "'";
                    obj.executeCommand(up);
                    
                     %> 
       <script type="text/javascript">
            alert("your card is blocked");
            setTimeout(function(){window.location.href='customer_home.jsp'},100);
        </script>
     <%
                   
                } else {
        %>
        <script> alert("chek your Accoount number");</script>
        <%
                }

            }

        %>
        <%@include file="Header.jsp" %>
        <div class="content">
            <div class="content_resize">
                <div class="mainbar">
                    <div class="article">
                        <h2><span>Block </span> Card</h2>
                        <br /><br /><br />

                        <form>
                            <table align="center" cellpadding="12">
                                <tr>


                                    <td><input type="number" name="txtnum"  placeholder="        Enter Your Card Number" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr>

                                    <td><input type="number" name="txtpin" placeholder="        Enter Your Card Pin" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"> </td>
                                </tr>
                                <tr><td colspan="2" align="center">
                                        <input type="submit" name="btnsubmit" value="Submit" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">&nbsp;
                                        <input type="reset" name="btnreset" value="Cancel" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    </td>
                                </tr>
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
