<%-- 
    Document   : ProofDownload
    Created on : 17 Aug, 2017, 2:22:28 PM
    Author     : user
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
     

<%
String file=session.getAttribute("share").toString(); 
System.out.println("download " +file);

 File proj_path=new File(config.getServletContext().getRealPath("/"));
 String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Guest\\Captchas\\CShare\\"+file;
 File fdownload=new File(file_path);
 if(file.endsWith(".png"))
 response.setContentType("applocation/png");
 else if(file.endsWith(".pdf"))
     response.setContentType("applocation/pdf");
 response.setContentLength((int)fdownload.length());
 response.setHeader("Content-Disposition", "attachement;filename="+file);
 InputStream in=new FileInputStream(fdownload);
 ServletOutputStream outs=response.getOutputStream();
 int bit=256;
 byte[] b=new byte[in.available()];
 int i=0;
 while((i=in.read(b))!=-1)
     {
     outs.write(b);
     }
/* try{
     do{
         i=in.read();
         outs.write(i);
         }while(i!=0);
     }catch(IOException e){

         }*/
 outs.flush();
 outs.close();
in.close();

 
%>
    <