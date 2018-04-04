<%-- 
    Document   : Cardtype
    Created on : 7 Feb, 2018, 11:24:01 AM
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
        <title>AntiPhishing::CardType</title>
    </head>
    <body>
        <%
            String CardName = "";
            String CardID = "";
            String CardtypeId = "";
            String CardtypeName = "";

            if (request.getParameter("editcardid") != null) {
                String sel = "select * from tbl_cardtype where cardtype_id='" + request.getParameter("editcardid") + "'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) {
                    CardtypeId = rs.getString("cardtype_id");
                    CardtypeName = rs.getString("cardtype_name");
                }
            }

            if (request.getParameter("did") != null) {

                String del = "delete from tbl_cardtype where cardtype_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
            }

            if (request.getParameter("btnsubmit") != null) {
                CardName = request.getParameter("txtcard");
                if (request.getParameter("hid") != "") {
                    String up = "update tbl_cardtype set cardtype_name='" + CardName + "' where cardtype_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.executeCommand(up);
                    if (b) {
                        response.sendRedirect("Cardtype.jsp");
                    } else {
                        out.println(up);
                    }
                } else {

                    String insQry = "insert into tbl_cardtype(cardtype_name)values('" + CardName + "')";
                    out.println(insQry);
                    boolean b1 = obj.executeCommand(insQry);
                    if (b1) {
                        response.sendRedirect("Cardtype.jsp");

                    } else {
                        out.println(insQry);
                    }

                }
            }
        %>
        <div class="fbg">
            <div class="fbg_resize">

                <h2><span>Card</span>Types </h2>

            </div>
        </div>

        <div class="header">
            <div class="header_resize">
                <div class="menu_nav">   
                    <form name="frmDistrict">
                        <input type="hidden" value="<%=CardtypeId%>" name="hid"  >
                        <table align="center" cellspacing="8">
                            <tr>
                               
                                <td><input type="text" value="<%=CardtypeName%>" name="txtcard" placeholder="       Enter card name"  size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                            </tr>
                            <tr><td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    <input type="reset" name="btnreset" value="Cancel" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                </td>
                            </tr>
                        </table>
                    </form>
                            <br><br><br>
                    <table align="center"  cellspacing="12" bgcolor="#000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                        <tr>
                            <th> sl.no</th>
                            <th>Card type</th>
                        </tr>



                        <%
                            int i = 1;
                            String selQry = "select * from tbl_cardtype";
                            ResultSet rs = obj.selectCommand(selQry);
                            while (rs.next()) {
                                String cardtypeid = rs.getString("cardtype_id");
                        %>  
                        <tr>
                            <td align="center"><%=i%></td>
                            <td align="center"><%=rs.getString("cardtype_name")%></td>
                            <td align="center"><a href="Cardtype.jsp?did=<%=cardtypeid%>">Delete</a>
                                <a href="Cardtype.jsp?editcardid=<%=cardtypeid%>">Edit</a></td>
                        </tr>
                        <%
                                i++;
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br> <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="Footer.jsp" %>       
    </body>
</html>
