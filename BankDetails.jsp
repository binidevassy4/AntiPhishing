<%-- 
    Document   : Bank
    Created on : 14 Feb, 2018, 2:14:56 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
                  String bnamee="";
                  String conoo="";
                  String emaill="";
                  String usnamee="";
                  String passs="";
                  String address="";
                  String placee="";
                  String pinn="";
                  String hhid="";
                  
        
          if(request.getParameter("editid")!=null)
            {
                 hhid=request.getParameter("editid");
                String sel="select * from tbl_bank where bank_id='"+hhid+"' ";
                ResultSet rse=obj.selectCommand(sel);
                while(rse.next())
                
                {
                   bnamee=rse.getString("bank_name");
                   conoo=rse.getString("bank_contactno");
                   emaill=rse.getString("bank_email");
                   usnamee=rse.getString("bank_username");
                   passs=rse.getString("bank_password");
                   address=rse.getString("bank_address");
                   placee=rse.getString("palce_id");
                   pinn=rse.getString("pincode");
                  
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
   
         dd=request.getParameter("hid");
        if(!dd.equals(""))
       {
       String upp="update tbl_bank set bank_name='"+Bname+"',bank_contactno='"+Cno+"',bank_email='"+Email+"',bank_username='"+Uname+"',bank_password='"+Password+"',bank_address='"+Add+"',palce_id='"+Place+"',pincode='"+Pin+"'where bank_id='"+dd+"'";
        obj.executeCommand(upp);
       }else{
      
         String ins="insert into tbl_bank(bank_name,bank_contactno,bank_email,bank_username,bank_password,bank_address,palce_id,pincode)values('"+Bname+"','"+Cno+"','"+Email+"','"+Uname+"','"+Password+"','"+Add+"','"+Place+"','"+Pin+"')";
        obj.executeCommand(ins); 
        }
       }
          
           if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_bank where bank_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            }
            %>
        
         <h1 align="center">Bank</h1>
         <form name="frmbank">
            
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
                    <td><input type="text" name="txtpass" value="<%=passs%>"></td>
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
                    <td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                    </td>
                  </tr>
                
            </table>
         </form>
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
                </tr>
                
                <%
                int i=0; String sel="select * from tbl_bank b inner join tbl_place d on b.palce_id=d.palce_id";
                    ResultSet rsd=obj.selectCommand(sel);
                    while(rsd.next())
                    {
                     String id=rsd.getString("bank_id");
                     i++;
                 %>
                 
                 
                 <tr>
                    <td><%=i%></td>
                    <td><%=rsd.getString("bank_name")%></td>
                    <td><%=rsd.getString("bank_contactno")%></td>
                    <td><%=rsd.getString("bank_email")%></td>
                    <td><%=rsd.getString("bank_username")%></td>
                    <td><%=rsd.getString("bank_password")%></td>
                    <td><%=rsd.getString("palce_name")%></td>
                    <td><%=rsd.getString("pincode")%></td>
                    <td><a href="BankDetails.jsp?did=<%=id%>">Delete</a>
                    <a href="BankDetails.jsp?editid=<%=id%>">Edit</a></td>
                    </tr>
                    <%  
                    }
                    %>                     
          </table>    
         </form>
             
    </body>
</html>
