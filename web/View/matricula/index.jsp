<%-- 
    Document   : index
    Created on : 30/08/2014, 10:55:05 PM
    Author     : Nuria
--%>

<%@page import="BL.BLMatricula"%>
<%@page import="BL.BLEstudiante"%>
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
        <title>Generar registros de matricula</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" media="screen"> 
        <link href="../../css/bootstrap-responsive.css" rel="stylesheet">
        <link href="../../css/estilo.css" rel="stylesheet">
        <script src="../../js/jquery.js"></script>    
        <script src="../../js/bootstrap.min.js"></script>
    </head>
    <body>
       <jsp:include page="/View/menu.jsp"></jsp:include>
       
       <%
    if (request.getParameter("form") != null){
         java.util.Date dateInicio = new java.util.Date();
         String totalRegistros= BLMatricula.GenerarRegistroMatricula();
         java.util.Date dateFin = new java.util.Date();
         String tiempo=String.valueOf((dateFin.getTime()-dateInicio.getTime())/1000);
         out.println("<label class='alert alert-success'>Se registro satisfactoriamente los registros <br/> Tiempo transcurrido: "+tiempo+" segundos </br> Total registros: "+totalRegistros+" </label>");   
    }
    else
    { 
    %>
    <form action="index.jsp?form=ok" enctype="multipart/form-data" name="form1" method="post">
    <input type="submit" name="Registrar" value="Generar Registros de Matricula" class="btn btn-primary btn-small" />
    </form>
    <% 
    } %> 
    </body>
    
</html>
