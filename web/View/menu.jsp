<%
HttpSession s= request.getSession();
%>
<div class="navbar navbar-inverse" style="position: static;">
    <div class="navbar-inner">
       <div class="container">
         <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
         </a>
         <a class="brand" href="#">Matrícula</a>
       <div class="nav-collapse collapse navbar-inverse-collapse">
           <ul class="nav">                      
             <li class="dropdown">
               <a href="asignatura" class="dropdown-toggle" data-toggle="dropdown">Asignatura </a>
               <!-- <ul class="dropdown-menu">
                 <li><a href="registrar/">Registrar</a></li>
                 <li><a href="prestamo.jsp">Prestamo</a></li>
                 <li><a href="devueltos.jsp">Devueltos</a></li>                          
               </ul>-->
             </li>
             <li> <a href="listaalumno.jsp">Estudiante </a> </li>
           </ul>               
           <ul class="nav pull-right">
             <li> 
               <a href="index.jsp"> <%=s.getAttribute("nom_user")%> Cerrar sesion</a></li>                      
           </ul>
       </div>
      </div>
    </div>
</div>
