<%-- 
    Document   : Changepin
    Created on : 24 Feb, 2018, 5:15:05 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::Change Pin Number</title>
    </head>
    <body>
        <%
            String old = "";
            String newp = "";
            String verp = "";
            if (request.getParameter("btnsubmit") != null) {
                old = request.getParameter("txtold");
                newp = request.getParameter("txtnew");
                verp = request.getParameter("txtnpin");

                String selo = "select * from tbl_issuedcards where issuedcards_pinnumber='" + old + "' and  and issuedcards_status='issued'";
                ResultSet seloo = obj.selectCommand(selo);
                if (seloo.next()) {
                    String sel = "select * from tbl_issuedcards where issuedcards_pinnumber='" + newp + "'";
                    ResultSet sell = obj.selectCommand(sel);
                    if (sell.next()) {
        %>
        <script> alert("select a another pin");</script>
        <%
        } else {
            String up = "update tbl_issuedcards set issuedcards_pinnumber='" + newp + "'where issuedcards_pinnumber='" + old + "'";
            boolean b = obj.executeCommand(up);
            if (b) {
        %> 
        <script type="text/javascript">
            alert("requested pin number is changed");
            setTimeout(function() {
                window.location.href = 'customer_home.jsp'
            }, 100);
        </script>
        <%
        } else {
        %>
        <script>alert("Can't change your pin");</script>
        <%
                    }
                }

            }
        %>
        <script>alert("Can't change pin ! your card is blocked");</script>
        <%
            }

        %>
        <%@include file="Header.jsp" %>
        <div class="content">
            <div class="content_resize">
                <div class="mainbar">
                    <div class="article">
                        <h2><span>Change </span> Your Pin Number</h2>
                        <br /><br /><br />
                        <form>
                            <table align="center" cellpadding="12">
                                <tr>

                                    <td><input type="number" name="txtold" required="" pattern="[0-9]{4}" placeholder="             Enter your old pin" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr>

                                    <td><input type="number" name="txtnew" required="" pattern="[0-9]{4}" placeholder="             Enter new pin" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr>

                                    <td><input type="number" name="txtnpin"  required="" pattern="[0-9]{4}" placeholder="             Verify new pin" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr><td colspan="2" align="center">
                                        <input type="submit" name="btnsubmit" value="Submit"size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">&nbsp;
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
