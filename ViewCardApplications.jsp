<%-- 
    Document   : ViewCardApplications
    Created on : 21 Feb, 2018, 2:52:39 PM
    Author     : HP
--%>
<%@page import="db.mailconnection"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AntiPhishing::ViewCardApplications</title>
    </head>
    <body>
        <form>
        <table align="center" border="1">
            <tr>
                <td>sl.no</td>
                <td>Account number</td>
                <td>Customer name</td>
                <td>Card date</td>
                <td>Card Type</td>
                <td>Card details</td>
            </tr>
            <%
            int i=1;
            String sel="select * from tbl_cardapplications c inner join tbl_accounts a on c.accounts_id=a.accounts_id inner join tbl_customerdetails cu on cu.Customer_id=a.Customer_id inner join tbl_carddetails crd on c.carddetails_id=crd.carddetails_id inner join tbl_cardtype ct on crd.cardtype_id=ct.cardtype_id  where branch_id='"+session.getAttribute("brid")+"'";
            ResultSet rsc=obj.selectCommand(sel);
            while(rsc.next())
                 {
                  String id=rsc.getString("cardapplications_id");
                 
             %>
             <tr>
                <td><%=i%></td>
                <td><%=rsc.getString("accounts_no")%></td>
                <td><%=rsc.getString("Customer_name")%></td>
                <td><%=rsc.getString("card_date")%></td>
                 <td><%=rsc.getString("cardtype_name")%></td>
                <td><%=rsc.getString("carddetails_name")%></td>
                <td><a href="ViewCardApplications.jsp?did=<%=id%>">Approve</a></td>
             </tr>
            <%
            i++;
                 }
            %>
        </table>
        <%
            String Cname="";
            String acno="";
            String crdtyp="";
            String crd="";
             String crdno="";
             String cpin="";
             int cno=0;
             int pin=0;
         if(request.getParameter("did")!=null)
             
         
            {
              String sell="select * from tbl_cardapplications c inner join tbl_accounts a on c.accounts_id=a.accounts_id inner join tbl_customerdetails cu on cu.Customer_id=a.Customer_id inner join tbl_carddetails crd on c.carddetails_id=crd.carddetails_id inner join tbl_cardtype ct on crd.cardtype_id=ct.cardtype_id where c.cardapplications_id='"+request.getParameter("hid")+"'";  
                ResultSet rs=obj.selectCommand(sel);
                if(rs.next())
                
                {
                    Cname=rs.getString("Customer_name");
                    acno=rs.getString("accounts_no");
                    crdtyp=rs.getString("cardtype_name");
                    crd=rs.getString("carddetails_name");
               
                }
                  
            String sel1="select max(issuedcards_number) as crdno from tbl_issuedcards";
             ResultSet rs11=obj.selectCommand(sel1);
              if(rs11.next())
            {
              crdno=rs11.getString("crdno");
             cno=Integer.parseInt(crdno)+1;
            }
                   
             String sel2="select max(issuedcards_pinnumber) as cpin from tbl_issuedcards";
             ResultSet rs12=obj.selectCommand(sel2);
              if(rs12.next())
            {
             cpin=rs12.getString("cpin");
             pin=Integer.parseInt(cpin)+1;
            }
              
              
         
         }
         
         String isno="";
         String ispin="";
         String acid="";
         String crdid="";
         String status="";
       
         if(request.getParameter("btnsubmit")!=null)
            {
            String sell="select * from tbl_cardapplications where cardapplications_id='"+request.getParameter("did")+"' ";
                ResultSet rs=obj.selectCommand(sel);
                if(rs.next())
                
                {
                    
                    acid=rs.getString("accounts_id");
                    crdid=rs.getString("carddetails_id");          
            }
             String email="";
              String ins="insert into tbl_issuedcards(accounts_id,carddetails_id,issuedcards_number,issuedcards_pinnumber,issuedcards_status)values('"+acid+"','"+crdid+"','"+request.getParameter("CNNO")+"','"+request.getParameter("PINNO")+"','issued')";
              boolean b=obj.executeCommand(ins);  
              if(b)
              {
                  String sele="select cu.customer_email from tbl_issuedcards s inner join tbl_accounts ac on s.accounts_id=ac.accounts_id inner join tbl_customerdetails cu on cu.Customer_id=ac.Customer_id where ac.accounts_id='"+acid+"'";
                  ResultSet rse=obj.selectCommand(sele);
                  out.println(sele);
                  if(rse.next())
                  {
                  email=rse.getString("Customer_email");
                  }
                  String to[]={email};
                  String subject="card notification";
                  String content="your debit/credit card will get by post within 2 week.your card number:"+request.getParameter("CNNO")+" and pin number :"+request.getParameter("PINNO");
//                  mailconnection mc=new mailconnection();
                  boolean bb=mailconnection.sendMail(to, subject, content);
                  System.out.println(email+"email");
                  System.out.println(to[0]+"to");
                  System.out.println(subject+"subject");
                  System.out.println(content+"content");
                  if(bb)
                  {
                      %>
                      <script>
                          alert("Mail Send");
                      </script>
                      <%
                  }
                  
                  %>
                  
                  
                  
                  
                  
                  
                  
                  <%
              }
              
            }
        %>
        
        
        <%
      
        %>
        <br><br>
        <table align="center" border="1">
            <input type="hidden" value="<%=request.getParameter("did")%>" name="hid"  >
            <tr>
                <td>Name  :</td>
                <td><%=Cname%></td>
            </tr>
            <tr>
                <td>Account Number  :</td>
                
                <td><%=acno%></td>
            </tr>
            <tr>
                <td>Card Type  :</td>
                <td> <%=crdtyp%></td>
            </tr>
            <tr>
                <td>Card Name  :</td>
                <td> <%=crd%></td>
            </tr>
            <tr>
                <td>Card number</td>
                <td>
                    <input type="hidden" value="<%=cno%>" name="CNNO">
                    <%=cno%>
                </td>
            </tr>
            <tr>
                <td>Pin number</td>
                
                <td>
                    <input type="hidden" value="<%=pin%>" name="PINNO">
                    <%=pin%></td>
            </tr>
            <tr><td colspan="2" align="center">
                                    <input type="submit" name="btnsubmit" value="Submit">
                                    <input type="reset" name="btnreset" value="cancel">
                </td>
            </tr>
        </table>
            </form>
    </body>
</html>
