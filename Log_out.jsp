<%-- 
    Document   : Log_out
    Created on : 9 Apr, 2018, 9:01:58 AM
    Author     : HP
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DesignMe::logout</title>
    </head>
    <body>
        <% session.invalidate(); %>
        
        <% response.sendRedirect("../Guest/Login_1.jsp");%>
        
<p>You have been successfully logout</p>
    </body>
</html>