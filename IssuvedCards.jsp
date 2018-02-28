<%-- 
    Document   : IssuvedCards
    Created on : 14 Feb, 2018, 3:03:57 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String selac="";
        String seltype="";
        String num="";
        String pin="";
          if(request.getParameter("btnsubmit")!=null)
            {
                selac=request.getParameter("selacc");
                seltype=request.getParameter("seltype");
                num=request.getParameter("txtno");
                pin=request.getParameter("txtpin");
                String ins="insert into tbl_issuedcards(accounts_id,carddetails_id,issuedcards_number,issuedcards_pinnumber,issuedcards_status)values('"+selac+"','"+seltype+"','"+num+"','"+pin+"','issued')";
                obj.executeCommand(ins);
            }
        
        %>
        
        
        <form name="frmcards">
            <table align="center">
                <tr>
                    <td>Customer</td>
                    <td>
                        <select name="selacc">
                            <option>---select customers---</option>
                           <%
                                String acty="select * from tbl_accounts a inner join tbl_customerdetails c on a.Customer_id=c.Customer_id where c.branch_id='"+session.getAttribute("brid")+"'";
                                ResultSet rsd=obj.selectCommand(acty);
                                while(rsd.next())
                                {
                                    String id=rsd.getString("accounts_id");
                                    %>
                                    
                                    <option  value="<%=rsd.getString("accounts_id")%>"><%=rsd.getString("accounts_no")%>   <%=rsd.getString("Customer_name")%></option>
                                  
                                    <%
                                 
                                }
                                
                                %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Cards :</td>
                    <td>
                      <select  name="seltype" >
                                <option>---select card types---</option>
                       <%
                                String dis="select * from tbl_cardtype p inner join tbl_carddetails d on p.cardtype_id=d.cardtype_id";
                                ResultSet rsl=obj.selectCommand(dis);
                                while(rsl.next())
                                {
                                   
                                    %>
                                    <option value="<%=rsl.getString("cardtype_id")%>"><%=rsl.getString("cardtype_name")%>  <%=rsl.getString("carddetails_name")%></option>
                                    <%
                                 
                                }
                                
                                %>
                      </select>
                    </td>
                </tr>
                <tr>
                    <td>Card no :</td>
                    <td><input type="number" name="txtno" ></td>
                </tr>
                <tr>
                    <td>Pin no :</td>
                    <td><input type="number" name="txtpin" ></td>
                </tr>
                <tr><td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                      </td>
                 </tr>
            </table>
        </form>
    </body>
</html>
