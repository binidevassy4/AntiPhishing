<%-- 
    Document   : payaction
    Created on : 12 Mar, 2018, 10:37:33 AM
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
        <title>AntiPhishing::pay bills</title>
    </head>
    <body>
        <%
            String amt = "";
            String category = "";
            String billno = "";
            String dt = "";
            String acc = "";
            int cramt;

            if (request.getParameter("btnsubmit") != null)
            {
             session.setAttribute("billtype", request.getParameter("selcate"));
             session.setAttribute("amount",request.getParameter("txtamt"));
             session.setAttribute("bilno",request.getParameter("billno"));
             //session.setAttribute("conno", request.getParameter("cusno"));
             
             response.sendRedirect("../Customer/payment/PaymentMethod.jsp");
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
                        </select>
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
