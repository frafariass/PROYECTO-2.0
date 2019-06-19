<%-- 
    Document   : ocgenerar
    Created on : 15-06-2019, 5:04:25
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<!DOCTYPE html>
<html>
    
    <%
        if(perfil.rol_id_rol != 1 || perfil.rol_id_rol != 2)
        {
            response.sendRedirect("index.jsp");
        }
    %>
    
    <body>
        <h1>Generar Orden de Compra</h1>
        <div class="generaroc">
            <form>
                <table>
                    <tr>
                        <td>Seleccionar Proveedor</td><td><select name="proveedores">
                                <!--Query para rellenar select PROVEEDORES -->
                                <%
                                    BD bd = new BD();
                                    String q = "select * from perfil pe join usuario us "
                                            + "on (pe.usuario_rut_user=us.rut_user) "
                                            + "where pe.rol_id_rol=5";
                                    ResultSet res = bd.read(q);
                                    
                                    if(!res.next()){
                                        out.println("<option value='0' selected>No hay proveedores</option>");
                                    }else{
                                        do{
                                            out.println("<option value='"+res.getInt("id_perf") +"'>"+res.getString("nombre_user")+"</option>");
                                        }while(res.next());
                                    }
                                %>
                        </select></td>
                    </tr>
                </table>
            
            </form>
        </div>
        
        
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
