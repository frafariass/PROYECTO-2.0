<%-- 
    Document   : ocmodificar
    Created on : 15-06-2019, 5:04:15
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
            if(perfil.getRol_id_rol() != 1 && perfil.getRol_id_rol() != 2)
            {
                response.sendRedirect("index.jsp");
            }
        }
    %>
    
    <body>
        <h1>Hello World!</h1>
        <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
