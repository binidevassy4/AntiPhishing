<%-- 
    Document   : CustomerRegistration
    Created on : 14 Feb, 2018, 2:25:09 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishnig::CustomerRegistration</title>
    </head>
    <body>
        <%
        String usname="";
        String pass="";
         if(request.getParameter("btnsubmit")!=null)
            {
            usname=request.getParameter("txtuname");
            pass=request.getParameter("txtpass");
            String ins="insert into tbl_login(username,password,Customer_id)values('"+usname+"','"+pass+"','"+session.getAttribute("custid")+"')";
            boolean b1=obj.executeCommand(ins);
            if(b1)
                {
                    response.sendRedirect("CustomerLogin.jsp");
                    
                }
            }
        %>
        <h3 align="center">Registration</h3>
        <form>
            <table align="center">
                <tr>
                    <td>User name</td>
                    <td><input type="text" name="txtuname"></td>
                </tr> 
                <tr>
                    <td>PassWord</td>
                    <td><input type="password" name="txtpass"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsubmit" value="submit"></td>
                    <td><input type="reset" name="btnreset" value="reset"></td>   
                </tr>
            </table>
        </form>
    </body>
</html>
