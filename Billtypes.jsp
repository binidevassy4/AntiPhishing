<%-- 
    Document   : Billtypes
    Created on : 7 Feb, 2018, 9:02:56 PM
    Author     : HP
--%>
<%@include file="Header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::BillTypes</title>
    </head>
    <body>
        <%
            String BillName = "";
            String BillId = "";
            String BilltypeId = "";
            String BilltypeName = "";

            if (request.getParameter("editbillid") != null) {
                String sel = "select * from tbl_billtype where billtype_id='" + request.getParameter("editbillid") + "'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) {
                    BilltypeId = rs.getString("billtype_id");
                    BilltypeName = rs.getString("billtype_name");
                }
            }

            if (request.getParameter("did") != null) {

                String del = "delete from tbl_billtype where billtype_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
            }

            if (request.getParameter("btnsubmit") != null) {
                BillName = request.getParameter("txtbill");
                if (request.getParameter("hid") != "") {
                    String up = "update tbl_billtype set Billtype_name='" + BillName + "' where Billtype_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.executeCommand(up);
                    if (b) {
                        response.sendRedirect("Billtypes.jsp");
                    } else {
                        out.println(up);
                    }
                } else {

                    String insQry = "insert into tbl_billtype(billtype_name)values('" + BillName + "')";
                    out.println(insQry);
                    boolean b1 = obj.executeCommand(insQry);
                    if (b1) {
                        response.sendRedirect("Billtypes.jsp");

                    } else {
                        out.println(insQry);
                    }

                }
            }
        %>
       
             <div class="fbg">
    <div class="fbg_resize">
      
        <h2><span>Bill</span> Types</h2>
     
    </div>
 </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav"> 
                        <form name="frmDistrict">
                            <input type="hidden" value="<%=BilltypeId%>" name="hid"  >
                            <table align="center">
                                <tr>
                                    
                                    <td><input type="text" value="<%=BilltypeName%>" name="txtbill" placeholder="       Enter Bill types"  size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr><td colspan="2" align="center">
                                        <input type="submit" name="btnsubmit" value="Submit" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                        <input type="reset" name="btnreset" value="Cancel" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    </td>
                                </tr>
                            </table>
                        </form>
                                <br>
                        <table align="center" bgcolor="#000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                            <tr>
                                <th><b> SL.NO</b></th>
                                <th><b>BILLS</b></th>
                            </tr>



                            <%
                                int i = 1;
                                String selQry = "select * from tbl_billtype";
                                ResultSet rs = obj.selectCommand(selQry);
                                while (rs.next()) {
                                    String billtype = rs.getString("billtype_id");
                            %>  
                            <tr>
                                <td align="center"><%=i%></td>
                                <td align="center"><%=rs.getString("billtype_name")%></td>
                                <td align="center"><a href="Billtypes.jsp?did=<%=billtype%>">Delete</a>
                                    <a href="Billtypes.jsp?editbillid=<%=billtype%>">Edit</a></td>
                            </tr>
                            <%
                                    i++;
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
                        <br><br><br><br><br><br><br><br><br><br><br><br>
                            <%@include file="Footer.jsp" %>   
                </body>

                </html>
