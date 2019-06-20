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
        int contador_proveedores = 100;
        int contador_proveedores2 = 100;
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
            var current = $('#current').val();
            
            if(idprov !== "0")
            {
                $('#last').val(idprov.toString()+"select");
                $('#current').val(idprov.toString()+"select");
                document.getElementById("0").style.display = "none";
                document.getElementById(ultimo.toString()).style.display = "none";
                document.getElementById(idprov+"select").style.display = "block";
            }else
            {
                document.getElementById(ultimo.toString()).style.display = "none";
                document.getElementById("0").style.display = "block";
            } 
        }
        
        function cargarProductoss()
        {
            document.getElementById("test").value = document.getElementById("10110100000000101").innerHTML.split(', ')[1];
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
                                            contador_proveedores++;
                                            contador_proveedores2++;
                                            out.println("<option value='"+res.getString("id_perf") +"'>"+res.getString("nombre_user")+"</option>");
                                        }while(res.next());
                                    }
                                %>
                        </select>
                    </tr>
                    <input style="display: none" id="last" value="0">
                    <input style="display: none" id="current" name="current" value="0">
                    <tr>
                        <td>Seleccionar Producto</td>
                        <td id="selects">
                            <%
                                q = "select id_producto, nombre, perfil_id_perf, precio_unitario from producto";
                                res = bd.read(q);
                                out.println("<select id='0'><option>Éste proveedor no tiene productos</option></select>");                                                          
                                String relleno = "";
                                if(res.next())
                                {
                                    
                                    
                                    int b;
                                    for (int i = 101; i < contador_proveedores+1; i++) {
                                        res.first();
                                        relleno = "";
                                        b = Integer.parseInt(res.getString("perfil_id_perf"));
                                        do
                                        {
                                            if(b == i)
                                            {
                                               relleno = relleno + "<option value='"+ res.getString("id_producto") +"' id='"+ res.getString("id_producto") +"'>" + res.getString("nombre")+", $"+ res.getString("precio_unitario") + "</option>"; 
                                            }
                                        }while (res.next());
                                        
                                        out.println("<select style='display: none' id='" + i + "select' onmouseover='cargarProductoss()'></select>");
                                        String inputstring = i + "input";
                                        %>
                                        <input style="display: none" id="<%=inputstring%>" value="<%=relleno%>">
                                        <%b = 0;
                                    } 
                                }                             
                            %>
                            <input style="display: block" id="test" value="eee">
                        </td>
                    </tr>
                </table>
            
            </form>
        </div>
        
                        <script type="text/javascript">
                            $(window).on('load', function()
                            {
                                var a = "<%= contador_proveedores2%>";
                                a = parseInt(a,10);
                                for (var i = 101; i < a+1; i++) {
                                    document.getElementById(i.toString() + "select").innerHTML = document.getElementById(i.toString() + "input").value;
                                }
                            });
                        </script>
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
