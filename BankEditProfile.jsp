<%-- 
    Document   : EditProfile
    Created on : 22 Feb, 2018, 3:15:06 PM
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
        <title>AntiPhishing::BankEditProfile</title>
    </head>
    <body>
        <%
            String Bid = "";
            String Bname = "";
            String Cno = "";
            String Email = "";
            String Uname = "";
            String Password = "";
            String Add = "";
            String Place = "";
            String Pin = "";
            String dd = "";

            String bnamee = "";
            String conoo = "";
            String emaill = "";
            String usnamee = "";
            String passs = "";
            String address = "";
            String placee = "";
            String pinn = "";
            String hhid = "";

            if (request.getParameter("editid") != null) {
                hhid = request.getParameter("editid");
                String sel = "select * from tbl_bank where bank_id='" + hhid + "' ";
                ResultSet rse = obj.selectCommand(sel);
                while (rse.next()) {
                    bnamee = rse.getString("bank_name");
                    conoo = rse.getString("bank_contactno");
                    emaill = rse.getString("bank_email");
                    usnamee = rse.getString("bank_username");
                    passs = rse.getString("bank_password");
                    address = rse.getString("bank_address");
                    placee = rse.getString("palce_id");
                    pinn = rse.getString("pincode");

                }
            }

            if (request.getParameter("btnsubmit") != null) {

                Bname = request.getParameter("txtname");
                Cno = request.getParameter("txtno");
                Email = request.getParameter("txtemail");
                Uname = request.getParameter("txtusername");
                Password = request.getParameter("txtpass");
                Add = request.getParameter("txtadd");
                Place = request.getParameter("selplace");
                Pin = request.getParameter("txtpin");

                dd = request.getParameter("hid");
                if (!dd.equals("")) {
                    String upp = "update tbl_bank set bank_name='" + Bname + "',bank_contactno='" + Cno + "',bank_email='" + Email + "',bank_username='" + Uname + "',bank_password='" + Password + "',bank_address='" + Add + "',palce_id='" + Place + "',pincode='" + Pin + "'where bank_id='" + dd + "'";
                    obj.executeCommand(upp);
                }

            }
        %>
        
            <div class="fbg">
            <div class="fbg_resize">

                <h2><span>Edit</span> Profile</h2>

            </div>
        </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav">


                        <form>       
                            <table align="center" bgcolor="#000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                                <tr>
                                    <th>sl.no</th>
                                    <th>Branch name</th>
                                    <th>Contact no</th>
                                    <th>Email id</th>
                                    <th>User name</th>
                                    <th>Password</th>
                                    <th>Address</th>
                                    <th>Place</th>
                                    <th>Pin no</th>                    
                                </tr>

                                <%
                                    int i = 0;
                                    String sel = "select * from tbl_bank b inner join tbl_place d on b.palce_id=d.palce_id where bank_id='" + session.getAttribute("bankid") + "'";
                                    ResultSet rsd = obj.selectCommand(sel);
                                    while (rsd.next()) {
                                        String id = rsd.getString("bank_id");
                                        i++;
                                %>


                                <tr>
                                    <td align="center"><%=i%></td>
                                    <td align="center"><%=rsd.getString("bank_name")%></td>
                                    <td align="center"><%=rsd.getString("bank_contactno")%></td>
                                    <td align="center"><%=rsd.getString("bank_email")%></td>
                                    <td align="center"><%=rsd.getString("bank_username")%></td>
                                    <td align="center"><%=rsd.getString("bank_password")%></td>
                                     <td align="center"><%=rsd.getString("bank_address")%></td>
                                    <td align="center"><%=rsd.getString("palce_name")%></td>
                                    <td align="center"><%=rsd.getString("pincode")%></td>
                                    <td><a href="BankEditProfile.jsp?editid=<%=id%>">Edit</a></a>
                                </tr>
                                <%
                                    }
                                %>                     
                            </table>    
                        </form>
                </div>
            </div>
        </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav">
                
                        <form name="frmbank">

                            <table align="center" cellspacing="6">
                                <tr>
                                    
                                    <td><input type="text" name="txtname" value="<%=bnamee%>" placeholder="        branch name" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                        <input type="hidden" name="hid" value="<%=hhid%>" >
                                    </td>
                                </tr>
                                <tr>
                                   
                                    <td><input type="text" name="txtno" value="<%=conoo%>" placeholder="        Contact Number" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr>
                                   
                                    <td><input type="email" name="txtemail" value="<%=emaill%>" placeholder="        Email-id" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr>
                                   
                                    <td><input type="text" name="txtusername" value="<%=usnamee%>" placeholder="        User name" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr>
                                   
                                    <td><input type="text" name="txtpass" value="<%=passs%>" placeholder="        Password" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr>
                                    
                                    <td><input type="text" name="txtadd" value="<%=address%>" placeholder="       Address" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr>
                                    
                                    <td>
                                         <select name="        selplace" style="background-color:#fff; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                            <option>---select place---</option>
                                            <%
                                                String selp = "select * from tbl_place";
                                                ResultSet rsp = obj.selectCommand(selp);
                                                while (rsp.next()) {
                                                    String id = rsp.getString("palce_id");
                                            %>
                                            <option <%if (placee.equals(id)) {%> selected="" <%}%> value="<%=rsp.getString("palce_id")%>"><%=rsp.getString("palce_name")%></option>
                                            <%
                                                }
                                            %>

                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    
                                    <td><input type="text" name="txtpin" value="<%=pinn%>" placeholder="       Address" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="submit" name="btnsubmit" value="Submit" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                        <input type="reset" name="btnreset" value="Cancel" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    </td>
                                </tr>

                            </table>
                        </form>
                    </div>
                </div>
            </div>
                                <br><br><br><br><br><br><br><br><br><br><br><br> <br><br><br><br><br><br><br><br>
                                    <%@include file="Footer.jsp" %>   
    </body>
</html>
