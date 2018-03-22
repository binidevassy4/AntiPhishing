<%-- 
    Document   : Mini_Statement
    Created on : 20 Mar, 2018, 12:07:41 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anti Phishing::Mini Statement</title>
    </head>
    <body>
        <%
        String start="";
        String end="";
        String dis="";
        
        String sdate="";
        String ftype="";
        String amnt="";
       
                              
        if(request.getParameter("btnsubmit")!=null)
                     
        {
             
        start=request.getParameter("txtsart");
        end=request.getParameter("txtend");
        String sel="select * from tbl_fundsdetails fd inner join tbl_transaction t on t.transaction_id=fd.transaction_id where fd.accounts_id='"+session.getAttribute("custid")+"' and  t.transaction_date between '"+start+"' and '"+end+"'";
        ResultSet rs=obj.selectCommand(sel);
        if(rs.next())
        {
           
        
                    
               sdate=rs.getString("transaction_date");
               ftype= rs.getString("fd_type");
               amnt=   rs.getString("td_amount");
                
                out.println(sdate);
                out.println(ftype); 
                out.println(amnt); 
      
        }
        }               
        %>  
        </table>     
        <form>
        <br><br><br><br>
        <table align="center">
            <tr>
                    <td>Account number :

                    </td>
                    <td>

                        <select  name="selacc" >
                            <option>---select account number---</option>
                            <% 
                              dis = "select * from tbl_accounts a inner join tbl_customerdetails s on a.Customer_id=s.Customer_id where a.Customer_id='" + session.getAttribute("cusid") + "'";
                                ResultSet rsl = obj.selectCommand(dis);
                                while (rsl.next()) {
                                    String id = rsl.getString("Customer_id");
                            %>
                            <option  value="<%=rsl.getString("accounts_no")%>"><%=rsl.getString("accounts_no")%></option>
                            <%

                                }

                            %>
                        </select> 
                    </td>
                </tr>
            <tr>
                <td>Enter the start date</td>
                <td><input type="datetime-local" name="txtsart" ></td>
            </tr>
             <tr>
                <td>Enter the end date</td>
                <td><input type="datetime-local" name="txtend" ></td>
            </tr>
            
             <tr>
                    <td> <input type="submit" name="btnsubmit" value="Submit"></td>
                    <td><input type="reset" name="btnreset" value="reset"></td> 
                </tr>
        </table>
        </form>
                        
                        
        
    </body>
</html>
