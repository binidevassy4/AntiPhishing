<%-- 
    Document   : payments
    Created on : 13 Mar, 2018, 1:36:57 PM
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
        <form  name="frmpaybill">
            <table align="center">
                <tr>
                    <td>Select the bill : </td>
                    <td>
                        <select  name="selcate" >
                            <option>---select category---</option>
                            <%                           String dis = "select * from tbl_billtype";
                                ResultSet rsl = obj.selectCommand(dis);
                                while (rsl.next()) {
                                    String id = rsl.getString("billtype_id");
                            %>
                            <option value="<%=rsl.getString("billtype_id")%>"><%=rsl.getString("billtype_name")%></option>
                            <%

                                }

                            %>  
                    </td>
                </tr>
                <tr>
                    <td>
                        Enter bill Amount :
                    </td>
                    <td>
                        <input type="number" value="" name="txtamt">
                    </td>
                </tr>
                <tr>
                    <td>
                        Enter the Bill number :
                    </td>
                    <td>
                        <input type="text" name="billno" value="" >
                    </td>
                </tr>
                <tr>
                    <td>
                        enter the consumer number :
                    </td>
                    <td>
                        <input type="text" name="cusno" value="">
                    </td>
                </tr>
                <%                    Date date = new Date();
                %>
                <input type="hidden" value="<%=date%>" name="txtdat">
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
