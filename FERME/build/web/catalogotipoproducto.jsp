<%-- 
    Document   : catalogotipoproducto
    Created on : 25-05-2019, 1:50:07
    Author     : lordp
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="Modelo.TipoProducto"%>
<%@page import="Modelo.BD"%>
<%@page import="Modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="Modelo.Usuario"%>
<% Usuario usu = (Usuario)request.getSession().getAttribute("usu1"); 
   Perfil perfil = (Perfil)request.getSession().getAttribute("perfil1");
   TipoProducto tipo = (TipoProducto)request.getSession().getAttribute("tipo1"); %>
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
<div class="container">

    <div class="row">

      <div class="col-lg-3">
        <h1 class="my-4">Categorías</h1>
        <div class="list-group list-group-flush">
            <%
                BD bd = new BD();
                String q = "select * from familia";
                ResultSet res = bd.read(q);
                res.next();
                do {
                        out.println("<form method='post' action='CatalogoFamilia'>");
                        out.println("<input class='list-group-item list-group-item-action' type='submit' name = 'dato'"+ "value = '"+ res.getString("id_familia") + ": " + res.getString("NOMBRE_FAMILIA")+"'>");
                        out.println("</form>");
                    } while (res.next());
                
            %>
        </div>
      </div>
      <!-- /.col-lg-3 -->
     <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://cesursa.com/wp-content/uploads/2015/08/Slide-Cesursa-02-03.png?291d7b&291d7b" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://www.ferreterianicholson.com/images/com_hikashop/upload/taladros-desarmadores-a-batera-para-tareas-bsicas-ferreteria-nicholson-01a_0001_1024px-bosch-brand_svg-copia-2.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://cesursa.com/wp-content/uploads/2015/08/Slide-Cesursa-01-1.png?291d7b&291d7b" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">

            
        <%
            String n = "select * from PRODUCTO where tipo_producto_id_tipoprod = " + tipo.getId_tipoprod();
            ResultSet res1 = bd.read(n);
            
            if(res1.next())
            {
                do {
                    
                        Blob blob = res1.getBlob("imagen");
                 
                        InputStream inputStream = blob.getBinaryStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead = -1;

                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);                  
                        }

                        byte[] imageBytes = outputStream.toByteArray();
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        
                        out.println("<div class='col-lg-4 col-md-6 mb-4'>");
                        out.println("<div class='card h-100'>");
                        out.println("<img class='card-img-top' src='data:image/jpg;base64," + base64Image + "'/>");
                        out.println("<div class='card-body'>");
                        out.println("<form method='post' action='EspecificacionProducto'>");
                        out.println("<h4 class='card-title'>");
                        out.println("<input class='list-group-item' type='submit' name = 'dato'"+ "value = '" + res1.getString("nombre")+"'>");
                        out.println("</h4>");
                        out.println("</form>");
                        out.println("</form>");
                        out.println("<h5> Precio unitario: $"+ res1.getString("precio_unitario") +"</h5>");
                        out.println("<p class='card-text'>"+ res1.getString("desc_producto") +"</p>");
                        out.println("</div>");
                        out.println("<div class='card-footer'>");
                        out.println("<small class='text-muted'>&#9733; &#9733; &#9733; &#9733; &#9734;</small>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                        
                    } while (res1.next());
            }else{
                out.println("<p>No hay productos en esta categoria</p>");
            }
            
        %>    
        
        
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

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
