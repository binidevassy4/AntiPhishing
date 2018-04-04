<%-- 
    Document   : place
    Created on : 13 Feb, 2018, 8:21:24 AM
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
        <title>AntiPhishing::place</title>
    </head>
    <body>
        <%
            String placeid="";
            String placename="";
            String disname="";
            String PlaceId="";
            String PlaceName="";
            String DistId="";
            String hidd="";
            
            
             if(request.getParameter("editplaceid")!=null)
            {
                
                hidd=request.getParameter("editplaceid") ;
                String sel="select * from tbl_place where palce_id='"+request.getParameter("editplaceid")+"'";
                ResultSet rs=obj.selectCommand(sel);
                if(rs.next())
                
                {
                   PlaceId=rs.getString("palce_id");
                   PlaceName=rs.getString("palce_name");
                   DistId=rs.getString("district_id");
                }
            }
             
          
         if(request.getParameter("btnsubmit")!=null)
            {
            
             placename=request.getParameter("txtplace");
             disname=request.getParameter("seldist");
             
             
             String dd=request.getParameter("hid");
             if(!dd.equals(""))
                {
                    
                 String up="update tbl_place set palce_name='"+placename+"',district_id='"+disname+"' where palce_id='"+request.getParameter("hid")+"'";
                obj.executeCommand(up);
                  
                }else{
             
                String ins="insert into tbl_place(palce_name,district_id)values('"+placename+"','"+disname+"')";
               obj.executeCommand(ins);
                 
               }
                }
         
             
             if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_place where palce_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            }
             
             
        %>
         <div class="fbg">
            <div class="fbg_resize">

                <h2><span>Place</span></h2>

            </div>
        </div>
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav">
        
        
        
        
        <form name="frmplace">
               <input type="hidden"  value="<%=hidd%>" name="hid">
                <table align="center" cellspacing="8">
                    <tr>
                        
                        <td><input type="text"  name="txtplace" value="<%=PlaceName%>" placeholder="      Enter Place " size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">  </tr>
                     
                    
                    <tr>
                       
                        
                        <td>
                            <select  name="seldist" style="background-color:#fff; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                <option>---select district---</option>
                       <%
                                String dis="select * from tbl_district";
                                ResultSet rsl=obj.selectCommand(dis);
                                while(rsl.next())
                                {
                                    String id=rsl.getString("district_id");
                                    %>
                                    <option <% if(DistId.equals(id)){%> selected="" <%}%> value="<%=rsl.getString("district_id")%>"><%=rsl.getString("district_name")%></option>
                                    <%
                                 
                                }
                                
                                %>
                            </select>   
                            
                            
                        </td>
                    </tr>
                            <tr><td colspan="2" >
                                    <input type="submit" name="btnsubmit" value="Submit"  size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    <input type="reset" name="btnreset" value="Cancel"  size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                  </td>
                            </tr>
                </table>
            </form>
                            <br><br>                 
                            
                            
           <table align="center" bgcolor="#000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <th> sl.no</th>
                    <th>Place</th>
                    <th>District</th>
                    
                </tr>
          
                <%
                    int i=1;
                    String selQry="select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
                    ResultSet rs=obj.selectCommand(selQry);
                    while(rs.next())
                    {
                        String districtid=rs.getString("palce_id");
                %>  
                    <tr>
                    <td align="center"><%=i%></td>
                    <td align="center"><%=rs.getString("palce_name")%></td>
                    <td align="center"><%=rs.getString("district_name")%></td>
                    <td align="center"><a href="place.jsp?did=<%=districtid%>">Delete</a>
                    <a href="place.jsp?editplaceid=<%=districtid%>">Edit</a></td>
                    </tr>
                    <%
                        i++;
                    }
                    %>
            </table>
                </div>
            </div>
        </div>
            <br><br><br><br> <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="Footer.jsp" %>  
    </body>
</html>
