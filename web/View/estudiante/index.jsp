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
                            
                            ArrayList<TEstudiante> lEstudiante=MongoDB.ListaEstudiantes();
                         for(int cont=0;cont<lEstudiante.size();cont++)
                                 {                                
                                 %>
                                 <tr>
                                     <td><%=lEstudiante.get(cont).getCodigo() %></td>
                                     <td><%=lEstudiante.get(cont).getNombre() %></td>
                                    <td><%=lEstudiante.get(cont).getApellidos() %></td>                                    
                                    <td><%=lEstudiante.get(cont).getDni()%></td>  
                                    <td><%=lEstudiante.get(cont).getFechanacimiento() %></td>
                                    <td><%=lEstudiante.get(cont).getEstado() %></td>  
                                 </tr>
                                <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
    </body>
</html>
