<%-- 
    Document   : registro
    Created on : 23-05-2019, 0:42:18
    Author     : lordp
--%>

<%@page import="Modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="Modelo.Usuario"%>
<% 
    Usuario usu = (Usuario)request.getSession().getAttribute("usu1"); 
    Perfil perfil = (Perfil)request.getSession().getAttribute("perfil1");
   if(request.getSession().getAttribute("usu1") != null)
   {
       response.sendRedirect("index.jsp");
   }
   
   %>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- 
        Todo esto debe estar en cada JSP (html) en el head, son referencias a bootstrap, jquery y popper
        -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/estilosmaster.css">
                  <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <title>Ferretería FERME</title>
    </head>
    
    <body>
        <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Ferme</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
            <a class="nav-link" href="index.jsp">Inicio
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="catalogo.jsp">Catálogo</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="carro.jsp">Carro de compras</a>
          </li>
          <%
              if(usu == null)
                    {%>
                        <li class="nav-item">
                            <a class="nav-link" href="registro.jsp">Registro</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="login.jsp">Inicio de sesión</a>
                        </li>
                    <%}else
                      {
                        if(perfil.getRol_id_rol() == 1 || perfil.getRol_id_rol() == 2 || perfil.getRol_id_rol() == 3)
                        {%>
                            <li class="nav-item">
                                <a class="nav-link" href="administrar.jsp">Administrar</a>
                            </li>
                        <%}%>
                        <li class="nav-item">
                            <a class="nav-link" href="editarperfil.jsp">Editar perfil</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="CerrarSesion">Cerrar Sesión</a>
                        </li>
                      <%}%>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">


    <!-- Page Features -->
    <div class="formularioregistro">

        <div id="registroDiv1">
            <div class="center-block">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Registro!</h1>
                    <h6><small>los campos con asterisco son <mark>obligatorios</mark></small></h6>
                  </div>
                  <form method="post" action="Registro">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="exampleInputEmail" name="rut" placeholder="Rut *">
                    </div>
                      
                    <div class="form-group">
                    <input type="password" class="form-control form-control-user" id="exampleInputPassword" name="clave" placeholder="Clave *">
                    </div>
                      
                    <div class="form-group">
                    <input type="password" class="form-control form-control-user" id="exampleInputPassword" required name="conclave" placeholder="Confirmar Clave *">
                    </div>
                      
                    <div class="form-group">
                    <input type="email" class="form-control form-control-user" id="exampleInputPassword" required name="email" placeholder="E-Mail *">
                    </div>
                      
                    <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="exampleInputPassword" required name="nombre" placeholder="Nombre *">
                    </div>
                      
                    <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="exampleInputPassword" required name="apellido" placeholder="Apellido *">
                    </div>
                      
                    <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="exampleInputPassword" name="direccion" placeholder="Dirección">
                    </div>
                      
                    <div class="form-group">
                    <input type="number" class="form-control form-control-user" id="exampleInputPassword" name="telefono" placeholder="Numero de Contacto">
                    </div>
                    <input type="submit" value="Enviar" name="submitn" class="btn btn-warning btn-user btn-block">
                    <hr>
                  </form>
                  <div class="text-center">
                    <a class="small" href="javascript:window.history.back();">&laquo; Volver</a>
                  </div>
                </div>
            </div>
        </div>
      
    </div>


  </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
