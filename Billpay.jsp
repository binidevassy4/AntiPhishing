<%-- 
    Document   : Billpay
    Created on : 1 Mar, 2018, 2:15:06 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::pay bills</title>
    </head>
    <script>
       function checktype()
       {
          if(document.getElementById('electricity').checked)
          {
              window.location="../Customer/Electricity.jsp";
         
           
            
          }else if(document.getElementById('water').checked){
              window.location="../Customer/water.jsp";
              
          }else if(document.getElementById('telephone').checked){
              window.location="../Customer/Telephone.jsp";
          }
       
       }
    </script>
    <body>
        
       
            <table align="center">
                <tr>
                    <td><input type="radio" value="Electricity" name="payments" id="electricity">Electricity</td>
                
                    <td><input type="radio" value="water" name="payments" id="water">water</td>
               
                    <td><input type="radio" value="Telephone" name="payments" id="telephone">Telephone</td>
                </tr>
                <tr>
                    <td><input type="submit" value="submit" name="submit" onclick="checktype()"></td>
                </tr> 
            </table>  
        
    </body>
</html>


