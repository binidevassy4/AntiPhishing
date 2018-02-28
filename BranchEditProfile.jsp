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
        <title>AntiPhishing::Branch Edit Profile</title>
    </head>
    <body>
        <%
        String Bid="";    
        String Bname="";
        String Cno="";
        String Email="";
        String Uname="";
        String Password="";
        String Add="";
        String Place="";
        String Pin="";
        String dd="";
         String Ifsc="";
        
                  String bnamee="";
                  String conoo="";
                  String emaill="";
                  String usnamee="";
                  String passs="";
                  String address="";
                  String placee="";
                  String pinn="";
                  String hhid="";
                 String ifscc="";
                  
        
          if(request.getParameter("editid")!=null)
            {
                 hhid=request.getParameter("editid");
                String sel="select * from tbl_branch where branch_id='"+hhid+"' ";
                ResultSet rse=obj.selectCommand(sel);
                while(rse.next())
                
                {
                   bnamee=rse.getString("branch_name");
                   conoo=rse.getString("branch_contactno");
                   emaill=rse.getString("branch_email");
                   usnamee=rse.getString("branch_username");
                   passs=rse.getString("branch_password");
                   address=rse.getString("branch_address");
                   placee=rse.getString("palce_id");
                   pinn=rse.getString("branch_pin");
                    ifscc=rse.getString("branch_ifsc");
                  
                }
            }
          
          
          
          if(request.getParameter("btnsubmit")!=null)
        {
           
            
        Bname=request.getParameter("txtname");
        Cno=request.getParameter("txtno");
        Email=request.getParameter("txtemail");
        Uname=request.getParameter("txtusername");
        Password=request.getParameter("txtpass");
        Add=request.getParameter("txtadd");
        Place=request.getParameter("selplace");
        Pin=request.getParameter("txtpin");
        Ifsc=request.getParameter("txtifsc");
   
        dd=request.getParameter("hid");
        if(!dd.equals(""))
       {
       String upp="update tbl_branch set branch_name='"+Bname+"',branch_contactno='"+Cno+"',branch_email='"+Email+"',branch_username='"+Uname+"',branch_password='"+Password+"',branch_address='"+Add+"',palce_id='"+Place+"',branch_pin='"+Pin+"',branch_ifsc='"+Ifsc+"' where branch_id='"+dd+"'";
        obj.executeCommand(upp);
       }
       }
          
           
        %>
        
         <h1 align="center">Branch</h1>
         
         <br>       
                
         <form>       
              <table align="center" border="2">
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
                     <th>IFSC Code</th> 
                </tr>
                
                <%
                int i=0;
                String sel="select * from tbl_branch b inner join tbl_place d on b.palce_id=d.palce_id where branch_id='"+session.getAttribute("brid")+"'";
                ResultSet rsd=obj.selectCommand(sel);
                while(rsd.next())
                    {
                     String id=rsd.getString("branch_id");
                     i++;
                 %>
                 
                 
                 <tr>
                    <td><%=i%></td>
                    <td><%=rsd.getString("branch_name")%></td>
                    <td><%=rsd.getString("branch_contactno")%></td>
                    <td><%=rsd.getString("branch_email")%></td>
                    <td><%=rsd.getString("branch_username")%></td>
                    <td><%=rsd.getString("branch_password")%></td>
                    <td><%=rsd.getString("branch_address")%></td>
                    <td><%=rsd.getString("palce_name")%></td>
                    <td><%=rsd.getString("branch_pin")%></td>
                    <td><%=rsd.getString("branch_ifsc")%></td>
                    <td>
                    <a href=BranchEditProfile.jsp?editid=<%=id%>">Edit</a></td>
                    </tr>
                    <%  
                    }
                    %>                     
          </table>    
         </form><br><br>
         <form name="frmbranch">
            
            <table align="center">
                <tr>
                    <td>Branch name:</td>
                    <td><input type="text" name="txtname" value="<%=bnamee%>">
                    <input type="hidden" name="hid" value="<%=hhid%>" >
                    </td>
                </tr>
                <tr>
                    <td>Contact Number:</td>
                    <td><input type="text" name="txtno" value="<%=conoo%>"></td>
                </tr>
                <tr>
                    <td>Email id:</td>
                    <td><input type="email" name="txtemail" value="<%=emaill%>"></td>
                </tr>
                <tr>
                    <td>User name:</td>
                    <td><input type="text" name="txtusername" value="<%=usnamee%>"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="txtpass" value="<%=passs%>"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="txtadd" value="<%=address%>"></td>
                </tr>
                <tr>
                    <td>Place:</td>
                            <td>
                                <select name="selplace">
                                    <option>---select place---</option>
                                    <%
                                        String selp="select * from tbl_place";
                                        ResultSet rsp=obj.selectCommand(selp);
                                        while(rsp.next())
                                        {
                                          String id=rsp.getString("palce_id");   
                                        %>
                                        <option <%if(placee.equals(id)){%> selected="" <%}%> value="<%=rsp.getString("palce_id")%>"><%=rsp.getString("palce_name")%></option>
                                        <%    
                                        }
                                        %>
                                    
                                </select>
                            </td>
                </tr>
                <tr>
                    <td>Pin no:</td>
                    <td><input type="text" name="txtpin" value="<%=pinn%>"></td>
                </tr>
                <tr>
                    <td>IFSC Code:</td>
                    <td><input type="text" name="txtifsc" value="<%=ifscc%>"></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                    </td>
                  </tr>
                
            </table>
         </form>
             
    </body>

</html>
