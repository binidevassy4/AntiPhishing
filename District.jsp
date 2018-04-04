<%-- 
    Document   : District
    Created on : 1 Feb, 2018, 1:59:14 PM
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
        <title>AntiPhishing::District</title>
    </head>
    <body>
                <%
            String DistName="";
            String DistID="";
            String DistrictId="";
            String DistrictName="";
            
            if(request.getParameter("editdistid")!=null)
            {
                String sel="select * from tbl_district where district_id='"+request.getParameter("editdistid")+"'";
                ResultSet rs=obj.selectCommand(sel);
                if(rs.next())
                
                {
                    DistrictId=rs.getString("district_id");
                    DistrictName=rs.getString("district_name");
                }
            }
            
     if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_district where district_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            }
            
            
            
            
            if(request.getParameter("btnsubmit")!=null)
            {
                DistName=request.getParameter("txtdistrict");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_district set district_name='"+DistName+"' where district_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.executeCommand(up);
                  if(b)
                  {
                    response.sendRedirect("District.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
                }else{
                    
                
                String insQry="insert into tbl_district(district_name)values('"+DistName+"')";
                out.println(insQry);
                boolean b1=obj.executeCommand(insQry);
                if(b1)
                {
                    response.sendRedirect("District.jsp");
                    
                }
                else
                {
                    out.println(insQry);
                }
             
                }
            }
            %>
          <div class="fbg">
            <div class="fbg_resize">

                <h2><span>District</span>Details </h2>

            </div>
        </div>
        
        <div class="header">
            <div class="header_resize">
                <div class="menu_nav">   
        <form name="frmDistrict">
                <input type="hidden" value="<%=DistrictId%>" name="hid"  >
                <table align="center" cellspacing="8">
                    <tr>
                        
                        <td><input type="text" value="<%=DistrictName%>" name="txtdistrict" placeholder="      Enter District"  size="40" style="background-color:#fff;height:40px; width:300px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"></td>
                    </tr>
                            <tr><td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit"  size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                    <input type="reset" name="btnreset" value="Cancel"  size="40" style="background-color:#fff;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                                  </td>
                            </tr>
                </table>
            </form>
                    <br><br>
            <table align="center" cellspacing="12" bgcolor="#000" width="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <th> sl.no</th>
                    <th>District</th>
                </tr>
                
                
                
                <%
                    int i=1;
                    String selQry="select * from tbl_district";
                    ResultSet rs=obj.selectCommand(selQry);
                    while(rs.next())
                    {
                        String districtid=rs.getString("district_id");
                %>  
                    <tr>
                    <td align="center"><%=i%></td>
                    <td align="center"><%=rs.getString("district_name")%></td>
                    <td align="center"><a href="District.jsp?did=<%=districtid%>">Delete</a>&nbsp;&nbsp;
                        <a href="District.jsp?editdistid=<%=districtid%>">Edit</a></td>
                    </tr>
                    <%
                        i++;
                    }
                    %>
            </table>
                </div>
            </div>
        </div>
            <br><br> <br><br><br><br><br> <br><br><br><br><br> <br><br><br><br><br> <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <%@include file="Footer.jsp" %>
    </body>
</html>
