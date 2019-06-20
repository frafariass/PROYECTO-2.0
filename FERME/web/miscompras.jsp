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
        if(usu == null)
        {
            response.sendRedirect("index.jsp");
        }
        
        BD bd = new BD();
        String q = "select numero_boleta, sum(total_venta), TO_CHAR(FECHA_BOLETA, 'DD-MM-YYYY') AS FECHA_BOLETA from venta where usuario_id_usuario = "
                + usu.getId_user() + " group by numero_boleta, FECHA_BOLETA";
        ResultSet res = bd.read(q);
        


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
                
              <table class="table">
                  <tr>
                      <td><b>NÚMERO DE BOLETA</b></td><td><b>FECHA</b></td><td><b>VALOR TOTAL</b></td>
                  </tr>
                      <%
                            if(res.next())
                            {
                                String nombreboleta = "";
                                do {
                                     nombreboleta = "boleta" + res.getString("numero_boleta"); 
                                    %>
                                  <tr>
                                    <td><%= res.getString("numero_boleta") %></td><td><%= res.getString("fecha_boleta") %></td><td><%= res.getString("sum(total_venta)") %></td>
                                    <form method="post" action="EspecificacionBoleta">
                                    <td><input type="submit" value="Ver detalle" name="submitboleta" id="submitboleta"><input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>"></td>
                                    </form>
                                  </tr>
                                <% } while (res.next()); %>
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
