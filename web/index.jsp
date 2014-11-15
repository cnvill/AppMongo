<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sistema de Matricula</title>        
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen"> 
        <link href="css/bootstrap-responsive.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/jquery.js"></script>    
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
            
        <form  action="View/asignatura/index.jsp" method="GET">
                <div class="row-fluid">
                    <div class="span4">                        
                    </div>
                    <div class="span3">
                        <h6 align="center">Inicio de session </h6>
                    </div>
                </div>
    		 
                    <div class="row-fluid">                        
                        <div class="span4"></div>
                        <div class="span3">  	
                                    <input type="text" name="txtusuario" id="txtusuario" class="input-block-level" placeholder="Usuario" required autofocus />
                                    <input type="password" name="txtcontrasenia" id="txtcontrasenia" class="input-block-level" placeholder="Contraseña" required />				    
                                    <p><a href="#">¿Olvidaste tu contraseña?</a></p>
                                    <div class="row-fluid">
                                        <button type="submit" class="btn btn-primary">Iniciar sesion</button>
                                        <!-- <button type="reset" class="btn btn-labeled btn-danger">Cancelar</button> -->
                                    </div>
                                   <div class="span4"></div>
                        </div>
    		    </div>
	      </form>        
    </body>
</html>
