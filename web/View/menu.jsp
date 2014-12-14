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
         <a class="brand" href="#">Matricula</a>
       <div class="nav-collapse collapse navbar-inverse-collapse">
           <ul class="nav">                      
             <li class="dropdown">
               <a href="/AppTesisMongo/View/asignatura/index.jsp" class="dropdown-toggle" >Asignatura </a>
               <!-- <ul class="dropdown-menu">
                 <li><a href="registrar/">Registrar</a></li>
                 <li><a href="prestamo.jsp">Prestamo</a></li>
                 <li><a href="devueltos.jsp">Devueltos</a></li>                          
               </ul>-->
             </li>
             <li> <a href="/AppTesisMongo/View/estudiante/index.jsp">Estudiante </a> </li>
             <li> <a href="/AppTesisMongo/View/matricula/index.jsp">Generar Matricula </a> </li>
           </ul>               
           <ul class="nav pull-right">
             <li> 
               <a href="index.jsp"> <%=s.getAttribute("nom_user")%> Cerrar sesion</a></li>                      
           </ul>
       </div>
      </div>
    </div>
</div>
