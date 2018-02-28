<%-- 
    Document   : ChangePinNumber
    Created on : 24 Feb, 2018, 4:33:53 PM
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
        String num="";
        String pin="";
        if(request.getParameter("btnsubmit")!=null)
            {
                
             num=request.getParameter("txtnum");
             pin=request.getParameter("txtpin");
            String sel="select * from tbl_issuedcards where issuedcards_number='"+num+"' and issuedcards_pinnumber='"+pin+"'";
             ResultSet sell=obj.selectCommand(sel);
             if(sell.next())
             {
             response.sendRedirect("Changepin.jsp");
             }else
             {
              %>
                <script> alert("check your Accoount number");</script>
              <%
             }
            
            }
        %>
        <h1 align="center">Change Pin</h1>
        <form name="frmchangepin">
            <table align="center">
                <tr>
                    <td>Enter your card number</td>
                
                    <td><input type="number" name="txtnum"></td>
                </tr>
                <tr>
                    <td>Enter your card pin</td>
                
                    <td><input type="number" name="txtpin"></td>
                </tr>
            <tr><td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                 </td>
             </tr>
            </table>
        </form>
    </body>
</html>
