<%-- 
    Document   : IntrestRate
    Created on : 14 Feb, 2018, 2:20:53 PM
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
         <div class="fbg">
            <div class="fbg_resize">

                <h2><span>Interest</span>Details </h2>

            </div>
        </div>
        
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav">   
        
        <form>
            <table align="center">
                <tr>
                    
                    <td> <select name="seltype" style="background-color:#fff; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
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
                   
                    <td><input type="text" name="txtper" value="<%=Inper%>"  placeholder="     Interest Percentage"  size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                     <input type="hidden" name="hid" value="<%=hhid%>" >
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
        <table align="center" cellspacing="12" bgcolor="#000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <th > sl.no</th>
                    <th > Account name</th>
                    <th >interest percentage</th>
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
                    
                    <td align="center"><%=i%></td>
                    <td align="center"><%=rs.getString("accounttype_name")%></td>
                    <td align="center"><%=rs.getString("interstrate_percentage")%></td>
                    <td align="center"><a href="IntrestRate.jsp?did=<%=districtid%>">Delete</a>
                        <a href="IntrestRate.jsp?editid=<%=districtid%>">Edit</a></td>
                    </tr>
                    <%
                        i++;
                    }
                    %>
            </table>
       </form>
                </div>
            </div>
        </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
             <%@include file="Footer.jsp" %>   
    </body>
</html>
