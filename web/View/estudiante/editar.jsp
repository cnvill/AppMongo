<%-- 
    Document   : index
    Created on : 30/08/2014, 10:55:05 PM
    Author     : Nuria
--%>

<%@page import="Conexion.MongoDB"%>
<%@page import="java.util.Date"%>
<%@page import="Entidades.TEstudiante"%>
<%@page import="org.apache.catalina.Server"%>
<%@page import="Entidades.TAsignatura"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Asignatura</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" media="screen"> 
        <link href="../../css/bootstrap-responsive.css" rel="stylesheet">
        <link href="../../css/estilo.css" rel="stylesheet">
        <script src="../../js/jquery.js"></script>    
        <script src="../../js/bootstrap.min.js"></script>
    </head>
    <body>
       <jsp:include page="/View/menu.jsp"></jsp:include>
       <%
         Boolean r=(request.getParameter("txtcodigo")!="" && request.getParameter("txtcodigo")!=null); 
         if(r){
             TEstudiante oEstudiante= new TEstudiante();
             oEstudiante.setCodigo(request.getParameter("txtcodigo"));
             oEstudiante.setNombre(request.getParameter("txtnombre"));             
             oEstudiante.setApellidos(request.getParameter("txtapellidos"));
             oEstudiante.setDni(request.getParameter("txtdni"));
             oEstudiante.setEstado(Integer.parseInt(request.getParameter("cbestado")));
             String resp=MongoDB.EditarEstudiante(oEstudiante);
            if(resp=="OK")
            {  HttpSession s= request.getSession();
                    s.setAttribute("respuesta_registro", "Registro satisfactorio");
                    response.sendRedirect("index.jsp");
            }else
            {
                out.println("<h3> Los datos son incorrectos </h3>");
            }
         }       
   
    %>
        <div class="content-fluid">
         <form action="editar.jsp" method="post" >
                <fieldset class="row-fluid">
                <div class="span2"></div>
                <div class="span6">
                <h4>Editar Estudiante </h4>
                <%                
                TEstudiante oEstudiate= new TEstudiante();
                oEstudiate= MongoDB.GetEstudiante(request.getParameter("idestudiante"));
                %>
                <div class="row-fluid">
                    <label for="txtcodigo">Codigo:</label>
                    <input type="hidden" name="txtIdEstudiante" value="<%=oEstudiate.getCodigo()%>" >
                    <input type="text" name="txtcodigo" placeholder="Ingrese codigo" value="<%=oEstudiate.getCodigo()%>" style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txtnombre">Nombres:</label>
                    <input type="text" name="txtnombre" value="<%=oEstudiate.getNombre()%>" placeholder="Ingrese Nombre" style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txtapellidos">Apellidos:</label>
                    <input type="text" name="txtapellidos" value="<%=oEstudiate.getApellidos()%>" placeholder="Ingrese Apellidos"  style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txtdireccion">DNI:</label>
                    <input type="text" name="txtdni" value="<%=oEstudiate.getDni()%>" placeholder="Ingrese Dirección"  style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txtFechaNacimiento">Fecha Nacimiento:</label>
                    <input type="dae" name="txtFechaNacimiento"  value="<%=oEstudiate.getFechanacimiento()%>" placeholder="Igrese Fecha Nacimiento"  style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="cbestado">Estado:</label>
                    <select name="cbestado">
                        <option value="1"> Activo</option>
                        <option value="0"> Inactivo</option>
                    </select>
                </div>
                <div class="row-fluid">        
                    <input type="submit" name="btnregistrar" class="btn btn-primary btn-small" value="Registrar">
                    <a href="index.jsp" class="btn btn-success btn-mini"><i class="icon-white icon-arrow-left"></i> Atras</a>
                </div>
                </fieldset>
                </div>
         <div class="span4"></div>
         </form>
      </div>
    </body>
    
</html>
