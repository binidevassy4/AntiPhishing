<%-- 
    Document   : Registration
    Created on : March 12, 2018, 11:05:56 AM
    Author     : My Pc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lending Tree :: Account Opening</title>
        <script src="jquery.js" type="text/javascript"></script>
           
    </head>
    <body>
         <%
 
            String selBank="";
            String editName="";
            String editAdrs="";
            String editNo="";
            String edID="";
            String editMail="";
            String editUser="";
            String editPassword="";
            
       
          %>
        <form action="HolderUpload.jsp" method="post" enctype="multipart/form-data">
               <h1 align="center"><u><i>Account Opening</i></u></h1>
            <br><br>
            <table align="center" border="3">
                
                
                
                <tr>
                    <td>
                        Branch
                    </td>
                    <td>
                        <select  name="selbranch" >
                                <option>---select district---</option>
                       <%
                                String dis="select * from tbl_branch";
                                ResultSet rsl=obj.selectCommand(dis);
                                while(rsl.next())
                                {
                                    String id=rsl.getString("branch_id");
                                    %>
                                    <option  value="<%=rsl.getString("district_id")%>"><%=rsl.getString("branch_name")%></option>
                                    <%
                                 
                                }
                                
                                %>
                        </select>   
                    </td>
                </tr>
                
                <tr>
                    <td><b>Account Holder Name</b>
                       
                    </td>
                    <td><input type="text" name="txtName" value="<%=editName%>"></td>
                </tr>
                
                  <tr>
                    <td>Photo</td>
                    <td><input type="file" name="txtphoto"></td>
                </tr>
                <tr>
                    <td><b>Address</b></td>
                    <td><textarea  name="txtAddress" ><%=editAdrs%></textarea></td>
                </tr>
                <tr>
                    <td><b>Gender</b></td>
                    <td><input type="radio" name="txtGender" value="Male">Male<input type="radio" name="txtGender" value="Female">Female</td>
                </tr>

                <tr>
                    <td><b>Contact No</b></td>
                    <td><textarea name="txtContact" ><%=editNo%></textarea></td>
                </tr>
                <tr>
                    <td><b>Email</b></td>
                    <td><input type="email" name="txtEmail" value="<%=editMail%>" ></td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td><input type="file" name="txtproof" ></td>
                </tr>
                <tr>
                     <td><b>Adhar No</b></td>
                    <td><input type="text" name="txtAdhar" value=""></td>
                </tr>
                
                  <tr>
                    <td><b>Username</b></td>
                    <td><input type="text" name="txtUserName" value="<%=editUser%>" ></td>
                </tr>
                 <tr>
                
                <tr>
                    <td><b>Password</b></td>
                     <td><input type="password" name="txtPassword" value="<%=editPassword%>" ></td>
                </tr>
               
                <tr>
                    <td><input type="submit" name="btnSubmit" value="Submit"></td>
                    <td><input type="reset" name="btnCancel" value="Cancel"></td>
                     <input type="hidden" name="hdnID" value="<%=edID%>">
                </tr>
            </table>
        </form>
      <br><br>
<!--        <table align="center" border="3">
            
            <tr>
                <th>ID</th>
                <th>Bank</th>
                <th>Branch</th>
                <th>Account Holder Name</th>
                <th>Photo</th>
                <th>Address</th>
                <th>Gender</th>
                <th>contact</th>
                <th>Email</th>
                <th>Adhar No </th>
                <th>Proof</th>
                <th>User name</th>
                 <th>Password</th>
                
               
         
               
            </tr>-->
            
<!--            <%
                int i=0;
                     String selQry="select * from tbl_accountholders ac inner join tbl_branch br on ac.branch_id=br.branch_id inner join tbl_login l on ac.login_id=l.login_id where ac.branch_id='"+session.getAttribute("branchid")+"'";
                    ResultSet rs=obj.selectCommand(selQry);
                     while(rs.next())
                        {
                i++;
            %>
            <tr>
                <td><%=i%></td>
                 <td><%=rs.getString("bank_name")%></td>
                  <td><%=rs.getString("branch_name")%></td>
                <td><%=rs.getString("account_holdername")%></td>
                <td><img src="HolderPhoto/<%=rs.getString("account_photo")%>" width="50" height="50"></td>
                <td><%=rs.getString("account_address")%></td>
                <td><%=rs.getString("account_gender")%></td>
                <td><%=rs.getString("account_contact")%></td>
                <td><%=rs.getString("account_email")%></td>
                 <td><%=rs.getString("account_adharno")%></td>
                 <td><a href="ProofDownload.jsp?filename=<%=rs.getString("account_proof")%>"><%=rs.getString("account_proof")%></a></td>
                  <td><%=rs.getString("username")%></td>              
                <td><%=rs.getString("password")%></td>
                
               
               
            

            </tr>
            <%
                }
                %>
        </table>-->
        
    </body>
</html>
