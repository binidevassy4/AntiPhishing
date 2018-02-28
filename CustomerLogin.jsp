<%-- 
    Document   : CustomerLogin
    Created on : 21 Feb, 2018, 2:26:13 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::Customer login</title>
    </head>
    <body>
        <%
            if(request.getParameter("btnsubmit")!=null)
            {
        String username="";
        String password="";
        username=request.getParameter("txtuser");
        password=request.getParameter("txtpass");
      
        String selbank = "select * from tbl_login where username='"+username+"' and password='"+password+"'";
        ResultSet selbn=obj.selectCommand(selbank);
        if(selbn.next())
        {
        session.setAttribute("cusid", selbn.getString("Customer_id"));
        response.sendRedirect("../Customer/CustomerHome.jsp");
        }
       
            }
        %>
        <h1 align="center"> Customer Login</h1>
        <form name="frmlogin">
            <table align="center" >
                <tr>
                <td>User name:</td>
                <td><input type="text" name="txtuser" value=""></td>
                </tr>
                <tr>
                <td>Password:</td>
                <td><input type="password" name="txtpass" value=""></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsubmit" value="submit"></td>
                     
                </tr>
            </table>
        </form>
    </body>
</html>
