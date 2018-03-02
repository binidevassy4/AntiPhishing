<%-- 
    Document   : DebitView
    Created on : 2 Mar, 2018, 7:15:03 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing :: view Debit transfer</title>
    </head>
    <body>
       <h1 align="center">Debit Transactions</h1>
        <form>       
              <table align="center" border="1">
              <tr>
                   
                    <th>Account Number</th>
                    <th>Customer name</th>
                    <th>Transaction Amount</th>
                    <th>Transaction Date</th>
                     
                </tr>
                
                <%
                int i=1;
                String sel="select * from tbl_fundsdetails fd inner join tbl_transaction tr on fd.transaction_id=tr.transaction_id inner join tbl_accounts ac on fd.accounts_id=ac.accounts_id inner join tbl_customerdetails cs on ac.Customer_id=cs.Customer_id where cs.branch_id='"+session.getAttribute("brid")+"' and fd.fd_type='debit'";
                ResultSet rsd=obj.selectCommand(sel);
                while(rsd.next())
                    {
                     String id=rsd.getString("fd_id");
                     i++;
                 %>
                 
                 <tr>
                   
                    <td><%=rsd.getString("accounts_no")%></td>
                    <td><%=rsd.getString("Customer_name")%></td>
                    <td><%=rsd.getString("td_amount")%></td>
                    <td><%=rsd.getString("transaction_date")%></td>
                     </tr>
                    <%  
                    }
                    %>                     
          </table>    
         </form>
          <h3 align="center"> <a href="../Branch/ViewFundTranssfer.jsp" >Back</a></h3>
    </body>
</html>
