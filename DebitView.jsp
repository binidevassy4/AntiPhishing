<%-- 
    Document   : DebitView
    Created on : 2 Mar, 2018, 7:15:03 PM
    Author     : HP
--%>
<%@include file="Header.jsp" %>
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
               
             <div class="fbg">
    <div class="fbg_resize">
      
        <h2><span>Debit </span> Transactions</h2>
     
    </div>
 </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav"> 
       
        <form>       
              <table align="center"cellpadding="8" bgcolor="#00000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
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
                   
                    <td align="center"><%=rsd.getString("accounts_no")%></td>
                    <td align="center"><%=rsd.getString("Customer_name")%></td>
                    <td align="center"><%=rsd.getString("td_amount")%></td>
                    <td align="center"><%=rsd.getString("transaction_date")%></td>
                     </tr>
                    <%  
                    }
                    %>                     
          </table>    
         </form>
          <h3 align="center"> <a href="../Branch/ViewFundTranssfer.jsp" ><h2>Back</h2></a></h3>
                </div>
            </div>
        </div>
          <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                            <%@include file="Footer.jsp" %>     
    </body>
</html>
