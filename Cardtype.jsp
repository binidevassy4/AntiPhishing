<%-- 
    Document   : Cardtype
    Created on : 7 Feb, 2018, 11:24:01 AM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::CardType</title>
    </head>
     <body>
                <%
            String CardName="";
            String CardID="";
            String CardtypeId="";
            String CardtypeName="";
            
            if(request.getParameter("editcardid")!=null)
            {
                String sel="select * from tbl_cardtype where cardtype_id='"+request.getParameter("editcardid")+"'";
                ResultSet rs=obj.selectCommand(sel);
                if(rs.next())
                
                {
                    CardtypeId=rs.getString("cardtype_id");
                    CardtypeName=rs.getString("cardtype_name");
                }
            }
            
     if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_cardtype where cardtype_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            }
            
            
            
            
            if(request.getParameter("btnsubmit")!=null)
            {
                CardName=request.getParameter("txtcard");
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_cardtype set cardtype_name='"+CardName+"' where cardtype_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.executeCommand(up);
                  if(b)
                  {
                    response.sendRedirect("Cardtype.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
                }else{
                    
                
                String insQry="insert into tbl_cardtype(cardtype_name)values('"+CardName+"')";
                out.println(insQry);
                boolean b1=obj.executeCommand(insQry);
                if(b1)
                {
                    response.sendRedirect("Cardtype.jsp");
                    
                }
                else
                {
                    out.println(insQry);
                }
             
                }
            }
            %>
            
        <form name="frmDistrict">
                <input type="hidden" value="<%=CardtypeId%>" name="hid"  >
                <table align="center">
                    <tr>
                        <td>Card type Name</td>
                        <td><input type="text" value="<%=CardtypeName%>" name="txtcard" placeholder="Enter card name"></td>
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
                    <th>Card type</th>
                </tr>
                
                
                
                <%
                    int i=1;
                    String selQry="select * from tbl_cardtype";
                    ResultSet rs=obj.selectCommand(selQry);
                    while(rs.next())
                    {
                        String cardtypeid=rs.getString("cardtype_id");
                %>  
                    <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("cardtype_name")%></td>
                    <td><a href="Cardtype.jsp?did=<%=cardtypeid%>">Delete</a>
                        <a href="Cardtype.jsp?editcardid=<%=cardtypeid%>">Edit</a></td>
                    </tr>
                    <%
                        i++;
                    }
                    %>
            </table>
    </body>
</html>
