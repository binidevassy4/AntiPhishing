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
            <script type = "text/javascript" >

            function preventBack() {
                window.history.forward();
            }

            setTimeout("preventBack()", 0);

            window.onunload = function() {
                null
            };
        </script>
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
            <table align="center" cellpadding="12" >
                <tr>
               
                    <td><input type="text" name="txtuser" value="" placeholder="                         User Name" size="40" style="background-color:#fff;height:40px; width:400px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" ></td>
                </tr>
                <tr>
                
                    <td><input type="password" name="txtpass" value="" placeholder="                         Password" size="40" style="background-color:#fff;height:40px; width:400px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" ></td>
                </tr>
                <tr colspan="2">
                    <td><input type="submit" name="btnsubmit" value="submit" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                    <input type="reset" name="btnreset" value="reset" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>   
                </tr>
            </table>
        </form>
    </body>
</html>
