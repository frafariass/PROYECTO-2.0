<%-- 
    Document   : usuanular
    Created on : 15-06-2019, 5:05:21
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    
    <%
        if(perfil.rol_id_rol != 1)
        {
            response.sendRedirect("index.jsp");
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
