<%-- 
    Document   : IntrestRate
    Created on : 14 Feb, 2018, 2:20:53 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::interstrate</title>
    </head>
    <body>
        <%
            String inid="";
            String ACtype="";
            String Inper="";
            String acctype="";
            String percent="";
            String dd="";
            String hhid="";
             if(request.getParameter("editid")!=null)
            {
                hhid=request.getParameter("editid");
                String sel="select * from tbl_interstrate where interstrate_id='"+request.getParameter("editid")+"'";
                ResultSet rs=obj.selectCommand(sel);
                if(rs.next())
                
                {
                    //inid=rs.getString("interstrate_id");
                    ACtype=rs.getString("accounttype_id");
                    Inper=rs.getString("interstrate_percentage");
                    
                    
                }
            }
             
            if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_interstrate where interstrate_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            }
            
            
            
            
            if(request.getParameter("btnsubmit")!=null)
            {
               acctype=request.getParameter("seltype");
               percent=request.getParameter("txtper");
         
               dd=request.getParameter("hid");
               if(!dd.equals(""))
               {
                    String up="update tbl_interstrate set accounttype_id='"+acctype+"',interstrate_percentage='"+percent+"' where interstrate_id='"+request.getParameter("hid")+"'";
                  boolean b=obj.executeCommand(up);
                
               }else{
           
                String insQry="insert into tbl_interstrate(accounttype_id,interstrate_percentage)values('"+acctype+"','"+percent+"')";
                
                boolean b1=obj.executeCommand(insQry);
               
             
                }
            
            }
        %>
        <h1 align="center">InterstRate</h1>
        
        
        <form>
            <table align="center">
                <tr>
                    <td>Account Type:</td>
                    <td> <select name="seltype">
                            <option>---select Account type---</option> 
                            <%
                            String type="select * from tbl_accounttype";
                            ResultSet rst=obj.selectCommand(type);
                             while(rst.next())
                            {
                                String id=rst.getString("accounttype_id");
                            %>
                            <option <%if(ACtype.equals(id)){%> selected="" <%}%>value="<%=rst.getString("accounttype_id")%>"><%=rst.getString("accounttype_name")%></option>
                            <%
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Interest Percentage</td>
                    <td><input type="text" name="txtper" value="<%=Inper%>"</td>
                     <input type="hidden" name="hid" value="<%=hhid%>" >
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
        <table align="center" border="1">
                <tr>
                    <th> sl.no</th>
                    <th>Account name</th>
                    <th>interest percentage</th>
                </tr>
            <tr>
                <%
                    int i=1;
                    String selQry="select * from tbl_interstrate d inner join tbl_accounttype t on d.accounttype_id=t.accounttype_id";
                    ResultSet rs=obj.selectCommand(selQry);
                    while(rs.next())
                    {
                        String districtid=rs.getString("interstrate_id");
                %>  
                    
                    <td><%=i%></td>
                    <td><%=rs.getString("accounttype_name")%></td>
                    <td><%=rs.getString("interstrate_percentage")%></td>
                    <td><a href="IntrestRate.jsp?did=<%=districtid%>">Delete</a>
                        <a href="IntrestRate.jsp?editid=<%=districtid%>">Edit</a></td>
                    </tr>
                    <%
                        i++;
                    }
                    %>
            </table>
       </form>
    </body>
</html>
