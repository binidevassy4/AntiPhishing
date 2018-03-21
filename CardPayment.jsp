<%-- 
    Document   : CardPayment
    Created on : 16 Feb, 2018, 8:04:23 PM
    Author     : AkHiLeSh
--%>
<%@page import="db.mailconnection"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anti Phising::card payment</title>
    </head>
    
    <body>
        <%
        
            
            String email = "";
            int cno = 0;
            String otpno = "";
            String card="";
            String pin="";
            String name="";
            
             if (request.getParameter("btnsubmit") != null) {

                card = request.getParameter("txt_cardno");
                pin = request.getParameter("txt_pin");
                name=request.getParameter("txt_name");
                String sel = "select * from tbl_issuedcards i inner join tbl_accounts a on i.accounts_id=a.accounts_id inner join tbl_customerdetails cu on cu.Customer_id=a.Customer_id where i.issuedcards_number='"+card+"' and i.issuedcards_pinnumber='"+pin+"' and cu.Customer_id='"+session.getAttribute("cusid")+"' ";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) {
                    session.setAttribute("acc", rs.getString("accounts_id"));
                    //  response.sendRedirect("../payment/finalpayment.jsp");

                    email = rs.getString("Customer_email");
                }
                //out.println(email);

                String sel1 = "select max(otp_number) as otpno from tbl_otp";
                ResultSet rs11 = obj.selectCommand(sel1);
                if (rs11.next()) {
                    otpno = rs11.getString("otpno");
                    cno = Integer.parseInt(otpno) + 1;
                }
                //out.println(cno);
                String ino = "insert into tbl_otp(otp_number) values('" + cno + "')";
                boolean b = obj.executeCommand(ino);
                if (b) {
                  //  out.println(email);
                   // out.println(cno);
                    String to[] = {email};
                    String subject = "card notification";
                    String content =String.valueOf(cno);
//                 mailconnection mc=new mailconnection();
                    boolean bb = mailconnection.sendMail(to, subject, content);
                    System.out.println(email + "email");
                    System.out.println(to[0] + "to");
                    System.out.println(subject + "subject");
                    System.out.println(content + "content");
                    if (bb) {
        %>
        <script>
            alert("Mail Send");
        </script>
        <%
            }

        } else {

        %>
        <script>
            alert("chek your Card number or pin number");
        </script>
        <%                }

            }
            
         String eopt = "";
            String bill="";
            bill=session.getAttribute("billtype").toString();
            int billt=0;
            if (request.getParameter("submit") != null) {

                eopt = request.getParameter("txtotp");
                String sel2 = "select * from tbl_otp where otp_number='" + eopt + "'";
                ResultSet rs2 = obj.selectCommand(sel2);
                if (rs2.next()) {
                    billt=Integer.parseInt(bill);
                    if(billt==5)
                    {
                        response.sendRedirect("WATER.jsp");
                    }else if(billt==6)
                    {
                    response.sendRedirect("KSEB.jsp");
                    
                    }else{
                    response.sendRedirect("BSNL.jsp");
                    }
                    

                } else {
        %>
        <script>
            alert("chek OTP number");
        </script>
        <%
                }

            }


        %>
        
        
        <form>
        <table align="center">
            <tr>
                <td>
                    <img src="../payment/img/cards.png" >
                </td>
            </tr>
        </table>
        <table align="center">
            <tr align="center">

                <td> 
                    <input type="date" name="date" style="width: 50%;padding: 12px 20px; margin: 8px 0;
                           box-sizing: border-box;border-radius: 5px; background-image: url('../payment/icon/calendar.png'); background-position: 2px 2px; background-repeat: no-repeat;">
                    <input type="text" name="txt_cvv" placeholder="CVV" style="width: 20%;padding: 12px 20px; margin: 8px 0;
                           box-sizing: border-box;border-radius: 5px; background-position: 2px 2px; background-repeat: no-repeat;"><br>
                    <input type="text" name="txt_pin" placeholder="Enter pin" style="width: 70%;padding: 12px 20px; margin: 8px 0;
                           box-sizing: border-box;border-radius: 5px; background-image: url('../payment/icon/at.png'); background-position: 2px 2px; background-repeat: no-repeat;">
                </td>
                <td>
                    <input type="text" name="txt_name" placeholder="Enter hard holder name" style="width: 100%;padding: 12px 20px; margin: 8px 0;
                           box-sizing: border-box;border-radius: 5px; background-image: url('../payment/icon/add-contact(1).png'); background-position: 2px 2px; background-repeat: no-repeat;"><br>

                    <input type="text" name="txt_cardno" placeholder="Enter Card Number" style="width: 100%;padding: 12px 20px; margin: 8px 0;
                           box-sizing: border-box;border-radius: 5px; background-image: url('../payment/icon/credit-card.png'); background-position: 2px 2px; background-repeat: no-repeat;"><br>
                </td>
            </tr> 
            <tr align="center">
                <td colspan="2" align="center">
                    <input type="submit" name="btnsubmit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" value="GET OTP">
                </td>
            </tr>
        </table>
        </form>
        
         <br>
        <form>              
            <table align="center" cellpadding="8" >
                <tr>
                    
                    <td>
                        <input type="number" name="txtotp"placeholder="Enter Card Number" style="width: 100%;padding: 12px 20px; margin: 8px 0;
                           box-sizing: border-box;border-radius: 5px; background-image: url('../payment/icon/credit-card.png'); background-position: 2px 2px; background-repeat: no-repeat;">
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" value="VERIFY" onclick="redirect()">
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>
