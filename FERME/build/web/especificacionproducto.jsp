<%-- 
    Document   : especificacionproducto
    Created on : 26-05-2019, 1:51:03
    Author     : lordp
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<% 
   Producto prod = (Producto)request.getSession().getAttribute("prod1"); %>
<!DOCTYPE html>
<html>
    

  <!-- Page Content -->


    
    <!-- Page Features -->
<div class="container">

    <script type="text/javascript">
        
        function submitfamilia()
        {
            $('form#catalogofamilia').submit();
        }
        
    </script>
    
    <div class="row">

      <div class="col-lg-3">
        <h1 class="my-4">Categorías</h1>
        <div class="list-group">
            <%
                BD bd = new BD();
                String q = "select * from familia";
                ResultSet res = bd.read(q);
                res.next();
                do {%>
                        <form method='post' action='CatalogoFamilia' id="catalogofamilia">
                            <button onclick="submitfamilia()" class='list-group-item' type='submit'><% out.println(res.getString("NOMBRE_FAMILIA")); %></button>
                        <input type="hidden" style="display: none" name = 'dato' value = '<% out.println(res.getString("id_familia")); %>'>
                        </form>
                    <%} while (res.next());
                
            %>
        </div>
        </div>
      <!-- /.col-lg-3 -->
     




        <%
            String n = "select * from PRODUCTO where tipo_producto_id_tipoprod = " + prod.getTipo_producto_id_tipoprod();
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
                        
                        out.println("<div class='col-lg-9'>");
                        out.println("<div class='card mt-4'>");
                        out.println("<img class='card-img-top img-fluid' src='data:image/jpg;base64," + base64Image + "' alt=''>");
                        out.println("<div class='card-body'>");
                        out.println("<h3 class='card-title'>" + res1.getString("nombre") +"</h3>");
                        out.println("<h4> Precio unitario: $"+ res1.getString("precio_unitario") +"</h4>");
                        out.println("<p class='card-text'>"+ res1.getString("desc_producto") +"</p>");
                        out.println("<span class='text-warning'>&#9733; &#9733; &#9733; &#9733; &#9734;</span>");
                        out.println("</form>");
                        out.println("4.0 stars");
                        out.println("<aside>");
                        out.println("<form method='post' action='AgregarAlCarro'>");
                        out.println("<div class='quantity'>");
                        out.println("Cantidad <input type='number' name='cantidad' width='100px'");
                        out.println("</div>");
                        out.println("</form>");
                        out.println("<a href='#' class='btn btn-success'>+</a> Agregar al Carro");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                        
                        
                        
                        
                        
                        /* REVIEWS */ %>
                        <div class="card card-outline-secondary my-4">
                        <div class="card-header">
                          Product Reviews
                        </div>
                        <div class="card-body">
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                          <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                          <hr>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                          <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                          <hr>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                          <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                          <hr>
                          <a href="#" class="btn btn-success">Leave a Review</a>
                        </div>
                      </div>
                        
                   <% out.println("</div>"); } while (res1.next());
            }else{
                out.println("<p>No hay productos en esta categoria</p>");
            }
            
        %>    
        

        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->




  <!-- Footer -->

 <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  
    </body>
</html>
