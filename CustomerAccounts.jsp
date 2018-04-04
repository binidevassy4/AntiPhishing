<%-- 
    Document   : CustomerAccounts
    Created on : 14 Feb, 2018, 2:31:34 PM
    Author     : HP
--%>
<%@include file="Header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CustomerAccounts::AntiPhishing</title>
    </head>
    <body>
        <% 
        String custnum="";
        String baln="";
        String cust="";
        String acctype="";
        String hhid="";
        String dd="";
        
        String Custno="";
        String Balance="";
        String CustName="";
        String AccType="";
         Custno=request.getParameter("txtno");
        Balance=request.getParameter("txtbal");
        CustName=request.getParameter("selname");
        AccType=request.getParameter("selacc");
       
        
        if(request.getParameter("editid")!=null)
            {
                hhid=request.getParameter("editid");
               
                String sel="select * from tbl_accounts where accounts_id='"+hhid+"' ";
                ResultSet rse=obj.selectCommand(sel);
                while(rse.next())
                
                {
                   custnum=rse.getString("accounts_no");
                   baln=rse.getString("accounts_balance");
                   cust=rse.getString("Customer_id");
                   acctype=rse.getString("accounttype_id"); 
                } 
            }
      
         
        if(request.getParameter("btnsubmit")!=null)
        {
        dd=request.getParameter("hid");
        
         if(!dd.equals(""))
        {
      String upp="update tbl_accounts set accounts_no='"+Custno+"',accounts_balance='"+Balance+"',Customer_id='"+CustName+"',accounttype_id='"+AccType+"' where accounts_id='"+dd+"'";
       obj.executeCommand(upp);
         }
      else
       {
        
        String ins="insert into tbl_accounts(accounts_no,accounts_balance,Customer_id,accounttype_id)values('"+Custno+"','"+Balance+"','"+CustName+"','"+AccType+"')";
        obj.executeCommand(ins); 
        
        }
        
       }
            
    
        
         if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_accounts where accounts_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            } 
        %>
        
        
             <div class="fbg">
    <div class="fbg_resize">
      
        <h2><span>Accounts </span> </h2>
     
    </div>
 </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav">  
        
        <form name="frmaccounts">
            <table align="center" cellpadding="8">
                <input type="hidden" name="hid" value="<%=hhid%>" >
               
                <tr>
                   
                    <td>
                        <input type="number" name="txtno" value="<%=custnum%>" placeholder="        Account Number" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                    </td>
                </tr>
                <tr>
                   
                    <td>
                        <input type="number" name="txtbal" value="<%=baln%>" placeholder="        Balance Amount" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                    </td>
                </tr>
                <tr>
                    
                    <td>
                            <select  name="selname" style="background-color:#fff; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                <option>---select name---</option>
                       <%
                                String dis="select * from tbl_customerdetails  where branch_id='"+session.getAttribute("brid")+"'";
                                ResultSet rsl=obj.selectCommand(dis);
                                while(rsl.next())
                                {
                                    String id=rsl.getString("Customer_id");
                                    %>
                                    <option <% if(cust.equals(id)){%> selected="" <%}%> value="<%=rsl.getString("Customer_id")%>"><%=rsl.getString("Customer_name")%></option>
                                    <%
                                 
                                }
                                
                                %>
                            </select>  </td>
                </tr>
                <tr>
                   
                    <td>
                            <select  name="selacc" style="background-color:#fff; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                <option>---Account Type---</option>
                       <%
                                String acty="select * from tbl_accounttype";
                                ResultSet rsd=obj.selectCommand(acty);
                                while(rsd.next())
                                {
                                    String id=rsd.getString("accounttype_id");
                                    %>
                                    <option <% if(acctype.equals(id)){%> selected="" <%}%> value="<%=rsd.getString("accounttype_id")%>"><%=rsd.getString("accounttype_name")%></option>
                                    <%
                                 
                                }
                                
                                %>
                    
                            </select>  </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit"  size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    <input type="reset" name="btnreset" value="Cancel"  size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                     </td>
                </tr>
            </table>
        </form>
                                <br><br>
        <form>
            <table align="center" cellpadding="8" bgcolor="#00000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <td>Sl no</td>
                    <td>customer id</td>
                    <td>Account number</td>
                    <td>customer name</td>
                    <td>Balance</td>
                    <td>Account type</td>
                </tr>
                <%
                int i=1;
                String sel="select * from tbl_accounts a inner join tbl_accounttype at on a.accounttype_id=at.accounttype_id inner join tbl_customerdetails c on a.Customer_id=c.Customer_id where c.branch_id='"+session.getAttribute("brid")+"'";
                ResultSet rsn=obj.selectCommand(sel);
                while(rsn.next())
                 {
                  String id=rsn.getString("accounts_id");
                 
                %>
                <tr>
                    <td><%=i%></td>
                     <td><%=rsn.getString("Customer_id")%></td>
                    <td><%=rsn.getString("accounts_no")%></td>
                    <td><%=rsn.getString("Customer_name")%></td>
                    <td><%=rsn.getString("accounts_balance")%></td> 
                    <td><%=rsn.getString("accounttype_name")%></td>
                    <td><a href="CustomerAccounts.jsp?did=<%=id%>">Delete</a>
                    <a href="CustomerAccounts.jsp?editid=<%=id%>">Edit</a></td>
                </tr>   
                   <%
                   i++;
                   }
                   %>
                    
                    
                </tr>
            </table>   
            
        </form>
        
           
                   
                   
                            <%@include file="Footer.jsp" %> 
                </div>
            </div>
           </div>
    </body>
</html>
