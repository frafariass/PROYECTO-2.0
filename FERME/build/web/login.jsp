<%-- 
    Document   : login
    Created on : 23-05-2019, 0:42:34
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

    <!-- Jumbotron Header -->
   

    <!-- Page Features -->
    <div class="formularioregistro">

      <div id="ingresar">
            <h5>Ingrese sus datos</h5>
            <form mode="post" action="Login">
                <table>
                    <tr>
                        <td>Rut:</td><td><input type="text" name="rut"></td>
                    </tr>
                    <tr>
                        <td>Clave:</td><td><input type="password" name="clave" ></td>
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
