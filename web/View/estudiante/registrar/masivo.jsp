<%-- 
    Document   : index
    Created on : 30/08/2014, 10:55:05 PM
    Author     : Nuria
--%>

<%@page import="Conexion.MongoDB"%>
<%@page import="Entidades.TEstudiante"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.catalina.Server"%>
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
                        
                        //out.print(row.getCell((short)2).toString());
                        
                        TEstudiante oEstudiante= new TEstudiante();
                        oEstudiante.setCodigo(row.getCell((short)0).toString());
                        oEstudiante.setNombre(row.getCell((short)1).toString());
                        oEstudiante.setApellidos(row.getCell((short)2).toString());
                        oEstudiante.setDni(row.getCell((short)3).toString());
                        oEstudiante.setEstado(1);
                        /*for(int c = 0; c < cols; c++) {
                            cell = row.getCell((short)c);
                            if(cell != null) {
                                
                            }
                        }*/
                        
                        //Insertando data
                        MongoDB.RegistrarEstudiante(oEstudiante);
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
    <a href="estudiante" class="btn btn-success btn-mini"><i class="icon-white icon-arrow-left"></i> Atras</a>
    </form>
    <% 
    } %> 
    </body>
    
</html>
