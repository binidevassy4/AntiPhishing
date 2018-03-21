<%-- 
    Document   : CustomerAccounts
    Created on : 14 Feb, 2018, 2:31:34 PM
    Author     : HP
--%>

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
        
        
        <h1 align="center">Accounts</h1>
        <form name="frmaccounts">
            <table align="center">
                <input type="hidden" name="hid" value="<%=hhid%>" >
               
                <tr>
                    <td>
                        Account Number:
                    </td>
                    <td>
                        <input type="number" name="txtno" value="<%=custnum%>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Balance Amount:
                    </td>
                    <td>
                        <input type="number" name="txtbal" value="<%=baln%>">
                    </td>
                </tr>
                <tr>
                    <td>Customer name  :</td>
                    <td>
                            <select  name="selname" >
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
                    <td>Account Type :</td>
                    <td>
                            <select  name="selacc" >
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
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                     </td>
                </tr>
            </table>
        </form>
        <form>
            <table align="center" border="2">
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
    </body>
</html>
