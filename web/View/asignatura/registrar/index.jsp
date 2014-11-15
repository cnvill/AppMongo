<%-- 
    Document   : index
    Created on : 30/08/2014, 10:55:05 PM
    Author     : Nuria
--%>

<%@page import="Entidades.TAsignatura"%>
<%@page import="Conexion.MongoDB"%>
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
         Boolean r=(request.getParameter("txtidasignatura")!="" && request.getParameter("txtidasignatura")!=null); 
         if(r){
             TAsignatura oAsignatura= new TAsignatura();
             oAsignatura.setIdasignatura(request.getParameter("txtidasignatura"));
             oAsignatura.setNombre(request.getParameter("txtnombre"));
             oAsignatura.setCredito(Integer.parseInt(request.getParameter("txtcredito")));
             oAsignatura.setHorasteorica(Integer.parseInt(request.getParameter("txtht")));
             oAsignatura.setHoraspractica(Integer.parseInt(request.getParameter("txthp")));
             oAsignatura.setHoraslaboratorio(Integer.parseInt(request.getParameter("txthl")));
             oAsignatura.setCiclo(request.getParameter("cbciclo"));
             oAsignatura.setEstado(Integer.parseInt(request.getParameter("cbestado")));
             String resp=MongoDB.InsertarAsignatura(oAsignatura);
            if(resp=="OK")
            {  HttpSession s= request.getSession();
                    s.setAttribute("respuesta_registro", "Registro satisfactorio");
                    response.sendRedirect("../index.jsp");
            }else
            {
                out.println("<h3> Los datos son incorrectos </h3>");
            }
         }
        
   
    %>
        <div class="content-fluid">
         <form action="index.jsp" method="post" >
                <fieldset class="row-fluid">
                <div class="span2"></div>
                <div class="span6">
                <h4>Nueva Asignatura </h4>
                <div class="row-fluid">
                    <label for="txtidasignatura">Codigo:</label>
                    <input type="text" name="txtidasignatura" placeholder="Ingrese codigo" style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txtnombre">Nombre</label>
                    <input type="text" name="txtnombre" placeholder="Ingrese Nombre" style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txtcredito">Creditos</label>
                    <input type="text" name="txtcredito" placeholder="Ingrese Credito"  style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txtht">Horas Teorica:  </label>
                    <input type="text" name="txtht" placeholder="Ingrese Horas Teorica"  style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="txthp">Horas Practica:  </label>
                    <input type="text" name="txthp" placeholder="Ingrese Horas Practica"  style="height: 30px;" class="input-xlarge" required>
                </div>
                 <div class="row-fluid">
                    <label for="txthl">Horas Laboratorio:  </label>
                    <input type="text" name="txthl" placeholder="Ingrese Horas Laboratorio"  style="height: 30px;" class="input-xlarge" required>
                </div>
                <div class="row-fluid">
                    <label for="cbciclo">Ciclo  </label>
                    <select name="cbciclo">
                        <option value="-1"> Seleccione una opcion</option>
                            <%
                            for(int i=1; i<=10; i++){
                            %>
                            <option value="<%=i%>"> <%=i%></option>
                            <%
                              }
                            %>
                    </select>
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
                    <a href="../" class="btn btn-success btn-mini"><i class="icon-white icon-arrow-left"></i> Atras</a>
                </div>
                </fieldset>
                </div>
         <div class="span4"></div>
         </form>
      </div>
    </body>
    
</html>
