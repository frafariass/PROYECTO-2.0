<%-- 
    Document   : usubuscarpaso2
    Created on : 20-06-2019, 3:24:33
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<% Usuario usubuscar = (Usuario)request.getSession().getAttribute("usubuscar1");%> 
<!DOCTYPE html>
<html>
    
    <body>
        <div class="container" style="overflow-x:auto;">
        <table class="table">
            <tr>
                <td><b>RUT</b></td><td><b>NOMBRE</b></td><td><b>EMAIL</b></td>
                <td><b>DIRECCION</b></td><td><b>FONO</b></td><td><b>ESTADO</b></td>
                <td><b>ID USUARIO</b></td><td><b>ROL</b></td><td><b>RUBRO</b></td>
            </tr>
        </table>
    </div>
   <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
