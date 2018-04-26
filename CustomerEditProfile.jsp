<%-- 
    Document   : EditProfile
    Created on : 22 Feb, 2018, 3:15:06 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::Customer Edit Profile</title>
    </head>
    <body>
        <body>
        <%
        String Name=""; 
        String Dob="";
        String Add="";
        String Nation="";
        String Panno="";
        String conno="";
        String Email="";
        String DistId="";
       
        
        
        String name="";
        String dob="";
        String add="";
        String nation="";
        String pan="";
        String con="";
        String email="";
        String dist="";
        String hhid="";
        String dd="";
        
        
        
         if(request.getParameter("editid")!=null)
            {
                hhid=request.getParameter("editid");
                String sel="select * from tbl_customerdetails where Customer_id='"+hhid+"' ";
                ResultSet rse=obj.selectCommand(sel);
                while(rse.next())
                
                {
                   name=rse.getString("Customer_name");
                   dob=rse.getString("Customer_dob");
                   add=rse.getString("Customer_address");
                   nation=rse.getString("Customer_nation");
                   pan=rse.getString("Customer_panno");
                   con=rse.getString("Customer_conact");
                   email=rse.getString("Customer_email");
                   
                   dist=rse.getString("district_id");
                  
                }
            }
        
        
        
        if(request.getParameter("btnsubmit")!=null)
        {
        Name=request.getParameter("txtname");
        Dob=request.getParameter("txtdob");
        Add=request.getParameter("txtadd");
        Nation=request.getParameter("txtnat");        
        Panno=request.getParameter("txtpan");        
        conno=request.getParameter("txtcon");
        Email=request.getParameter("txtemail");
        DistId=request.getParameter("seldist");
         
        
        dd=request.getParameter("hid");
        if(!dd.equals(""))
       {
       String upp="update tbl_customerdetails set Customer_name='"+Name+"',Customer_dob='"+Dob+"',Customer_address='"+Add+"',Customer_nation='"+Nation+"',Customer_panno='"+Panno+"',Customer_conact='"+conno+"',Customer_email='"+Email+"',district_id='"+DistId+"'where Customer_id='"+dd+"'";
        obj.executeCommand(upp);
       }
      
        }
        
        
        
        
        
        %>
          <%@include file="Header.jsp" %>
        <div class="content">
            <div class="content_resize">
                <div class="mainbar">
                    <div class="article">
                        <h2><span>Change </span> Your Profile</h2>
                        <br /><br /><br />
        
        
        <form nam="frmcustomerreg">
             <input type="hidden" name="hid" value="<%=hhid%>" >
            <table align="center" cellpadding="10">
                <tr>
                  
                    <td><input type="text" name="txtname" value="<%=name%>" pattern="[a-z A-Z]{8,14}" title="should contain lowercase letters and uppercase letters ,atleast 8 characters" placeholder="             Enter your Name" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" required ></td>
                </tr>
                <tr>
                   
                    <td><input type="text" name="txtdob" value="<%=dob%>"  placeholder="             Date of Birth" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" required></td>
                </tr>
                <tr>
                    
                    <td><input type="text" name="txtadd" value="<%=add%>" pattern="[a-z A-Z]{15,30}" title="should contain lowercase letters and uppercase letters" placeholder="             Enter your Address" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" required></td>
                </tr>
                <tr>
                    
                    <td><input type="text" name="txtnat" value="<%=nation%>" pattern="[a-z A-Z 0-9]{5,8}" title="should contain lowercase letters and uppercase letters and digits" placeholder="             Enter your Nationality" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" required  ></td>
                </tr>
                <tr>
                    
                    <td><input type="text" name="txtpan" value="<%=pan%>" pattern="[0-9a-z]{6}" title="should containts lowercase letters and digits" placeholder="             Enter your Pan no " size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" required></td>
                </tr>
                <tr>
                    
                    <td><input type="number" name="txtcon" value="<%=con%>" pattern="[0-9]{8,10}" title="only containts digits" placeholder="             Enter your contact no" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" required></td>
                </tr>
                <tr>
                   
                    <td><input type="email" name="txtemail" value="<%=email%>"  placeholder="             Enter your Email-id  " size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" required></td>
                </tr>
                <tr>
                    
                    <td>
                        <select  name="seldist" required="" style="background-color:#fff; height:50px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" >
                                <option>---select district---</option>
                       <%
                                String dis="select * from tbl_district";
                                ResultSet rsl=obj.selectCommand(dis);
                                while(rsl.next())
                                {
                                    String id=rsl.getString("district_id");
                                    %>
                                    <option <% if(dist.equals(id)){%> selected="" <%}%> value="<%=rsl.getString("district_id")%>"><%=rsl.getString("district_name")%></option>
                                    <%
                                 
                                }
                                
                                %>
                            </select>  </td>
                </tr>
                <tr>
                    
                <tr>
                    <td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">&nbsp;
                                    <input type="reset" name="btnreset" value="Cancel" size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                    </td>
                  </tr>
            </table>
        </form>
                            <br /><br />
        <form>
            <table align="center" cellpadding="8" bgcolor="#fff" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                   
                    <th>Name</th>
                    <th>DoB</th>
                    <th>Address</th>
                    <th>Nationality</th>
                    <th>Pan No</th>
                    <th>Contact No</th>
                    <th>Email</th>
                     <th>District</th>
                <%
                int i=1;
                String sel="select * from tbl_customerdetails b inner join tbl_district d on b.district_id=d.district_id where Customer_id='"+session.getAttribute("cusid")+"'";
                ResultSet rsd=obj.selectCommand(sel);
                while(rsd.next())
                 {
                  String id=rsd.getString("Customer_id");
                  
                 %>
                  <tr>
                   
                    <td align="center"><%=rsd.getString("Customer_name")%></td>
                    <td align="center"><%=rsd.getString("Customer_dob")%></td>
                    <td align="center"><%=rsd.getString("Customer_address")%></td>
                    <td align="center"><%=rsd.getString("Customer_nation")%></td>
                    <td align="center"><%=rsd.getString("Customer_panno")%></td>
                    <td align="center"><%=rsd.getString("Customer_conact")%></td>
                    <td align="center"><%=rsd.getString("Customer_email")%></td>
                    <td align="center"><%=rsd.getString("district_name")%></td>
                    <td>
                    <a href="CustomerEditProfile.jsp?editid=<%=id%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                    }
                    %>
                    
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
