<%-- 
    Document   : administrar
    Created on : 23-05-2019, 23:44:40
    Author     : lordp
--%>

<%@page import="Modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="Modelo.Usuario"%>
<% 
    Usuario usu = (Usuario)request.getSession().getAttribute("usu1"); 
    Perfil perfil = (Perfil)request.getSession().getAttribute("perfil1");
   if(request.getSession().getAttribute("perfil1") == null)
   {
       response.sendRedirect("login.jsp");
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
          <li class="nav-item active">
            <a class="nav-link" href="#">Inicio
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Catálogo</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="carro.jsp">🛒 (0)</a>
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

    <!-- Jumbotron Header -->
   

    <!-- Page Features -->
    <div class="row text-center">

      <div id="ingresar">
            <h5>Ingrese sus datos</h5>
            <form mode="post" action="Login">
                <table>
                    <tr>
                        <td>Rut:</td><td><input type="text" name="rut"></td>
                    </tr>
                    <tr>
                        <td>Clave:</td><td><input type="password" name="clave"></td>
                    </tr>
                    <tr>
                        <td><a href="registro.jsp">Registrarse</a>&nbsp;</td><td><input type="submit" value="Ingresar"></td>
                    </tr>
                </table>
            </form>
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
