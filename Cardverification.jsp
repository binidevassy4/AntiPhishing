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
                String selac="select * from tbl_issuedcards b inner join tbl_accounts d on b.accounts_id=d.accounts_id where issuedcards_number='"+crd+"' and issuedcards_status='issued'";
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
            <br><br><br><br>
             <table align="left" cellpadding="14">
                <tr>
                    
                    <td><input type="number" name="txtcd" required="" pattern="[0-9]{4}" placeholder="        Enter Your Card Number" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" ></td>
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
