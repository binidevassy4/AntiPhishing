
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%
   String balance=""; 
    
String a=request.getParameter("id");
String sel="select * from tbl_accounts where accounts_id='"+a+"'";
ResultSet rs=obj.selectCommand(sel);
while(rs.next())
{
    balance=rs.getString("accounts_balance");

%>

   <label><%=balance%></label>

<%

}

%>