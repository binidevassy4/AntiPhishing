<%-- 
    Document   : PaymentMethod
    Created on : 16 Feb, 2018, 8:00:52 PM
    Author     : AkHiLeSh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>AntiPhishing::Payment method</title>
        </head>
        <script>
            function check()
            {
                if (document.getElementById('card').checked)
                {
                    window.location = "../payment/CardPayment.jsp";
                } else if (document.getElementById('netbanking').checked)
                {
                    window.location = "../payment/NetBanking.jsp";
                }
                

        }
        </script>
<body bgcolor="#FAFAFA" >
  <%
  String bitt=session.getAttribute("billtype").toString();
   String amnt=session.getAttribute("amount").toString();
   String billno=session.getAttribute("bilno").toString();
  // String conno=session.getAttribute("conno").toString();
         
        %>
    <br><br><br>
    <table cellpadding="7" align="center" bgcolor="#FAFAFA" width="45%" style="box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">

        

        <tr align="center">
            <td>
                Bill Number &nbsp;&nbsp;:&nbsp;&nbsp; <%=billno%>
            </td>
        </tr>
        <tr align="center">
            <td>
                Bill Amount &nbsp;&nbsp;:&nbsp;&nbsp;<%=amnt%>
            </td>
        </tr>


    </table >
    <br><br>     
    <table align="center"  bgcolor="#FAFAFA"  width="45%" style="box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
        <tr>

            <td align="center">
                <input type="radio" name="method"  id="card">Credit/Debit/ATM Card<br><br>
                <input type="radio" name="method" id="netbanking">Net Banking<br><br>


                <input type="button" name="submit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" value="PAY" onclick="check()">

            </td>
            <td>
                <img src="../payment/img/money.png" width="350" height="200">
            </td>
        </tr>
    </table>
</body>
</html>
