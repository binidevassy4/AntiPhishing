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
         <%@include file="Header.jsp" %>
        <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Pay</span> Bills</h2>
          <br /><br /><br />
        
        <form  name="frmpaybill">
            <table align="center" cellpadding="12">
                <tr>
                    
                    <td>
                        <select  name="selcate" required="" style="background-color:#fff; height:50px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" >
                            <option>---Select Bill Category---</option>
                            <%                           String dis = "select * from tbl_billtype";
                                ResultSet rsl = obj.selectCommand(dis);
                                while (rsl.next())
                                {
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
                        <input type="number" value="" name="txtamt" required="" pattern="[0-9]{2,5}"  title="amount shuold below 100000" placeholder="             Enter Bill Amount" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" >
                    </td>
                </tr>
                <tr>
                   
                    <td>
                        <input type="text" name="billno" value="" required="" pattern="[a-z0-9]{6,10}" placeholder="             Enter Bill Number" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" >
                    </td>
                </tr>
                
                <%                    Date date = new Date();
                %>
                <input type="hidden" value="<%=date%>" name="txtdat">
                </tr>
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit"size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" >&nbsp;&nbsp;
                        <input type="reset" name="btnreset" value="Cancel" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" >
                    </td>
                </tr>
            </table>
        </form>
       </div>
      </div>
             <%@include file="Slider.jsp" %>  
    </div>
        </div>
            
             <%@include file="Footer.jsp" %>          
    </body>
</html>
