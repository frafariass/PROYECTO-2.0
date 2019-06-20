<%-- 
    Document   : carro
    Created on : 25-05-2019, 0:05:53
    Author     : lordp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<!DOCTYPE html>
<html>
    

  <!-- Page Content -->
  <div class="container">
      <!--Validación de si esta logueado, en caso contrario redirige a login 
      

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      <h1 class="display-3">Te damos la bienvenida</h1>
      <p class="lead">La mejor calidad del mercado encuentrala aquí.</p>
      <a href="#" class="btn btn-primary btn-lg">Ir al catálogo de productos</a>
    </header>

    <!-- Page Features -->
    <div class="container">
        <%
            BD bd = new BD();
            String q_1 = "select ID_ORDEN,FECHA_CREACION,TOTAL_COMPRA from orden_compra oc join perfil_oc poc "
                    + "on (oc.id_orden=poc.orden_compra_id_orden) "
                    + "where oc.estado_id_estado=1 and poc.perfil_id_perf=" + usu.getId_perf();
            ResultSet res_1 = bd.read(q_1);
            String q_2 = "select pro.nombre, pro.precio_compra from oc_prod ocp join producto pro "
                    + "on (ocp.producto_id_producto=pro.id_producto) "
                    + "where ocp.orden_compra_id_orden in (select ID_ORDEN from orden_compra oc join perfil_oc poc "
                    + "on (oc.id_orden=poc.orden_compra_id_orden) " 
                    + "where oc.estado_id_estado=1 and poc.perfil_id_perf=" + usu.getId_perf();
            ResultSet res_2= bd.read(q_2);
        %>
        <h1>Tu Carrito de Compra</h1>
        <hr>
        <table class="table table-bordered">
            <%
            if(res_2.next())
            {
           
            <tr>
                <th>Nombre Producto</th>
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
            <%
                while (res_2.next()){
             %>
            <tr>
                <td><%= res_2.getString("nombre")%></td>
                <td><%= res_2.getInt("precio_compra")%></td>
                <td></td>
            </tr>
            <%}%>
            <%}%>
        </table>

     

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
