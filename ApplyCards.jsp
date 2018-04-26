<%-- 
    Document   : ApplyCards
    Created on : 21 Feb, 2018, 2:47:48 PM
    Author     : HP
--%>


<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::applycards</title>
    </head>
    <body>
        <%
        String acno="";
        String crdt="";
        String Dat="";
        String accnum="";
         if(request.getParameter("btnsubmit")!=null)
             
         {
            acno=request.getParameter("selacc");
            crdt=request.getParameter("seltype");
            Dat=request.getParameter("txtdat");
           
         String sel1="select * from tbl_issuedcards where accounts_id='"+acno+"'";
         System.out.println(sel1);
         ResultSet rsc=obj.selectCommand(sel1); 
         if(rsc.next())
         { 
          %>
                <script>
                   alert("Card already issued");</script>
                <%
             
         } 
         else
         {
          
            String ins="insert into tbl_cardapplications(accounts_id,carddetails_id,status,card_date)values('"+acno+"','"+crdt+"','0','"+Dat+"')";
            System.out.println(ins);
            boolean b=obj.executeCommand(ins);
            if(b==true)
        {
            response.sendRedirect("customer_home.jsp");
        }
            }
           
         }
        %>
                <%@include file="Header.jsp" %>
        <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Apply</span> Cards</h2>
          <br /><br /><br />
        
        <form>
            <table align="center" cellpadding="12">
                <tr>
                  
                    <td>
                       <select name="selacc" style="background-color:#fff; height:50px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                            <option>---select Account number---</option>
                           <%
                                String acty="select * from tbl_accounts where Customer_id='"+session.getAttribute("cusid")+"'";
                                ResultSet rsd=obj.selectCommand(acty);
                                while(rsd.next())
                                {
                                    String id=rsd.getString("accounts_id");
                                    %>
                                    
                                    <option  value="<%=rsd.getString("accounts_id")%>"><%=rsd.getString("accounts_no")%></option>
                                  
                                    <%
                                 
                                }
                                
                                %>
                        </select>
                    </td>
                </tr>
               <tr>
                   
                    <td>
                      <select  name="seltype" style="background-color:#fff; height:50px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" >
                                <option>---select card types---</option>
                       <%
                                String dis="select * from tbl_cardtype p inner join tbl_carddetails d on p.cardtype_id=d.cardtype_id";
                                ResultSet rsl=obj.selectCommand(dis);
                                while(rsl.next())
                                {
                                   
                                    %>
                                    <option value="<%=rsl.getString("carddetails_id")%>"><%=rsl.getString("cardtype_name")%>  <%=rsl.getString("carddetails_name")%></option>
                                    <%
                                 
                                }
                                
                                %>
                      </select>
                    </td>
                </tr>
                <tr>
                    
                    <td>
                        <%
                        Date date=new Date();
                        %>
                        <input type="hidden" value="<%=date%>" name="txtdat">
                       
                    </td>
                </tr>
                <tr><td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Apply now" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    
                      </td>
                 </tr>
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
