<%-- 
    Document   : BeneficiaryAdding
    Created on : 27 Feb, 2018, 11:24:40 AM
    Author     : AkHiLeSh
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::BenificiaryAdding</title>
    </head>
     <script src="jquery.js" type="text/javascript"></script>
        <script>
         function getaccounts(a)
         
        {
      $.ajax(
                        {
                            url: "AjaxBenificiaryAdding.jsp?id=" + a,
                            success: function(result)
                            {
                                $("#dis").html(result);
                            }
                        });
        }
        </script>
    <body>
        <%
            String Bid="";
            String Aid="";
            
        if(request.getParameter("btnsubmit")!=null)
        { 
         Bid=request.getParameter("Branch");
         Aid=request.getParameter("acounts");
        String ins="insert into tbl_benificiaryadding(branch_id,accounts_id,status,Customer_id)values('"+Bid+"','"+Aid+"','0','"+session.getAttribute("cusid")+"')";
        obj.executeCommand(ins);
        }        
        %>
        <form>
        <table align="center" >
            <tr>
                <td>
                   Select Branch
                </td>
                <td>
                    <select name="Branch" onchange="getaccounts(this.value)">
                         <option>....Select Branch....</option>
                    <%
                    String sel="select * from tbl_branch";
                   ResultSet rs=obj.selectCommand(sel);
                   while(rs.next())
                   {
                       
                  %>
                   <option value="<%=rs.getString("branch_id")%>"><%=rs.getString("branch_name")%></option>
                  
                  <%
                   }
                    %>    
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Accounts
                </td>
                <td>
                    <select name="acounts" id="dis">
                    <option value="sel">........Select..........</option>
                        
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Add Benificiary" name="btnsubmit">     
                </td>
            </tr>
        </table>             
        </form>
        <br><br>
        
        
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
                String selb="select * from tbl_benificiaryadding b inner join tbl_branch br on b.branch_id=br.branch_id inner join tbl_accounts a on b.accounts_id=a.accounts_id inner join tbl_customerdetails cs on a.Customer_id=cs.Customer_id inner join tbl_accounttype aty on a.accounttype_id=aty.accounttype_id where b.Customer_id='"+session.getAttribute("cusid")+"' and b.status=0";
                ResultSet rsc=obj.selectCommand(selb);
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
