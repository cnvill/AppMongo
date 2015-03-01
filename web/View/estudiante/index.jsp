<%-- 
    Document   : index
    Created on : 30/08/2014, 10:54:55 PM
    Author     : Nuria
--%>

<%@page import="Conexion.MongoDB"%>
<%@page import="Entidades.TEstudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Estudiantes</title>
        <jsp:include page="../libreria.jsp" ></jsp:include>
    </head>
    <body>
    <jsp:include page="/View/menu.jsp"></jsp:include>
            <div class="row-fluid">
                <a href="registrar">Nuevo one</a>
                <a href="registrar/masivo.jsp">Nuevo All</a>
                
                 <div class="span8">
                        <form action="index.jsp?form=ok"  method="post">
                            <div class="row-fluid">
                                <div class="span6">
                                    <input name="txtbuscar" value="" placeholder="Buscar Estudiante">
                                </div>
                                <div class="span4">
                                    <input type="submit" value="Buscar" class="btn-success">                                    
                                </div>
                            </div>
                        </form>
                    </div>
                
                <table class="table table-bordered">
                    <thead>
                        <th>Codigo</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>DNI</th>
                        <th>Fecha Nacimiento</th>
                        <th>Estado</th>
                    </thead>
                    <tbody>
                        
                        
                         <%
                       String tiempoRespueta="";
                       if (request.getParameter("form") != null){
                            
                            java.util.Date dateInicio = new java.util.Date();
                            ArrayList<TEstudiante> lEstudiante=MongoDB.BuscarEstudiante(request.getParameter("txtbuscar"));
                         for(int cont=0;cont<lEstudiante.size();cont++)
                                 {   
                                 %>
                                 <tr>
                                     <td> <a href="editar.jsp?idestudiante=<%=lEstudiante.get(cont).getCodigo()%>"><%=lEstudiante.get(cont).getCodigo() %> </a> </td>
                                     <td><%=lEstudiante.get(cont).getNombre() %></td>
                                    <td><%=lEstudiante.get(cont).getApellidos() %></td>                                    
                                    <td><%=lEstudiante.get(cont).getDni()%></td>  
                                    <td><%=lEstudiante.get(cont).getFechanacimiento() %></td>
                                    <td><%=lEstudiante.get(cont).getEstado() %></td>  
                                 </tr>
                                <%
                            }
                         java.util.Date dateFin = new java.util.Date();
                         tiempoRespueta=String.valueOf((dateFin.getTime()-dateInicio.getTime()));
                           %>
                    <div> Tiempo Transcurrido: <%=tiempoRespueta%> Milisegundos</div>
                            <%
                         
                           }
                        %>
                    </tbody>
                </table>
            </div>
    </body>
</html>
