<%-- 
    Document   : editarperfil
    Created on : 23-05-2019, 23:52:21
    Author     : lordp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<% 
   if(request.getSession().getAttribute("perfil1") == null)
   {
       response.sendRedirect("login.jsp");
   }
   %>
<!DOCTYPE html>
<html>
    

  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
   

    <!-- Page Features -->
    <div class="formularioregistro">

      <div id="ingresar">
            <h5>Ingrese sus datos, los campos con * son necesarios</h5>
            <form mode="post" action="EditarPerfil">
                <table>
                    <tr>
                        <td>Clave actual:</td><td><input type="password" name="clave" required>*</td>
                    </tr>
                    <tr>
                        <td>Email:</td><td><input type="email" name="email"></td>
                    <tr>
                        <td>Nueva Clave:</td><td><input type="password" name="nuevaclave"></td>
                    </tr>
                    <tr>
                        <td> Confirmar nueva clave:</td><td><input type="password" name="connuevaclave"></td>
                    </tr>
                    <tr>
                        <td> Teléfono de contacto:</td><td><input type="number" name="telefono"></td>
                    </tr>
                    <tr>
                        <td>Dirección:</td><td><input type="text" name="direccion"></td>
                    <tr>
                    <tr>
                        <td>Nombre:</td><td><input type="text" name="nombre"></td>
                    <tr>  
                    <tr>
                        <td>Apellido:</td><td><input type="text" name="apellido"></td>
                    <tr>
                    <tr>
                        <td><input type="submit" value="Editar perfil"></td>
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
