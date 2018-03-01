<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%
String id=request.getParameter("id");
String sel="select * from tbl_accounts a inner join tbl_accounttype ac on a.accounttype_id=ac.accounttype_id inner join tbl_customerdetails c on a.Customer_id=c.Customer_id where branch_id='"+id+"'";
ResultSet rs=obj.selectCommand(sel);
while(rs.next())
{
   
    %>
   
    <option value="<%= rs.getString("accounts_id")%>"><%=rs.getString("accounts_no")%>&nbsp; name:<%=rs.getString("Customer_name")%></option>
     
    <%
}
%>