<%-- 
    Document   : Benificiaries
    Created on : 28 Feb, 2018, 1:49:15 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::Benificiary</title>
    </head>
    <body>
        <h1 align="center">Benifciries</h1>
        <form name="frmview">
            <table align="center" border="1">
                <tr>
                    <td>Sl.no</td>
                    <td>Account Number</td>
                    <td>Account holder name</td>
                    <td>Email id</td>
                    <td>Contact no</td>
                    <td>Account type</td>
                   
                    
                </tr>
                <%
                int i=1;
                String sel="select * from tbl_benificiaryadding b inner join tbl_branch br on b.branch_id=br.branch_id inner join tbl_accounts a on b.accounts_id=a.accounts_id inner join tbl_customerdetails cs on a.Customer_id=cs.Customer_id inner join tbl_accounttype aty on a.accounttype_id=aty.accounttype_id where b.Customer_id='"+session.getAttribute("cusid")+"' and b.status=1";
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
                  
             </tr>
            <%
            i++;
                 }
            %>
                
            </table>   
        </form>
    </body>
</html>
