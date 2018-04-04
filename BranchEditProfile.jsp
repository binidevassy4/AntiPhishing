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
             
             <div class="fbg">
    <div class="fbg_resize">
      
        <h2><span>Edit </span> Profile</h2>
     
    </div>
 </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav"> 
               
         <form>       
              <table align="center" cellpadding="8" bgcolor="#00000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
              <tr>
                   <th>sl.no</th>
                    <th>Branch name</th>
                    <th>Contact no</th>
                    <th>Email id</th>
                   
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
                    <td align="center"><%=i%></td>
                    <td align="center"><%=rsd.getString("branch_name")%></td>
                    <td align="center"><%=rsd.getString("branch_contactno")%></td>
                    <td align="center"><%=rsd.getString("branch_email")%></td>
                   
                    <td align="center"><%=rsd.getString("branch_address")%></td>
                    <td align="center"><%=rsd.getString("palce_name")%></td>
                    <td align="center"><%=rsd.getString("branch_pin")%></td>
                    <td align="center"><%=rsd.getString("branch_ifsc")%></td>
                    <td>
                    <a href=BranchEditProfile.jsp?editid=<%=id%>">Edit</a></td>
                    </tr>
                    <%  
                    }
                    %>                     
          </table>    
         </form><br><br>
         <form name="frmbranch">
            
            <table align="center" cellpadding="8">
                <tr>
                   
                    <td><input type="text" name="txtname" value="<%=bnamee%>" placeholder="        Branch Name" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                    <input type="hidden" name="hid" value="<%=hhid%>" >
                    </td>
                </tr>
                <tr>
                    
                    <td><input type="text" name="txtno" value="<%=conoo%>" placeholder="        Contact number" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                </tr>
                <tr>
                    
                    <td><input type="email" name="txtemail" value="<%=emaill%>" placeholder="        E-mail id" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                </tr>
               
                <tr>
                    
                    <td><input type="text" name="txtadd" value="<%=address%>" placeholder="       Address" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                </tr>
                <tr>
                   
                            <td>
                                <select name="selplace" style="background-color:#fff; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
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
                   
                    <td><input type="text" name="txtpin" value="<%=pinn%>"  placeholder="       Address" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                </tr>
                <tr>
                   
                    <td><input type="text" name="txtifsc" value="<%=ifscc%>"  placeholder="       Address" size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit"  size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    <input type="reset" name="btnreset" value="Cancel"  size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                    </td>
                  </tr>
                
            </table>
         </form>
                </div>
            </div>
        </div>
         <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                            <%@include file="Footer.jsp" %>     
    </body>

</html>
