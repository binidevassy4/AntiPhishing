<%-- 
    Document   : AccountTypes
    Created on : 8 Feb, 2018, 10:13:29 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::AccountTypes</title>
    </head>
    <body>
         <%
            String AccName="";
            String AccDuration="";
            String Accminbal="";
            String AccID="";
            String AccountId="";
            String AccountName="";
            String Accountduration="";
            String Accountminbal="";
            
            if(request.getParameter("editacctid")!=null)
            {
                String sel="select * from tbl_accounttype where accounttype_id='"+request.getParameter("editacctid")+"'";
                ResultSet rs=obj.selectCommand(sel);
                if(rs.next())
                
                {
                    AccountId=rs.getString("accounttype_id");
                    AccountName=rs.getString("accounttype_name");
                    Accountduration=rs.getString("accounttype_duration");
                    Accountminbal=rs.getString("accounttype_minbalance");
                    
                }
            }
            
     if(request.getParameter("did")!=null)
            {

              
                String del="delete from tbl_accounttype where accounttype_id='"+request.getParameter("did")+"'";
                obj.executeCommand(del);
            }
            
            
            
            
            if(request.getParameter("btnsubmit")!=null)
            {
               AccName=request.getParameter("txtname");
               AccDuration=request.getParameter("txtduration");
               Accminbal=request.getParameter("txtminbal");
               
               
               
               
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_accounttype set accounttype_name='"+ AccName+"',accounttype_duration='"+AccDuration+"',accounttype_minbalance='"+Accminbal+"' where accounttype_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.executeCommand(up);
                  if(b)
                  {
                    response.sendRedirect("AccountTypes.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
                }else{
                    
                
                String insQry="insert into tbl_accounttype(accounttype_name,accounttype_duration,accounttype_minbalance)values('"+AccName+"','"+AccDuration+"','"+Accminbal+"')";
                out.println(insQry);
                boolean b1=obj.executeCommand(insQry);
                if(b1)
                {
                    response.sendRedirect("AccountTypes.jsp");
                    
                }
                else
                {
                    out.println(insQry);
                }
             
                }
            }
            %>
        <form name="frmaccount">
            <input type="hidden" value="<%=AccountId%>" name="hid"  >
            <table border="1" align="center">
                <tr>
                    <td>Account</td>
                    <td><input type="text" value="<%=AccountName%>" name="txtname" placeholder="enter the account"></td>
                </tr>
                <tr>
                    <td>Duration</td>
                    <td><input type="text" value="<%=Accountduration%>" name="txtduration" placeholder="enter the account"></td>
                </tr>
                <tr>
                    <td>Minimum balance</td>
                    <td><input type="text" value="<%=Accountminbal%>" name="txtminbal" placeholder="enter the account"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="Cancel">
                     </td>
                </tr> 
            </table>
        </form>
        <table align="center" border="1">
                <tr>
                    <th> sl.no</th>
                    <th>Account name</th>
                    <th>Duration</th>
                    <th>Minimum Balance</th>
                </tr>
                
                
                
                <%
                    int i=1;
                    String selQry="select * from tbl_accounttype";
                    ResultSet rs=obj.selectCommand(selQry);
                    while(rs.next())
                    {
                        String districtid=rs.getString("accounttype_id");
                %>  
                    <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("accounttype_name")%></td>
                    <td><%=rs.getString("accounttype_duration")%></td>
                    <td><%=rs.getString("accounttype_minbalance")%></td>
                    <td><a href="AccountTypes.jsp?did=<%=districtid%>">Delete</a>
                        <a href="AccountTypes.jsp?editacctid=<%=districtid%>">Edit</a></td>
                    </tr>
                    <%
                        i++;
                    }
                    %>
            </table>
    </body>
</html>
