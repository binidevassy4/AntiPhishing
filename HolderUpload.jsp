<%-- 
    Document   : HolderUpload
    Created on : Mar 4, 2018, 6:52:32 AM
    Author     :My Pc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
 <%
            
            String field_name="";
        FileItem f_item=null;
String file_name="";

File savedFile=null;
String fn="",pf="", logid="";

String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    System.out.println("ifff");

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
        System.out.println("ifff 1");
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          System.out.println("ifff 2");
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                System.out.println(k+" "+value[k]);
                k++;
        }
       else
       {
		   
		   
            //f_item=(FileItem)itr.next();
            
           file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("txtphoto"))
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Guest\\HolderPhoto\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             System.out.println("ifff : "+fn);
            fn="IMG_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+fn);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
            if(field_name.equals("txtproof"))
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Guest\\HolderProof\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             System.out.println("ifff : "+fn);
            pf="IMG_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+pf);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
          
           
       }
           
           }
    
     
                    
//      String insQry1="insert into tbl_login(username,password,u_type) values('"+value[8]+"','"+value[9]+"','account holder')";
//        boolean b1=obj.executeCommand(insQry1);
//          if(b1==true)
//         {
//              String sel="select max(login_id) as logid from tbl_login"; 
//                  ResultSet rs=obj.selectCommand(sel);
//                  while(rs.next())
//                   {
//                    logid=rs.getString("logid");
//                  }
//         }               
   
   String str1="insert into tbl_accountholders(branch_id,account_holdername,account_photo,account_address,account_gender,account_contact,account_email,account_proof,account_adharno,account_holder_status,login_id) values('"+value[1]+"','"+value[2]+"','"+fn+"','"+value[3]+"','"+value[4]+"','"+value[5]+"','"+value[6]+"','"+pf+"','"+value[7]+"',0,'"+logid+"')";
  
   System.out.println(str1);
   out.println(str1);
   
    boolean status=obj.executeCommand(str1);
    
    if(status==true)
    {
         out.println(str1);
                   // out.println(insQry1);
      %> 
       <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='AccountHolderRegistration.jsp'},100);
        </script>
     <%
    }
    else
    {
        out.println(str1);
                    out.println(insQry1);
    }
     }   


      
        
        %>
    </body>
</html>
