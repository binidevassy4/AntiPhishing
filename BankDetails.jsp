<%-- 
    Document   : Bank
    Created on : 14 Feb, 2018, 2:14:56 PM
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
        <title>Anti phishing::bank</title>
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
                } else {

                    String ins = "insert into tbl_bank(bank_name,bank_contactno,bank_email,bank_username,bank_password,bank_address,palce_id,pincode)values('" + Bname + "','" + Cno + "','" + Email + "','" + Uname + "','" + Password + "','" + Add + "','" + Place + "','" + Pin + "')";
                    obj.executeCommand(ins);
                }
            }

            if (request.getParameter("did") != null) {

                String del = "delete from tbl_bank where bank_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
            }
        %>

        <div class="fbg">
            <div class="fbg_resize">

                <h2><span>Bank</span> Profile</h2>

            </div>
        </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav">

                    <form id="contact" name="frmbank" onsubmit="return validateFormOnSubmit(this)" action="" method="post">

                        <table align="center" cellspacing="6">
                            <tr>

                                <td align="center"  ><input type="text" name="txtname" value="<%=bnamee%>" placeholder="        Bank Name" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    <input type="hidden" name="hid" value="<%=hhid%>" >
                                </td>
                            </tr>
                            <tr>

                                <td  align="center"><input type="text" name="txtno" value="<%=conoo%>" placeholder="        Contact Number" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                            </tr>
                            <tr>

                                <td align="center"><input type="email" name="txtemail" value="<%=emaill%>" placeholder="        E-mail id" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                            </tr>
                            <tr>

                                <td align="center"><input type="text" name="txtusername" value="<%=usnamee%>" placeholder="        User name" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                            </tr>
                            <tr>
                                
                                <td align="center"><input type="text" name="txtpass" value="<%=passs%>" placeholder="        Password" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                            </tr>
                            <tr >
                                
                                <td align="center"><input type="text" name="txtadd" value="<%=address%>"placeholder="        Address" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                            </tr>
                            <tr >
                                
                                <td align="center">
                                    <select name="selplace" style="background-color:#fff; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
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
                                
                                <td align="center"><input type="text" name="txtpin" value="<%=pinn%>"placeholder="        Pin no" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    <input type="reset" name="btnreset" value="Cancel" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                </td>
                            </tr>

                        </table>
                    </form>
                            <br><br>
                    <form>       
                        <table align="center" bgcolor="#000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                            <tr>
                                <th>SL.NO</th>
                                <th>BRANCH NAME</th>
                                <th>CONTACT NUMBER</th>
                                <th>E-MAIL ID</th>
                                <th>USER NAME</th>
                                <th>PASSWORD</th>
                                <th>ADDRESS</th>
                                <th>PLACE</th>
                                <th>PIN NO</th>                    
                            </tr>

                            <%
                                int i = 0;
                                String sel = "select * from tbl_bank b inner join tbl_place d on b.palce_id=d.palce_id";
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
                                <td align="center"><a href="BankDetails.jsp?did=<%=id%>">Delete</a>
                                    <a href="BankDetails.jsp?editid=<%=id%>">Edit</a></td>
                            </tr>
                            <%
                                }
                            %>                     
                        </table>    
                    </form>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
        <div class="clr"></div>
        <br><br><br><br><br><br><br><br><br><br><br><br> <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        
        <%@include file="Footer.jsp" %>  
    </body>

</html>
