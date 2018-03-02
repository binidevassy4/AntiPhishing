<%-- 
    Document   : FundTransfer
    Created on : 22 Feb, 2018, 6:40:43 PM
    Author     : AkHiLeSh
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing :: Fund Transfer</title>
        <script src="jquery.js" type="text/javascript"></script>
        <script>
         function getbalance(a)
         
        {
      $.ajax(
                        {
                            url: "Ajax_fundtransferBalance.jsp?id=" + a,
                            success: function(result)
                            {
                                $("#dis").html(result);
                            }
                        });
        }
        </script>
    </head>
    <body>
        <form>
        <%
         String trnsno="";
         String dt="";
          String transid="";
         String  ddlbalnceid="";
          String amnt="";
          String benf="";
          String totamt="";
          int crbanceamt=0;
          int brbanceamt=0;
          
         ddlbalnceid=request.getParameter("ddlaccount");
          benf=request.getParameter("selben");
            amnt=request.getParameter("txtamt");
        // Transfer account balance 
         
         String ina="select * from tbl_accounts where accounts_id='"+ddlbalnceid+"'";
         ResultSet rsc=obj.selectCommand(ina);
         if(rsc.next())
         {
          totamt=rsc.getString("accounts_balance");
         }
         
         
        if(request.getParameter("btnsubmit")!=null)
        {
            
        trnsno=request.getParameter("txtno");
        dt=request.getParameter("txtdat");
      // insert details to tbl_transcation  
        String in="insert into tbl_transaction(transaction_no,transaction_date)values('"+trnsno+"','"+dt+"')";
        boolean b= obj.executeCommand(in);
        if(b==true)
        {
      // get maximum of transcation id for tbl_fundsdetails
        String selt="select max(transaction_id) as transid from tbl_transaction";
        ResultSet rss=obj.selectCommand(selt);
        if(rss.next())
        {
          transid=rss.getString("transid");
          
         // insert details of cr to tbl_fundsdetails
        crbanceamt=Integer.parseInt(totamt)-Integer.parseInt(amnt);
        String inf="insert into tbl_fundsdetails(transaction_id,td_amount,ac_balanace,accounts_id,fd_type)values('"+transid+"','"+amnt+"','"+crbanceamt+"','"+ddlbalnceid+"','credit')";
       boolean bb=obj.executeCommand(inf);
        if(bb==true)
        {
           // update balance amount in tbl_accounts  
            
            String upcr="update tbl_accounts set accounts_balance='"+crbanceamt+"'where accounts_id='"+ddlbalnceid+"'";
            obj.executeCommand(upcr);
                 
        }
        // insert details of dr to tbl_fundsdetails
         brbanceamt=Integer.parseInt(totamt)+Integer.parseInt(amnt);
         String inb="insert into tbl_fundsdetails(transaction_id,td_amount,ac_balanace,accounts_id,fd_type)values('"+transid+"','"+amnt+"','"+brbanceamt+"','"+benf+"','debit')";
       boolean ib=obj.executeCommand(inb);
        if(ib==true)
        {
            
           // update balance amount in tbl_accounts
          String upbr="update tbl_accounts set accounts_balance='"+brbanceamt+"'where accounts_id='"+benf+"'";
            obj.executeCommand(upbr);  
            
        }
         %>
         <script>alert("successflly Transfered");</script>
        <%
        }
         
        }
        
        }
        
        %>
        <table border="1" align="center">
            <tr>
                <td>
                    Transaction no:
                </td>
                <td>
                    <%
                    // For getting automatic transaction no::
                      int trnsctionno=0;  
                      String trs="";
                    String sel="select max(transaction_no)as trnsctionno from tbl_transaction";
                    ResultSet rs=obj.selectCommand(sel);
                    if(rs.next())
                    {
                       trs=rs.getString("trnsctionno");
                     trnsctionno=Integer.parseInt(trs)+1;
                   %>
                   
                   
                    
                    <label  id="<%=trnsctionno%>"><%=trnsctionno%></label>
                    
                   
                    <%
                    }
                    
                    %>
                    <input type="hidden" name="txtno" value="<%=trnsctionno%>">
                </td>
               
            </tr>   
            <tr>
                <td>
                Select your account:
                </td>
                <td>
                    <select name="ddlaccount"  onchange="getbalance(this.value)">
                        <option >...Select...</option>
                    <%
                    String sel1="select * from tbl_accounts a inner join tbl_accounttype ac on a.accounttype_id=ac.accounttype_id where Customer_id='"+session.getAttribute("cusid")+"'";
                    ResultSet rs1=obj.selectCommand(sel1);
                 while(rs1.next())
                    {
                       
                    %>
                    
                    <option value="<%=rs1.getString("accounts_id")%>"> <%=rs1.getString("accounts_no")%> <%=rs1.getString("accounttype_name")%></option>
                    <%
                    
                    }
                    %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Balance Amount:
                </td>
                <td id="dis">
                   
                </td>
            </tr>
            <tr>
                <td> Benificiary account : </td>
                <td>
           
            <select name="selben">
                <option>...select...</option>
                <%
                String ben="select * from tbl_benificiaryadding br inner join tbl_accounts a on a.accounts_id=br.accounts_id inner join tbl_customerdetails cs on cs.Customer_id=a.Customer_id where br.Customer_id='"+session.getAttribute("cusid")+"' and br.status='1'";
                ResultSet rss=obj.selectCommand(ben);
                 while(rss.next())
                    {
                       
                    %>
                    
                    <option value="<%=rss.getString("accounts_id")%>"> <%=rss.getString("accounts_no")%> <%=rss.getString("Customer_name")%></option>
                    <%
                    
                    }
                    %>
                <option></option>
            </select>
                </td>
            </tr>
            <tr>
                <td>
                    Transfer Amount:
                </td>
                <td>
                    <input type="number" name="txtamt" value="">
                </td>
            </tr>
            <tr>
                    
                    <td colspan="2">
                        <%
                        Date date=new Date();
                        %>
                        <input type="hidden" value="<%=date%>" name="txtdat">
                       
                    </td>
                </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="fund transfer" name="btnsubmit" >     
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
