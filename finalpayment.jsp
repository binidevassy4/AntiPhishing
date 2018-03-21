<%-- 
    Document   : finalpayment
    Created on : 14 Mar, 2018, 8:49:18 PM
    Author     : HP
--%>
<%@page import="db.mailconnection"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anti Phishing :: final payment</title>
    </head>
  <%
            String amt = "";
            String category = "";
            String billno = "";
            String dt = "";
            String acc = "";
            int cramt;

            if (request.getParameter("btnsubmit") != null) {

                String ina = "select * from tbl_accounts where Customer_id='" + session.getAttribute("cusid") + "'";

                ResultSet rsc = obj.selectCommand(ina);
                if (rsc.next()) {
                    acc = rsc.getString("accounts_balance");
                }

                amt = request.getParameter("txtamt");
                category = request.getParameter("selcate");
                billno = request.getParameter("billno");
                dt = request.getParameter("txtdat");

                int acc1 = Integer.parseInt(acc);
                int amt1 = Integer.parseInt(amt);

                String inb = "insert into tbl_paidbills(paidbills_amount,paidbills_number,account_id,billtype_id,paidbill_date)values('" + amt + "','" + billno + "','" + session.getAttribute("cusid") + "','" + category + "','" + dt + "')";
                boolean b = obj.executeCommand(inb);
                if (b == true) {

                    cramt = acc1 - amt1;

                    String upcr = "update tbl_accounts set accounts_balance='" + cramt + "'where Customer_id='" + session.getAttribute("cusid") + "'";
                    obj.executeCommand(upcr);
                }
            }


        %>
    <body>
        <form>
            <table align="center" cellpadding="8" style=" box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                <tr>
                    <td>
                        consumer number :
                    </td>
                    <td>
                        <input type="email" name="txtcon" style="width: 200px" required="">
                    </td>
                </tr>
                <td colspan="2" align="center">
                    <input type="submit" name="submitver" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" value="VERIFY" onclick="redirect()">
                </td>

            </table>

        </form>
    </body>
</html>
