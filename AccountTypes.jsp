<%-- 
    Document   : AccountTypes
    Created on : 8 Feb, 2018, 10:13:29 AM
    Author     : HP
--%>
<%@include file="Header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>AntiPhishing::AccountTypes</title>
        </head>
        <body>
        <%
            String AccName = "";
            String AccDuration = "";
            String Accminbal = "";
            String AccID = "";
            String AccountId = "";
            String AccountName = "";
            String Accountduration = "";
            String Accountminbal = "";

            if (request.getParameter("editacctid") != null) {
                String sel = "select * from tbl_accounttype where accounttype_id='" + request.getParameter("editacctid") + "'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) {
                    AccountId = rs.getString("accounttype_id");
                    AccountName = rs.getString("accounttype_name");
                    Accountduration = rs.getString("accounttype_duration");
                    Accountminbal = rs.getString("accounttype_minbalance");

                }
            }

            if (request.getParameter("did") != null) {

                String del = "delete from tbl_accounttype where accounttype_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
            }

            if (request.getParameter("btnsubmit") != null) {
                AccName = request.getParameter("txtname");
                AccDuration = request.getParameter("txtduration");
                Accminbal = request.getParameter("txtminbal");

                if (request.getParameter("hid") != "") {
                    String up = "update tbl_accounttype set accounttype_name='" + AccName + "',accounttype_duration='" + AccDuration + "',accounttype_minbalance='" + Accminbal + "' where accounttype_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.executeCommand(up);
                    if (b) {
                        response.sendRedirect("AccountTypes.jsp");
                    } else {
                        out.println(up);
                    }
                } else {

                    String insQry = "insert into tbl_accounttype(accounttype_name,accounttype_duration,accounttype_minbalance)values('" + AccName + "','" + AccDuration + "','" + Accminbal + "')";
                    out.println(insQry);
                    boolean b1 = obj.executeCommand(insQry);
                    if (b1) {
                        response.sendRedirect("AccountTypes.jsp");

                    } else {
                        out.println(insQry);
                    }

                }
            }
        %>

        <div class="fbg">
            <div class="fbg_resize">

                <h2><span>Account</span>Types </h2>

            </div>
        </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav">
                    <form name="frmaccount">
                        <input type="hidden" value="<%=AccountId%>" name="hid"  >
                        <table  align="center" cellspacing="6">
                            <tr>
                               
                                <td><input type="text" value="<%=AccountName%>" name="txtname"  placeholder="     Account Name" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                            </tr>
                            <tr>
                                
                                <td><input type="text" value="<%=Accountduration%>" name="txtduration"  placeholder="   Duration" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                            </tr>
                            <tr>
                                
                                <td><input type="text" value="<%=Accountminbal%>" name="txtminbal"  placeholder="     Minimum balance" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    <input type="reset" name="btnreset" value="Cancel" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                </td>
                            </tr> 
                        </table>
                            <br><br>
                    </form>
                    <table align="center" bgcolor="#000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                        <tr>
                            <th> sl.no</th>
                            <th>Account name</th>
                            <th>Duration</th>
                            <th>Minimum Balance</th>
                        </tr>



                        <%
                            int i = 1;
                            String selQry = "select * from tbl_accounttype";
                            ResultSet rs = obj.selectCommand(selQry);
                            while (rs.next()) {
                                String districtid = rs.getString("accounttype_id");
                        %>  
                        <tr>
                            <td align="center"><%=i%></td>
                            <td align="center"><%=rs.getString("accounttype_name")%></td>
                            <td align="center"><%=rs.getString("accounttype_duration")%></td>
                            <td align="center"><%=rs.getString("accounttype_minbalance")%></td>
                            <td align="center"><a href="AccountTypes.jsp?did=<%=districtid%>">Delete</a>
                                <a href="AccountTypes.jsp?editacctid=<%=districtid%>">Edit</a></td>
                        </tr>
                        <%
                                i++;
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
<br><br><br><br><br><br><br><br><br><br><br><br> <br><br><br><br><br><br><br><br><br><br>
        <%@include file="Footer.jsp" %>  
    </body>
</html>
