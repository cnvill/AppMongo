<%-- 
    Document   : index
    Created on : 30/08/2014, 10:54:55 PM
    Author     : Nuria
--%>

<%@page import="Entidades.TMatricula"%>
<%@page import="Conexion.MongoDB"%>
<%@page import="Entidades.TEstudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Matricula</title>
        <jsp:include page="../libreria.jsp" ></jsp:include>
    </head>
    <body>
    <jsp:include page="/View/menu.jsp"></jsp:include>
            <div class="row-fluid">
                
                <table class="table table-bordered">
                    <thead>
                        <th>Maticula</th>
                        <th>Estudiante</th>
                        <th>Semestre</th>
                        <th>Fecha Matricula</th>
                        <th>Total Creditos</th>
                        <th>Estado</th>
                    </thead>
                    <tbody>
                        <%
                            
                            ArrayList<TMatricula> lEstudiante=MongoDB.ListaMatriculas();
                         for(int cont=0;cont<lEstudiante.size();cont++)
                                 {                                
                                 %>
                                 <tr>
                                     <td><%=lEstudiante.get(cont).getIdmatricula()%></td>
                                     <td><%=lEstudiante.get(cont).getIdestudiante()%></td>
                                    <td><%=lEstudiante.get(cont).getSemestre()%></td>                                    
                                    <td><%=lEstudiante.get(cont).getFechamatricula()%></td>  
                                    <td><%=lEstudiante.get(cont).getTotalcreditos()%></td>
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
