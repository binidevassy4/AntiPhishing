<%-- 
    Document   : Accountverification
    Created on : 21 Feb, 2018, 12:05:34 PM
    Author     : HP
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishnig::Account verification</title>

        <script type = "text/javascript" >

            function preventBack() {
                window.history.forward();
            }

            setTimeout("preventBack()", 0);

            window.onunload = function() {
                null
            };

        </script>
    </head>
    <body>
        <%
            String acc = "";
            if (request.getParameter("btnsubmit") != null) {
                acc = request.getParameter("txtac");
                String selac = "select * from tbl_accounts where accounts_no='" + acc + "'";
                ResultSet selacc = obj.selectCommand(selac);
                if (selacc.next()) {
                    session.setAttribute("custid", selacc.getString("Customer_id"));
                    response.sendRedirect("../Guest/Registration.jsp");
                }
        %>
        <script>
            alert("chek your Accoount number");</script>
            <%
                }

            %>
       
                            <form>
                                <table align="center" cellpadding="14">
                                    <tr>
                                     
                                        <td><input type="number" name="txtac" required="" pattern="[0-9]{9,16}"   placeholder="        Enter your Account number" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="submit" name="btnsubmit" value="Submit" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                            <input type="reset" name="btnreset" value="Cancel" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                        </td>
                                    </tr>

                                </table>
                            </form>
                      
                        
             
    </body>
    
    
   
</html>
