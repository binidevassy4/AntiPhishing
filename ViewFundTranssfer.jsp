<%-- 
    Document   : ViewFundTranssfer
    Created on : 2 Mar, 2018, 6:51:28 PM
    Author     : HP
--%>
<%@include file="Header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing :: view fund transfer</title>
    </head>
    <script>
       function checktype()
       {
          if(document.getElementById('credit').checked)
          {
              window.location="../Branch/CreditView.jsp";
         
           
            
          }else if(document.getElementById('debit').checked){
              window.location="../Branch/DebitView.jsp";
          }
       
       }
    </script>
    
    <body>
              
             <div class="fbg">
    <div class="fbg_resize">
      
        <h2><span>Fund </span> Transfers</h2>
     
    </div>
 </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav"> 
               
        
       
        <table align="center" bgcolor="#00000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
            <tr>
                <td align="center">
                   Credit <input type="radio" name="transfer" value="credit" id="credit" >
                   Debit <input type="radio" name="transfer" value="debit" id="debit">
                    
                </td>
            </tr>  
            <tr>
                <td>
                    <input type="submit" name="btnsubmit" value="submit" onclick="checktype()">
                </td>
            </tr>
        </table>
                </div>
            </div>
        </div>
        
        <br><br><br><br>
                            <%@include file="Footer.jsp" %> 
    </body>
</html>
