<%-- 
    Document   : BenificiaryRequests
    Created on : 28 Feb, 2018, 11:53:45 AM
    Author     : HP
--%>
<%@include file="Header.jsp" %>
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
          
             <div class="fbg">
    <div class="fbg_resize">
      
        <h2><span>Benificiary </span> Requests</h2>
     
    </div>
 </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav"> 
       
        <form name="frmview">
            <table align="center" cellspacing="8" bgcolor="#00000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <td>Sl.no</td>
                    <td>Account Number</td>
                    <td>Account holder name</td>
                    <td>Email id</td>
                    <td>Contact no</td>
                    <td>Requested account holder</td>
                    <td>Account Blance</td>
                    
                    
                </tr>
                <%
                int i=1;
                String sel="select * from tbl_benificiaryadding b inner join tbl_customerdetails c on b.Customer_id=c.Customer_id inner join tbl_accounts a on b.accounts_id=a.accounts_id inner join tbl_customerdetails cd on a.Customer_id=cd.Customer_id where b.status=0 and c.branch_id='"+session.getAttribute("brid")+"'";
                ResultSet rsc=obj.selectCommand(sel);
                while(rsc.next())
                 {
                  String id=rsc.getString("Benificiary_id");
                 
             %>
             <tr>
                <td><%=i%></td>
                <td><%=rsc.getString("accounts_no")%></td>
                <td><%=rsc.getString("c.Customer_name")%></td>
                <td><%=rsc.getString("Customer_email")%></td>
                <td><%=rsc.getString("Customer_conact")%></td>
                <td><%=rsc.getString("cd.Customer_name")%></td>
                <td><%=rsc.getString("accounts_balance")%></td> 
                <td><a href="BenificiaryRequests.jsp?aid=<%=id%>">Approve</a></td>&nbsp;&nbsp;
                <td><a href="BenificiaryRequests.jsp?did=<%=id%>">Reject</a></td>
             </tr>
            <%
            i++;
                 }
            %>
                
            </table>   
        </form>
                </div>
            </div>
        </div>
            <br><br><br><br><br><br><br><br><br><br><br><br>
                            <%@include file="Footer.jsp" %>   
    </body>
</html>
