<%-- 
    Document   : catalogotipoproducto
    Created on : 25-05-2019, 1:50:07
    Author     : lordp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<% 
   TipoProducto tipo = (TipoProducto)request.getSession().getAttribute("tipo1"); %>
<!DOCTYPE html>
<html>
    

  <!-- Page Content -->

    
    <!-- Page Features -->
<div class="container">

    <div class="row">

      <div class="col-lg-3">
        <h1 class="my-4">Categorías</h1>
        <div class="list-group">
            <%
                BD bd = new BD();
                String q = "select * from familia";
                ResultSet res = bd.read(q);
                res.next();
                do {
                        out.println("<form method='post' action='CatalogoFamilia'>");
                        out.println("<input class='list-group-item' type='submit' name = 'dato'"+ "value = '"+ res.getString("id_familia") + ": " + res.getString("NOMBRE_FAMILIA")+"'>");
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
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
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