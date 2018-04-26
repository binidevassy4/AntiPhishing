<%-- 
    Document   : TeamUploadAction
    Created on : Jan 29, 2018, 2:55:52 PM
    Author     : HP
--%>

<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<jsp:useBean id="cap" class="captcha_generator.captcha"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TEAM</title>
    </head>
    <body>
        <%
            
        File savedFile=null; 
        FileItem f_item=null;
        
        

String field_name="";
String file_name="";
String fn="";

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
        
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                
                k++;
        }
       else
       {
		   
		   
           //f_item=(FileItem)itr.next();
            
          file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("share"))
           {
         String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Guest\\Captchas\\WRshare\\";
           
           //  String name=request.getParameter("share");
            fn=file_name;
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
           
           
           
          
           
       }
           
           }
     String cshare="",sshare="";
    String sel="select * from tbl_registration where pass='"+value[0]+"'";
           ResultSet rsc=obj.selectCommand(sel);
           // out.println(sel);
           while(rsc.next())
           {
           sshare=rsc.getString("sshare");
           BufferedImage bfsshare = ImageIO.read(new File("E:\\AntiPhishing-  Main Project\\PROJECT\\AntiPhishing\\web\\Guest\\Captchas\\SShare\\"+sshare));
            BufferedImage bfcshare = ImageIO.read(new File("E:\\AntiPhishing-  Main Project\\PROJECT\\AntiPhishing\\web\\Guest\\Captchas\\WRshare\\"+file_name));
             String name=rsc.getString("name");
             session.setAttribute("compainshare",name );
            cap.share_combine(bfcshare, bfsshare,name);
            
            
          
    
      %> 
       <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='finalStep.jsp'},100);
        </script>
     <%
     }
     }   


      

        %>
    </body>
</html>
