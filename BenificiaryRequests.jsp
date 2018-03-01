<%-- 
    Document   : BenificiaryRequests
    Created on : 28 Feb, 2018, 11:53:45 AM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::Benificiary request</title>
    </head>
    <body>
        <%
         
        if(request.getParameter("aid")!=null)
            {
            String up="update tbl_benificiaryadding set status='1' where Benificiary_id='"+request.getParameter("aid")+"' ";
             obj.executeCommand(up);
            }
           
        if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_benificiaryadding where Benificiary_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            }
        %>
        <h1 align="center">Benificiary Requests</h1>
        <form name="frmview">
            <table align="center" border="1">
                <tr>
                    <td>Sl.no</td>
                    <td>Account Number</td>
                    <td>Account holder name</td>
                    <td>Email id</td>
                    <td>Contact no</td>
                    <td>Account type</td>
                    <td>Account Blance</td>
                    
                </tr>
                <%
                int i=1;
                String sel="select * from tbl_benificiaryadding b inner join tbl_branch br on b.branch_id=br.branch_id inner join tbl_accounts a on b.accounts_id=a.accounts_id inner join tbl_customerdetails cs on a.Customer_id=cs.Customer_id inner join tbl_accounttype at on a.accounttype_id=at.accounttype_id where br.branch_id='"+session.getAttribute("brid")+"' and b.status=0";
                ResultSet rsc=obj.selectCommand(sel);
                while(rsc.next())
                 {
                  String id=rsc.getString("Benificiary_id");
                 
             %>
             <tr>
                <td><%=i%></td>
                <td><%=rsc.getString("accounts_no")%></td>
                <td><%=rsc.getString("Customer_name")%></td>
                <td><%=rsc.getString("Customer_email")%></td>
                <td><%=rsc.getString("Customer_conact")%></td>
                <td><%=rsc.getString("accounttype_name")%></td>
                <td><%=rsc.getString("accounts_balance")%></td> 
                <td><a href="BenificiaryRequests.jsp?aid=<%=id%>">Approve</a></td>
                <td><a href="BenificiaryRequests.jsp?did=<%=id%>">Reject</a></td>
             </tr>
            <%
            i++;
                 }
            %>
                
            </table>   
        </form>
    </body>
</html>
