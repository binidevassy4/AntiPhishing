<%-- 
    Document   : KSEB
    Created on : 16 Mar, 2018, 12:59:18 PM
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
            String cus="";
            String amt = "";
            String acb="";
            String acco = "";
            String num = "";
            double cramt=0;
            double acc1=0;
             double amt1=0;
            String dt = "";
            String amnt = "";
            amt = session.getAttribute("billtype").toString();
           acb = session.getAttribute("acc").toString();
            num = session.getAttribute("bilno").toString();
            amnt = session.getAttribute("amount").toString();
            out.println(acb);
            String selac="select * from tbl_accounts where accounts_id='"+session.getAttribute("acc")+"'";    
            ResultSet rsa=obj.selectCommand(selac);
            out.println(selac);
            if(rsa.next())
            {
            acco=rsa.getString("accounts_balance");
            out.println(acco);
            }
            if (request.getParameter("btnsubmit") != null) {
                dt = request.getParameter("txtdat");
                cus= request.getParameter("txtdat");
                acc1=Double.parseDouble(acco);
              
              
               amt1=Double.parseDouble(amnt);
                out.println(dt);
                out.println(amt);
                out.println(acco);
                out.println(num);
                out.println(amnt);
            
                String inbb = "insert into tbl_paidbills(paidbills_amount,paidbills_number,account_id,billtype_id,paidbill_date)values('" + amnt + "','" + num + "','" + acb + "','" + amt + "','" + dt + "')";
                boolean b = obj.executeCommand(inbb);
               // out.println(inbb);
                if (b == true) {
                    
                    

                   cramt = acc1 - amt1;
                     out.println(cramt);
                    String upcr = "update tbl_accounts set accounts_balance='" + cramt + "'where Customer_id='" + session.getAttribute("cusid") + "'";
                    obj.executeCommand(upcr);
                }
            }


        %>

        <table cellpadding="7" align="center" width="100%" height="20%">
            <tr>
                <td></td>
                <td>
                    <img src="../payment/img/kseb.png" width="200" height="100">
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
                 
                
                    <td>
                        <input type="text" name="txtcon" style="width: 200px" required="">

                    </td>



                </tr>

                <tr align="center">
                    <td  colspan="2">
                        <input type="submit" name="btnsubmit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" value="MAKE PAYMENT" >
                    </td>
                </tr> 
            </table>
        </form>
    </body>
</html>
