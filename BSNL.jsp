<%-- 
    Document   : BSNL
    Created on : 18 Mar, 2018, 9:18:53 AM
    Author     : HP
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String amt = "";
            String acco = "";
            String num = "";
            int cramt;
            String dt = "";
            String amnt = "";
            amt = session.getAttribute("billtype").toString();
            acco = session.getAttribute("acc").toString();
            num = session.getAttribute("bilno").toString();
            amnt = session.getAttribute("amount").toString();

            
            if (request.getParameter("btnsubmit") != null) {
                dt = request.getParameter("txtdat");
                int acc1 = Integer.parseInt(acco);
                int amt1 = Integer.parseInt(amnt);
                out.println(dt);
                out.println(amt);
                out.println(acco);
                out.println(num);
                out.println(amnt);
            
                String inbb = "insert into tbl_paidbills(paidbills_amount,paidbills_number,account_id,billtype_id,paidbill_date)values('" + amnt + "','" + num + "','" + acco + "','" + amt + "','" + dt + "')";
                boolean b = obj.executeCommand(inbb);
                if (b == true) {

                    cramt = acc1 - amt1;
                      
                    String upcr = "update tbl_accounts set accounts_balance='" + cramt + "'where Customer_id='" + session.getAttribute("cusid") + "'";
                    obj.executeCommand(upcr);
                }
            }


        %>

        <table cellpadding="7" align="center" width="100%" height="20%">
            <tr>
                <td></td>
                <td>
                    <h3>
                        BSNL
                    </h3>
                    
                    <img src="" width="200" height="100">
                    Web well fair service
                </td>

            </tr>
        </table>
        <hr>

        <form>
            <table cellpadding="7" align="center" bgcolor="#FAFAFA" width="45%" style="box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <%   Date date = new Date();
                    %>
                <input type="hidden" value="<%=date%>" name="txtdat">
                <td>
                    Enter the Consumer Number :
                </td>
                </tr> 
                <tr>
                    <td>
                        <input type="text" name="txtcon" style="width: 200px" required="">

                    </td>



                </tr>

                <tr align="center">
                    <td colspan="2">
                        <input type="submit" name="btnsubmit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" value="MAKE PAYMENT" >
                    </td>
                </tr> 
            </table>
        </form>
    </body>
</html>
