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
        <%@include file="Header.jsp" %>
        <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Add Payee</span> For easy fund transfer</h2>
          <br /><br /><br />
        
        
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
        <table align="center" cellpadding="12">
            <tr>
                
                <td>
                    <select name="Branch" onchange="getaccounts(this.value)" style="background-color:#fff; height:50px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                        <option>&nbsp;&nbsp;&nbsp;....Select Branch....</option>
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
                    <select name="acounts" id="dis" style="background-color:#fff; height:50px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                        <option value="sel">&nbsp;&nbsp;&nbsp;........Select..........</option>
                        
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Add Benificiary" name="btnsubmit" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">     
                </td>
            </tr>
        </table>             
        </form>
        <br><br>
        
        
        <form name="frmview">
            <table align="center" cellpadding="8" bgcolor="#fff" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <th>SL.NO</th>
                    <th>ACCOUNT NUMBER</th>
                    <th>ACCOUNT HOLDER NAME</th>
                    <th>EMAIL-ID</th>
                    <th>CONTACT NO</th>
                    
                   
                    
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
                <td align="center"><%=i%></td>
                <td align="center"><%=rsc.getString("accounts_no")%></td>
                <td align="center"><%=rsc.getString("Customer_name")%></td>
                <td align="center"><%=rsc.getString("Customer_email")%></td>
                <td align="center"><%=rsc.getString("Customer_conact")%></td>
                
                  
             </tr>
            <%
            i++;
                 }
            %>
                
            </table>   
        </form>
           
        </div>
      </div>
             <%@include file="Slider.jsp" %>  
    </div>
        </div>
            
             <%@include file="Footer.jsp" %>  
    </body>
</html>
