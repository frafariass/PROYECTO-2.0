<%-- 
    Document   : administrar
    Created on : 23-05-2019, 23:44:40
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
        }else
        {
            if(perfil.getRol_id_rol() != 4 && perfil.getRol_id_rol() != 5)
            {
                response.sendRedirect("index.jsp");
            }
        }
    %>
    
  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
   

    <!-- Page Features -->
    <div class="row text-center">

        <div class="container-fluid">
    <div class="row">
        <div class="col-2 collapse d-md-flex bg-light pt-2 min-vh-100" id="sidebar">
            <ul class="nav flex-column flex-nowrap">
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#submenu1" data-toggle="collapse" data-target="#submenu1">Administrar productos</a>
                    <div class="collapse" id="submenu1" aria-expanded="false">
                        <ul class="flex-column pl-2 nav">
                            <li class="nav-item"><a class="nav-link py-0" href="prodanular.jsp">Anular producto</a></li>
                            <li class="nav-item"><a class="nav-link py-0" href="prodbuscar.jsp">Buscar producto</a></li>
                            <li class="nav-item"><a class="nav-link py-0" href="prodagregar.jsp">Agregar producto</a></li>
                            <li class="nav-item"><a class="nav-link py-0" href="prodmodificar.jsp">Modificar producto</a></li>
                        </ul>
                    </div>
                </li>
                
                <% if(perfil.rol_id_rol == 1 || perfil.rol_id_rol == 2){%>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#submenu2" data-toggle="collapse" data-target="#submenu2">Administrar orden de compra</a>
                    <div class="collapse" id="submenu2" aria-expanded="false">
                        <ul class="flex-column pl-2 nav">
                            <li class="nav-item"><a class="nav-link py-0" href="ocanular.jsp">Anular OC</a></li>
                            <li class="nav-item"><a class="nav-link py-0" href="ocbuscar.jsp">Buscar OC</a></li>
                            <li class="nav-item"><a class="nav-link py-0" href="ocgenerar.jsp">Generar OC</a></li>
                            <li class="nav-item"><a class="nav-link py-0" href="ocmodificar.jsp">Modificar OC</a></li>
                            <li class="nav-item"><a class="nav-link py-0" href="ocrecepcionar.jsp">Recepcionar OC</a></li>
                        </ul>
                    </div>
                </li>
                <%}%>
                
                <% if(perfil.rol_id_rol == 1 || perfil.rol_id_rol == 3){%>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#submenu3" data-toggle="collapse" data-target="#submenu3">Administrar ventas</a>
                    <div class="collapse" id="submenu3" aria-expanded="false">
                        <ul class="flex-column pl-2 nav">
                            <li class="nav-item"><a class="nav-link py-0" href="venanular.jsp">Anular venta</a></li>
                            <li class="nav-item"><a class="nav-link py-0" href="venbuscar.jsp">Buscar venta</a></li>
                            <li class="nav-item"><a class="nav-link py-0" href="venmodificar.jsp">Modificar venta</a></li>
                        </ul>
                    </div>
                </li>
                <%}%>
                
                <% if(perfil.rol_id_rol == 1)
                {%>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#submenu4" data-toggle="collapse" data-target="#submenu4">Administrar usuarios</a>
                        <div class="collapse" id="submenu4" aria-expanded="false">
                            <ul class="flex-column pl-2 nav">
                                <li class="nav-item"><a class="nav-link py-0" href="usuanular.jsp">Anular usuario</a></li>
                                <li class="nav-item"><a class="nav-link py-0" href="usubuscar.jsp">Buscar usuario</a></li>
                                <li class="nav-item"><a class="nav-link py-0" href="usucrear.jsp">Crear usuario</a></li>
                                <li class="nav-item"><a class="nav-link py-0" href="usumodificar.jsp">Modificar usuario</a></li>
                            </ul>
                        </div>
                    </li>
                <%}%>
            </ul>
        </div>
        <div class="col pt-2">
            <h2>
                <a href="" data-target="#sidebar" data-toggle="collapse" class="d-md-none"><i class="fa fa-bars"></i></a>
                Bienvenido al panel de administración
            </h2>
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
