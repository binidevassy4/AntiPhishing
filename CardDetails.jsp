<%-- 
    Document   : CardDetails
    Created on : 14 Feb, 2018, 9:33:15 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::CardDetails</title>
    </head>
    <body>
         <%
        
         if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_carddetails where carddetails_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            }
        String Cardid="";
         String Cardname="";
         String Cardtype="";
         String Cardwith="";
         String Cardpur="";
         String ee="";
        
        if(request.getParameter("editid")!=null)
        {
           ee=request.getParameter("editid") ;
         String Sel="select * from tbl_carddetails where carddetails_id='"+request.getParameter("editid")+"'";
         ResultSet rs=obj.selectCommand(Sel);
         if(rs.next())
         {
         Cardid=rs.getString("carddetails_id");
         Cardname=rs.getString("carddetails_name");
         Cardtype=rs.getString("cardtype_id"); 
         Cardwith=rs.getString("carddetails_withdrawlimit"); 
         Cardpur=rs.getString("carddetails_purchaselimit");
         }
        }
        String cardid1="";
        String cardname1="";
        String typeid1="";
        String withdraw1="";
        String purchase1="";
        
         if(request.getParameter("btnsubmit")!=null)
        {
        cardname1=request.getParameter("txtname");
        typeid1=request.getParameter("seltype");
        withdraw1=request.getParameter("txtwithdraw");
        purchase1=request.getParameter("txtpurchase");
        
        String dd=request.getParameter("hid");
       if(!dd.equals(""))
             {
                String up="update tbl_carddetails set carddetails_name='"+cardname1+"',cardtype_id='"+typeid1+"',carddetails_withdrawlimit='"+withdraw1+"',carddetails_purchaselimit='"+ purchase1+"' where carddetails_id='"+request.getParameter("hid")+"'";
                  boolean b=obj.executeCommand(up);
               
               }
      else
          {
          
        String ins="insert into tbl_carddetails(carddetails_name,cardtype_id,carddetails_withdrawlimit,carddetails_purchaselimit)values('"+cardname1+"','"+typeid1+"','"+withdraw1+"','"+purchase1+"')";
        obj.executeCommand(ins);
       out.print(dd);
          }
        } 
         
          
            
        
        %>
        <form name="frmcards">
            <input type="hidden" name="hid" value="<%=ee%>" >
            <table align="center">
                <tr>
                    <td>Card name</td>
                    <td><input type="text" name="txtname" value="<%=Cardname%>"></td>
                </tr>
                <tr>
                    <td>card  category</td>
                    <td>
                        <select name="seltype">
                            <option>---select card type---</option> 
                            <%
                            String type="select * from tbl_cardtype";
                            ResultSet rst=obj.selectCommand(type);
                             while(rst.next())
                            {
                                String id=rst.getString("cardtype_id");
                            %>
                            <option<%if(Cardtype.equals(id)){%> selected="" <%}%> value="<%=rst.getString("cardtype_id")%>"><%=rst.getString("cardtype_name")%></option>
                            <%
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>WithDrawal limit</td>
                    <td><input type="text" name="txtwithdraw" value="<%=Cardwith%>"></td>
                </tr>
                <tr>
                    <td>Purchase limit</td>
                    <td><input type="text" name="txtpurchase" value="<%=Cardpur%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
                
            </table>
            
        </form>   
                
                <table align="center" border="2">
            <tr>
            <th>Sl.no</th>
            <th>Card Name</th>
            <th>Card Type</th>
            <th>Withdraw Limit</th>
            <th>Purchase Limit</th>
            </tr>                
                
                <%
                int i=1;
                String selq="select * from tbl_carddetails d inner join tbl_cardtype t on d.cardtype_id=t.cardtype_id";
                ResultSet rsd=obj.selectCommand(selq);
                while(rsd.next())
                {
                String id=rsd.getString("carddetails_id");
                %>
                 
            <tr>
                <td><%=i%></td>
                <td><%=rsd.getString("carddetails_name")%></td>
                <td><%=rsd.getString("cardtype_name")%></td>
                <td><%=rsd.getString("carddetails_withdrawlimit")%></td>
                <td><%=rsd.getString("carddetails_purchaselimit")%></td>
                <td><a href="CardDetails.jsp?did=<%=id%>">Delete</a>
                    <a href="CardDetails.jsp?editid=<%=id%>">Edit</a></td>   
            </tr>
                <%
                i++;
                }        
                %>          
                            
        </table>
    </body>
</html>
