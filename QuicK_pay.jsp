<%-- 
    Document   : Quic_pay
    Created on : 18 Mar, 2018, 1:09:36 PM
    Author     : HP
--%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
          String ifsc="";
          String branch="";
          String bacc="";
         ddlbalnceid=request.getParameter("ddlaccount");
         // benf=request.getParameter("selben");
            amnt=request.getParameter("txtamt");
            bacc=request.getParameter("txt_acc");
            ifsc=request.getParameter("txt_ifsc");
            branch=request.getParameter("txt_branch");
            
        // Transfer account balance 
            
         String ina="select * from tbl_accounts where accounts_id='"+ddlbalnceid+"'";
         ResultSet rsc=obj.selectCommand(ina);
         if(rsc.next())
         {
          totamt=rsc.getString("accounts_balance");
          //out.println(totamt);
         }
         
         
        if(request.getParameter("btnsubmit")!=null)
        {
         String seld="select * from tbl_accounts where accounts_no='"+bacc+"'";
         ResultSet rscd=obj.selectCommand(seld);
         if(rscd.next())
         {
          benf=rscd.getString("accounts_id");
          //out.println(benf);
         }    
          String selbr="select * from tbl_branch b inner join tbl_customerdetails cu on cu.branch_id=b.branch_id inner join tbl_accounts a on a.Customer_id=cu.Customer_id where b.branch_ifsc='"+ifsc+"' and b.branch_name='"+branch+"' and a.accounts_no='"+bacc+"'";
          ResultSet rsbr=obj.selectCommand(selbr);
          if(rsbr.next())
          {
         dt=request.getParameter("txtdat");  
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
        } 
        %>
        
        <form>
       <table  align="center" cellpadding="7" bgcolor="#FAFAFA" width="45%" style="box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
            <tr align="center">
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
            <tr align="center">
                <td>
                    Branch 
                </td>
                <td>
                    <input type="text" name="txt_branch" value="">
                </td>
            </tr>
            <tr align="center">
                <td>
                    IFSC code
                </td>
                <td>
                    <input type="text" name="txt_ifsc" value="">
                </td>
            </tr>
            <tr align="center">
                <td>
                    Account number
                </td>
                <td>
                    <input type="text" name="txt_acc" value="">
                </td>
            </tr>
            <tr align="center">
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
            <tr align="center">
                <td>
                    Balance Amount:
                </td>
                <td id="dis">
                   
                </td>
            </tr>
             <tr align="center">
                <td>
                    Transfer Amount:
                </td>
                <td>
                    <input type="number" name="txtamt" value="">
                </td>
            </tr>
            <tr align="center">
                    
                    <td colspan="2">
                        <%
                        Date date=new Date();
                        %>
                        <input type="hidden" value="<%=date%>" name="txtdat">
                       
                    </td>
                </tr>
            <tr align="center">
                <td colspan="2" align="center">
                    <input type="submit" name="btnsubmit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" value="Fund Transfer">
                </td>
            </tr>
       </table>
        </form>          
    </body>
</html>
