<%-- 
    Document   : Login
    Created on : 15 Feb, 2018, 10:22:54 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::login</title>
    </head>
    <body>
        <%
            if(request.getParameter("btnsubmit")!=null)
            {
        String username="";
        String password="";
        username=request.getParameter("txtuser");
        password=request.getParameter("txtpass");
      
        String selbank = "select * from tbl_bank where bank_username='"+username+"' and bank_password='"+password+"'";
        ResultSet selbn=obj.selectCommand(selbank);
        if(selbn.next())
        {
        session.setAttribute("bankid", selbn.getString("bank_id"));
        response.sendRedirect("../Admin/Admin_home.jsp");
        }
        else
        {
            String selbranch="select * from tbl_branch where branch_username='"+username+"' and branch_password='"+password+"'";
            ResultSet selbr=obj.selectCommand(selbranch);
             if(selbr.next())
        {
            session.setAttribute("brid", selbr.getString("branch_id"));
            
           response.sendRedirect("../Branch/Branch_home.jsp");
        }
        
            }
        }
        %>
        <h1 align="center">LOGIN</h1>
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
                    <td><input type="reset" name="btnreset" value="reset"></td>   
                </tr>
            </table>
        </form>
    </body>
</html>
