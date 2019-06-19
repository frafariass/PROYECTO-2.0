<%-- 
    Document   : prodagregar
    Created on : 15-06-2019, 5:03:42
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    
    <%
        if(perfil.rol_id_rol != 1 || perfil.rol_id_rol != 2 || perfil.rol_id_rol != 3)
        {
            response.sendRedirect("index.jsp");
        }
    %>
    
    <script>
        function agregarprod()
        {
            <%
               BD bd = new BD();
               String q = "inset into producto values ()";
            %>
        }
    </script>
    
    <body>
    <div class="container">
    <!-- Page Features -->
    <div class="formularioagregarprod">

        <div id="registroDiv1">
            <h5>Agregar producto</h5>
            <div id="registroDiv">
                <form method="post" action="AgregarProd">
                    <table>
                        <tr>
                            <td>Nombre:</td><td><input type="text" name="nombre" required>*</td>
                        </tr>

                        <tr>
                            <td>Descripción:</td><td><input type="password" name="descripcion" required>*</td>
                        </tr>

                        <tr>
                            <td>Precio unitario:</td><td><input type="number" name="preciou" required>*</td>
                        </tr>
                        
                        <tr>
                            <td>Stock:</td><td><input type="number" name="stock" required>*</td>
                        </tr>

                        <tr>
                            <td>Imagen:</td><td><input type="file" name="imagen" required>*</td>
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
        
        <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
