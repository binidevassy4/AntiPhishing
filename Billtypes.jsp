<%-- 
    Document   : Billtypes
    Created on : 7 Feb, 2018, 9:02:56 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::BillTypes</title>
    </head>
     <body>
                <%
            String BillName="";
            String BillId="";
            String BilltypeId="";
            String BilltypeName="";
            
            if(request.getParameter("editbillid")!=null)
            {
                String sel="select * from tbl_billtype where billtype_id='"+request.getParameter("editbillid")+"'";
                ResultSet rs=obj.selectCommand(sel);
                if(rs.next())
                
                {
                    BilltypeId=rs.getString("billtype_id");
                    BilltypeName=rs.getString("billtype_name");
                }
            }
            
     if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_billtype where billtype_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            }
            
            
            
            
            if(request.getParameter("btnsubmit")!=null)
            {
                BillName=request.getParameter("txtbill");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_billtype set Billtype_name='"+BillName+"' where Billtype_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.executeCommand(up);
                  if(b)
                  {
                    response.sendRedirect("Billtypes.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
                }else{
                    
                
                String insQry="insert into tbl_billtype(billtype_name)values('"+ BillName+"')";
                out.println(insQry);
                boolean b1=obj.executeCommand(insQry);
                if(b1)
                {
                    response.sendRedirect("Billtypes.jsp");
                    
                }
                else
                {
                    out.println(insQry);
                }
             
                }
            }
            %>
            
        <form name="frmDistrict">
                <input type="hidden" value="<%=BilltypeId%>" name="hid"  >
                <table align="center">
                    <tr>
                        <td>Bill Ctegories</td>
                        <td><input type="text" value="<%=BilltypeName%>" name="txtbill" placeholder="Enter Bill types"></td>
                    </tr>
                            <tr><td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                                  </td>
                            </tr>
                </table>
            </form>
          
            <table align="center" border="1">
                <tr>
                    <th> sl.no</th>
                    <th>Bills</th>
                </tr>
                
                
                
                <%
                    int i=1;
                    String selQry="select * from tbl_billtype";
                    ResultSet rs=obj.selectCommand(selQry);
                    while(rs.next())
                    {
                        String billtype=rs.getString("billtype_id");
                %>  
                    <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("billtype_name")%></td>
                    <td><a href="Billtypes.jsp?did=<%=billtype%>">Delete</a>
                        <a href="Billtypes.jsp?editbillid=<%=billtype%>">Edit</a></td>
                    </tr>
                    <%
                        i++;
                    }
                    %>
            </table>
    </body>
    </body>
</html>
