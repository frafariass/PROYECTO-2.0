<%-- 
    Document   : registro
    Created on : 23-05-2019, 0:42:18
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<% 
    
   if(request.getSession().getAttribute("usu1") != null)
   {
       response.sendRedirect("index.jsp");
   }
   
   %>
<!DOCTYPE html>
<html>
    

  <!-- Page Content -->
  <div class="container">


    <!-- Page Features -->
    <div class="formularioregistro">

        <div id="registroDiv1">
            <h5>Registro</h5>
            <div id="registroDiv">
                <form method="post" action="Registro">
                    <table>
                        <tr>
                            <td>Rut:</td><td><input type="text" name="rut" required>*</td>
                        </tr>

                        <tr>
                            <td>Clave:</td><td><input type="password" name="clave" required>*</td>
                        </tr>

                        <tr>
                            <td>Confirmar Clave:</td><td><input type="password" name="conclave" required>*</td>
                        </tr>
                        
                        <tr>
                            <td>Email:</td><td><input type="email" name="email" required>*</td>
                        </tr>

                        <tr>
                            <td>Nombre:</td><td><input type="text" name="nombre" required>*</td>
                        </tr>

                        <tr>
                            <td>Apellido:</td><td><input type="text" name="apellido" required></td>
                        </tr>


                        <tr>
                            <td>Direccion:</td><td><input type="text" name="direccion"></td>
                        </tr>

                        <tr>
                            <td>Teléfono de contacto:</td><td><input type="number" name="telefono"></td>
                        </tr>

                        <tr>
                            <td><a href="javascript:window.history.back();">&laquo; Volver</a></td><td><input type="submit" value="Enviar" name="submitn"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
      
    </div>


  </div>
    <!-- /.row -->
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
