<%-- 
    Document   : miscompras
    Created on : 19-06-2019, 0:37:28
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    
    <%
        if(perfil == null)
        {
            response.sendRedirect("index.jsp");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">

            <!-- Jumbotron Header -->


            <!-- Page Features -->
            <div id="miscomprasdiv">

              <div id="ingresar">
                    <h5>Ingrese sus datos</h5>
                    <form mode="post" action="Login" onsubmit="return validar()" id="formulariologin" name="formulariologin">
                        <table>
                            <tr>
                                <td>Rut:</td><td><input type="text" name="rut" id="rut" ><label ><font color="red" id="prut" name="prut">* </font> </label></td>
                            </tr>

                            <tr>
                                <td>Clave:</td><td><input type="password" name="clave" id="clave" ><font color="red">* </font> <input type="hidden" style="display: none" id="clavesecreta" name="clavesecreta"></td>
                            </tr>
                            <tr>
                                <td><a href="registro.jsp">Registrarse</a>&nbsp;</td><td><input type="submit" value="Ingresar" id="submitlogin" name="submitlogin"></td>
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
