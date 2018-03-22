<%-- 
    Document   : NetBanking
    Created on : 18 Feb, 2018, 12:38:57 PM
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
        <title>Anti Phishing::net banking</title>
    </head>
    <script>


    </script>
    <body>
        <%

            String password = "";
            String numbr = "";
            String email = "";
            int cno = 0;
            String otpno = "";
            if (request.getParameter("btnsubmit") != null) {

                password = request.getParameter("txtpwd");
                numbr = request.getParameter("selacc");
                String sel =" select * from tbl_customerdetails  c inner join tbl_accounts a on c.Customer_id=a.Customer_id  where c.Customer_id='"+session.getAttribute("cusid")+"'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) {
                    session.setAttribute("acc", rs.getString("accounts_id"));
                    //  response.sendRedirect("../payment/finalpayment.jsp");

                    email = rs.getString("Customer_email");
                }
               // out.println(email);

                String sel1 = "select max(otp_number) as otpno from tbl_otp";
                ResultSet rs11 = obj.selectCommand(sel1);
                if (rs11.next()) {
                    otpno = rs11.getString("otpno");
                    cno = Integer.parseInt(otpno) + 1;
                }
              //  out.println(cno);
                String ino = "insert into tbl_otp(otp_number) values('" + cno + "')";
                boolean b = obj.executeCommand(ino);
                if (b==true) {
                    out.println(email);
                    out.println(cno);
                    String to[] = {email};
                    String subject = "card notification";
                    String content =String.valueOf(cno) ;
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
            alert("chek your Accoount number");
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
            <br><br><br>
            <table align="center" cellpadding="8" style=" box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                <tr>
                    <td colspan="2">


                        <img src="../payment/img/download-png-image-online-banking-png-pic-536.png">
                    </td>
                </tr>



                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="txtpwd" style="width: 200px" required="">
                    </td>
                </tr>
                <tr>
                    <td>Account NUMBER

                    </td>
                    <td>

                        <select  name="selacc" >
                            <option>---select account number---</option>
                            <%                                String dis = "select * from tbl_accounts a inner join tbl_customerdetails s on a.Customer_id=s.Customer_id where a.Customer_id='" + session.getAttribute("cusid") + "'";
                                ResultSet rsl = obj.selectCommand(dis);
                                while (rsl.next()) {
                                    String id = rsl.getString("Customer_id");
                            %>
                            <option  value="<%=rsl.getString("accounts_no")%>"><%=rsl.getString("accounts_no")%></option>
                            <%

                                }

                            %>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" value="Get OTP" onclick="redirect()">
                    </td> 
                </tr>

            </table>
        </form>
        <br>
        <form>              
            <table align="center" cellpadding="8" style=" box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                <tr>
                    <td>Enter the OTP Number </td>
                    <td>
                        <input type="number" name="txtotp" style="width: 200px" required="">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" value="VERIFY" onclick="redirect()">
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>
