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
        String old="";
        String newp="";
        String verp="";
         if(request.getParameter("btnsubmit")!=null)
            {
            old=request.getParameter("txtold");
            newp=request.getParameter("txtnew");
            verp=request.getParameter("txtnpin");  
           
            String sel="select * from tbl_issuedcards where issuedcards_pinnumber='"+newp+"'";
             ResultSet sell=obj.selectCommand(sel);
             if(sell.next())
             {
               %>
                <script> alert("select a another pin");</script>
              <%
             }else
             {
             String up="update tbl_issuedcards set issuedcards_pinnumber='"+newp+"'where issuedcards_pinnumber='"+old+"'";
             boolean b=obj.executeCommand(up);
                  if(b)
                  {
                    response.sendRedirect("CustomerHome.jsp");
                  }
                  else
                  {
                    %>
                <script>alert("Can't change your pin");</script>
               <%
                  }
             }
            }
        
            
        %>
        <h1 align="center"> Change pin</h1><br>
        <form>
            <table align="center">
                <tr>
                    <td>Enter your old pin</td>
                    <td><input type="number" name="txtold"></td>
                </tr>
                <tr>
                    <td>Enter new pin</td>
                    <td><input type="number" name="txtnew"></td>
                </tr>
                <tr>
                    <td>Verify new pin</td>
                    <td><input type="number" name="txtnpin"></td>
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
