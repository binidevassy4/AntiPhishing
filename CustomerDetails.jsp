<%-- 
    Document   : CustomerRegistration
    Created on : 14 Feb, 2018, 2:21:59 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishnig::customerDetails</title>
    </head>
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
       String upp="update tbl_customerdetails set Customer_name='"+Name+"',Customer_dob='"+Dob+"',Customer_address='"+Add+"',Customer_nation='"+Nation+"',Customer_panno='"+Panno+"',Customer_conact='"+conno+"',Customer_email='"+Email+"',branch_id='"+session.getAttribute("brid")+"',district_id='"+DistId+"'where Customer_id='"+dd+"'";
        obj.executeCommand(upp);
       }
       else
       {
        String ins="insert into tbl_customerdetails(Customer_name,Customer_dob,Customer_address,Customer_nation,Customer_panno,Customer_conact,Customer_email,branch_id,district_id)values('"+Name+"','"+Dob+"','"+Add+"','"+Nation+"','"+Panno+"','"+conno+"','"+Email+"','"+session.getAttribute("brid")+"','"+DistId+"')";
        obj.executeCommand(ins); 
        }
        }
        
        if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_customerdetails where Customer_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            } 
        
        
        
        %>
        <h1 align="center"> Customer Details</h1>
        
        <form nam="frmcustomerreg">
             <input type="hidden" name="hid" value="<%=hhid%>" >
            <table align="center">
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="txtname" value="<%=name%>" required></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><input type="text" name="txtdob" value="<%=dob%>" required></td>
                </tr>
                <tr>
                    <td>Address :</td>
                    <td><input type="text" name="txtadd" value="<%=add%>" required></td>
                </tr>
                <tr>
                    <td>Nationality :</td>
                    <td><input type="text" name="txtnat" value="<%=nation%>" required></td>
                </tr>
                <tr>
                    <td>Pan no :</td>
                    <td><input type="text" name="txtpan" value="<%=pan%>" required></td>
                </tr>
                <tr>
                    <td>contact no :</td>
                    <td><input type="number" name="txtcon" value="<%=con%>" required></td>
                </tr>
                <tr>
                    <td>Email  :</td>
                    <td><input type="email" name="txtemail" value="<%=email%>" required></td>
                </tr>
                <tr>
                    <td>district  :</td>
                    <td>
                            <select  name="seldist" >
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
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                    </td>
                  </tr>
            </table>
        </form>
        <form>
            <table align="center" border="1">
                <tr>
                    <td>Sl.no</td>
                    <td>Name</td>
                    <td>Date of Birth</td>
                    <td>Address</td>
                    <td>Nationality</td>
                    <td>Pan No</td>
                    <td>Contact No</td>
                    <td>Email</td>
                    <td>District</td>
                </tr>
                
                <%
                int i=1;
                String sel="select * from tbl_customerdetails b inner join tbl_district d on b.district_id=d.district_id where branch_id='"+session.getAttribute("brid")+"'";
                ResultSet rsd=obj.selectCommand(sel);
                while(rsd.next())
                 {
                  String id=rsd.getString("Customer_id");
                  
                 %>
                  <tr>
                    <td><%=i%></td>
                    <td><%=rsd.getString("Customer_name")%></td>
                    <td><%=rsd.getString("Customer_dob")%></td>
                    <td><%=rsd.getString("Customer_address")%></td>
                    <td><%=rsd.getString("Customer_nation")%></td>
                    <td><%=rsd.getString("Customer_panno")%></td>
                    <td><%=rsd.getString("Customer_conact")%></td>
                    <td><%=rsd.getString("Customer_email")%></td>
                    <td><%=rsd.getString("district_name")%></td>
                    <td><a href="CustomerDetails.jsp?did=<%=id%>">Delete</a>
                    <a href="CustomerDetails.jsp?editid=<%=id%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                    }
                    %>
                    
            </table>
        </form>
    </body>
</html>
