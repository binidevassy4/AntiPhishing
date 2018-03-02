<%-- 
    Document   : ViewFundTranssfer
    Created on : 2 Mar, 2018, 6:51:28 PM
    Author     : HP
--%>
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
        <h1 align="center">Fund Transfers</h1>
       
        <table align="center">
            <tr>
                <td>
                   Credit <input type="radio" name="transfer" value="credit" id="credit">
                   Debit <input type="radio" name="transfer" value="debit" id="debit">
                    <input type="submit" name="btnsubmit" value="submit" onclick="checktype()">
                </td>
            </tr>  
        </table>
        
        
    </body>
</html>
