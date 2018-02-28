<%-- 
    Document   : Cardverification
    Created on : 21 Feb, 2018, 12:05:52 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishnig::Card verification</title>
    </head>
    <body>
         <%
        String crd="";
         if(request.getParameter("btnsubmit")!=null)
            {
                crd=request.getParameter("txtcd");
                String selac="select * from tbl_issuedcards b inner join tbl_accounts d on b.accounts_id=d.accounts_id where issuedcards_number='"+crd+"'";
                 ResultSet selacc=obj.selectCommand(selac);
                if(selacc.next())
                {
                session.setAttribute("custid", selacc.getString("Customer_id"));
                response.sendRedirect("../Guest/CustomerRegistration.jsp");
                }
                else
                {
               %>
               <script>
                   alert("chek your card number");
                   
               </script>
               <%
                }
            }
            
        %>
        <form>
            <table align=center" >
                <tr>
                    <td>Enter your Card number</td>
                    <td><input type="number" name="txtcd"></td>
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
