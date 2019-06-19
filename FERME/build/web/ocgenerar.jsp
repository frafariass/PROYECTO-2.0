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

    
    <script type="text/javascript">
        
        function cargarProductos()
        {
            var idprov = $('#i_proveedores').val();
            var ultimo = $('#last').val();
            if(idprov !== "0")
            {
                $('#last').val(idprov.toString());
                document.getElementById("0").style.display = "none";
                document.getElementById(ultimo.toString()).style.display = "none";
                document.getElementById(idprov).style.display = "block";
            }else
            {
                document.getElementById(ultimo.toString()).style.display = "none";
                document.getElementById("0").style.display = "block";
            } 
        }
        
    </script>
    
    <body>
        <h1>Generar Orden de Compra</h1>
        <div class="generaroc">
            <form action="" method="post" id="data">
                <table>
                    <tr>
                        <td>Seleccionar Proveedor</td>
                        <td>
                            <select id="i_proveedores" name="proveedores" onchange="cargarProductos()">
                                <!--Query para rellenar select PROVEEDORES -->
                                <%
                                    BD bd = new BD();
                                    String q = "select * from perfil pe join usuario us "
                                            + "on (pe.usuario_rut_user=us.rut_user) "
                                            + "where pe.rol_id_rol = 5";
                                    ResultSet res = bd.read(q);
                                    out.println("<option value='0'>Seleccione un proveedor</option>");
                                    if(!res.next()){
                                        out.println("<option value='0' selected>No hay proveedores</option>");
                                    }else{
                                        do{
                                            out.println("<option value='"+res.getString("id_perf") +"'>"+res.getString("nombre_user")+"</option>");
                                        }while(res.next());
                                        res.last();
                                        int contador = Integer.parseInt(res.getString("id_perf"));
                                    }
                                %>
                        </select>
                    </tr>
                    <input style="display: none" id="last" value="0">
                    <tr>
                        <td>Seleccionar Producto</td>
                        <td id="selects">
                            <%
                                q = "select id_producto, nombre, perfil_id_perf from producto";
                                res = bd.read(q);
                                res.first();
                                int contador2;
                                out.println("<select id='0'><option></option></select>");
                                do
                                {
                                    contador2 = Integer.parseInt(res.getString("perfil_id_perf"));
                                    out.println("<select style='display: none' id='" + res.getString("perfil_id_perf") + "'><option value='"+ res.getString("id_producto") +"'>" + res.getString("nombre")+"</option></select>");
                                }while (res.next());
                            %>
                        </td>
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
