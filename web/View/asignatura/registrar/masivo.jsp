<%-- 
    Document   : index
    Created on : 30/08/2014, 10:55:05 PM
    Author     : Nuria
--%>

<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="Conexion.MongoDB"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.catalina.Server"%>
<%@page import="Entidades.TAsignatura"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.TAsignatura"%>

<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.catalina.Server"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Asignatura</title>
        <link href="../../../css/bootstrap.min.css" rel="stylesheet" media="screen"> 
        <link href="../../../css/bootstrap-responsive.css" rel="stylesheet">
        <link href="../../../css/estilo.css" rel="stylesheet">
        <script src="../../../js/jquery.js"></script>    
        <script src="../../../js/bootstrap.min.js"></script>
    </head>
    <body>
       <jsp:include page="/View/menu.jsp"></jsp:include>
       
       <%
    if (request.getParameter("form") != null){

    /*FileItemFactory es una interfaz para crear FileItem*/
    FileItemFactory file_factory = new DiskFileItemFactory();
    /*ServletFileUpload esta clase convierte los input file a FileItem*/
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    /*sacando los FileItem del ServletFileUpload en una lista */
    List items = servlet_up.parseRequest(request);
    for(int i=0;i<items.size();i++){
    /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
    FileItem item = (FileItem) items.get(i);
    /*item.isFormField() false=input file; true=text field*/
    if (! item.isFormField()){
    //checking content type of file.            

        if(  item.getContentType().equalsIgnoreCase("application/vnd.ms-excel") )
        {
            /*cual sera la ruta al archivo en el servidor*/
            File archivo_server = new File( getServletContext().getRealPath("/Archivos")+File.separator+item.getName());
            /*y lo escribimos en el servido*/ 
            item.write(archivo_server);
            
            String nombreArchivo=archivo_server.toPath().toString();
            
                java.util.Date dateInicio = new java.util.Date();
                POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(nombreArchivo));
                HSSFWorkbook wb = new HSSFWorkbook(fs);
                HSSFSheet sheet = wb.getSheetAt(0);
                HSSFRow row;
                HSSFCell cell;

                int rows; // No of rows
                rows = sheet.getPhysicalNumberOfRows();

                int cols = 0; // No of columns
                int tmp = 0;

                // This trick ensures that we get the data properly even if it doesn't start from first few rows
                for(int j = 0; j < 10 || j < rows; j++) {
                    row = sheet.getRow(j);
                    if(row != null) {
                        tmp = sheet.getRow(j).getPhysicalNumberOfCells();
                        if(tmp > cols) cols = tmp;
                    }
                }
                String totalRegistros=""+rows;
                for(int r = 0; r < rows; r++) {
                    row = sheet.getRow(r);
                    if(row != null) {
                        TAsignatura oAsignatura= new TAsignatura();
                        oAsignatura.setIdasignatura(String.valueOf(row.getCell((short)0)));
                        oAsignatura.setNombre(String.valueOf(row.getCell((short)1)));
                        oAsignatura.setCredito(3);//Integer.parseInt(String.valueOf(row.getCell((short)2)).toString() 
                        oAsignatura.setHorasteorica(4);//Integer.parseInt(String.valueOf(row.getCell((short)3)))
                        oAsignatura.setHoraspractica(4);//Integer.parseInt(row.getCell((short)4).toString())
                        oAsignatura.setHoraslaboratorio(5);//Integer.parseInt(row.getCell((short)5).toString())
                        oAsignatura.setCiclo(String.valueOf(row.getCell((short)6)));
                        oAsignatura.setEstado(1);
                        //Insertando data
                        MongoDB.InsertarAsignatura(oAsignatura);
                    }
                }

                java.util.Date dateFin = new java.util.Date();
                String tiempo=String.valueOf((dateFin.getTime()-dateInicio.getTime())/1000);
            out.println("<label class='alert alert-success'>Se registro satisfactoriamente los registros <br/> Tiempo transcurrido: "+tiempo+" segundos </br> Total registros: "+totalRegistros+" </label>");
            
           
            }else
            if(item.getContentType().equalsIgnoreCase("text/xml")){
                 /*cual sera la ruta al archivo en el servidor*/
            File archivo_server = new File( getServletContext().getRealPath("/Archivos")+File.separator+item.getName());
            item.write(archivo_server);
            
            String fXmlFile=archivo_server.toPath().toString();
            
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(fXmlFile);
            
            doc.getDocumentElement().normalize();

            
            java.util.Date dateInicio = new java.util.Date();
            NodeList nList = doc.getElementsByTagName("table");
            int totalRegistros=0;
            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);                    
                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;
                    
                        TAsignatura oAsignatura= new TAsignatura();
                        oAsignatura.setIdasignatura(eElement.getElementsByTagName("column").item(0).getTextContent().toString());
                        oAsignatura.setNombre(eElement.getElementsByTagName("column").item(1).getTextContent().toString());
                        oAsignatura.setCredito(Integer.parseInt(eElement.getElementsByTagName("column").item(2).getTextContent().toString()));
                        oAsignatura.setHorasteorica(Integer.parseInt(eElement.getElementsByTagName("column").item(3).getTextContent().toString()));
                        oAsignatura.setHoraspractica(Integer.parseInt(eElement.getElementsByTagName("column").item(5).getTextContent().toString()));
                        oAsignatura.setHoraslaboratorio(Integer.parseInt(eElement.getElementsByTagName("column").item(6).getTextContent().toString()));
                        oAsignatura.setCiclo(eElement.getElementsByTagName("column").item(7).getTextContent().toString());                     
                        oAsignatura.setEstado(Integer.parseInt(eElement.getElementsByTagName("column").item(8).getTextContent().toString()));                     
                        
                        MongoDB.InsertarAsignatura(oAsignatura);                        
                        totalRegistros++;
                        
             }
           }
            
            java.util.Date dateFin = new java.util.Date();
            String tiempo=String.valueOf((dateFin.getTime()-dateInicio.getTime())/1000);
            out.println("<label class='alert alert-success'>Se registro satisfactoriamente los registros <br/> Tiempo transcurrido: "+tiempo+" segundos </br> Total registros: "+totalRegistros+" </label>");
         
            }
            else
            {
                out.print("<label class='alert alert-error'> Formato no correcto. Asegurese de seleccionar un archivo excel </label>");
            }
    }
    }
    }
    else
    { 
    %>
    <form action="masivo.jsp?form=ok" enctype="multipart/form-data" name="form1" method="post">
    <input type="file" name="file" /><br/>
    <input type="submit" name="Registrar" value="Registrar" class="btn btn-primary btn-small" />
    <a href="../" class="btn btn-success btn-mini"><i class="icon-white icon-arrow-left"></i> Atras</a>
    </form>
    <% 
    } %> 
    </body>
    
</html>
