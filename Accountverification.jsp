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
    </head>
    <body>
        <%
        String acc="";
         if(request.getParameter("btnsubmit")!=null)
            {
                acc=request.getParameter("txtac");
                String selac="select * from tbl_accounts where accounts_no='"+acc+"'";
                 ResultSet selacc=obj.selectCommand(selac);
                if(selacc.next())
                {
                session.setAttribute("custid", selacc.getString("Customer_id"));
                response.sendRedirect("../Guest/CustomerRegistration.jsp");
                }
                %>
                <script>
                   alert("chek your Accoount number");</script>
               <%
            }
            
        %>
        <form>
            <table align=center" >
                <tr>
                    <td>Enter your Account number</td>
                    <td><input type="number" name="txtac"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                                  </td>
                </tr>
                
            </table>
        </form>
    </body>
</html>