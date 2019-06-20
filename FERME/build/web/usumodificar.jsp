<%-- 
    Document   : usumodificar
    Created on : 15-06-2019, 5:05:43
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<% Usuario usubuscar = (Usuario)request.getSession().getAttribute("usubuscar1");%> 
<!DOCTYPE html>
<html>

    <script type="text/javascript">
        
        function validarrut()
        {
            jQuery("#submiteditar").prop('disabled', true);
            var rut = document.getElementById("rut").value;
            if(rut.charAt(0) === "0")
            {
                rut = rut.substring(1,rut.length);
            }
            rut = rut.replace(".", "");
            rut = rut.trim();
            var rutsinguion = rut;
            rutsinguion = rutsinguion.replace("-", "");
            
            if(rutsinguion.length === 8 || rutsinguion.length === 9)
            {
                var indicefor = 0;
                if (rutsinguion.length === 8) {
                    indicefor = 1;
                }

                var total = 0;
                var i;
                    for (i = 7; i >= indicefor; i--) {
                        var valor = rut.charAt(i) - '0';
                        if (rutsinguion.length === 8) {
                            valor = (rut.charAt(i-1)) - '0';
                        }
                        switch(i){
                            case 0:
                                total += valor * 3;
                                break;
                            case 1: 
                                total += valor * 2;
                                break;
                            case 2: 
                                total += valor * 7;
                                break;
                            case 3: 
                                total += valor * 6;
                                break;
                            case 4: 
                                total += valor * 5;
                                break;
                            case 5: 
                                total += valor * 4;
                                break;
                            case 6: 
                                total += valor * 3;
                                break;
                            case 7: 
                                total += valor * 2;
                                break;
                            default:
                                break;
                        }
                    }

                var resto = total % 11;
                resto = 11 - resto;
                var digitocalculado = resto;
                if (resto === 10) {
                    digitocalculado = "k";
                }
                var digitorutingresado = rut.charAt(rut.length-1);
                if(digitorutingresado === "K")
                {
                    digitorutingresado = "k";
                }
                digitocalculado = digitocalculado.toString();

                if(digitocalculado !== digitorutingresado)
                {
                    document.getElementById("prut").innerHTML = "El rut no es válido";
                    return false;
                }else
                {
                    jQuery("#submiteditar").prop('disabled', false);
                    document.getElementById("prut").innerHTML = "<font color='red'></font>";
                    return true;
                }
            }else
            {
                document.getElementById("prut").innerHTML = "El rut no es válido";
                return false;
            }
        }
        //fin validacion rut
        
        function validartelefono()
        {
            jQuery("#submiteditar").prop('disabled', true);
            var telefono = document.getElementById("telefono").value;
            if(telefono.length !== 9 && telefono.length !== 0)
            {
                document.getElementById("ptelefono").innerHTML = "El teléfono debe tener 9 números";
                return false;
            }else
            {
                jQuery("#submiteditar").prop('disabled', false);
                document.getElementById("ptelefono").innerHTML = "";
                return true;
            }
        }
        //fin validacion telefono
        
        //validacion email
        function validaremail()
        {
            jQuery("#submiteditar").prop('disabled', true);
            var email = document.getElementById("email").value;
            if(!email.includes("@"))
            {
                document.getElementById("pemail").innerHTML = "El email no es válido";
                return false;
            }else
            {
                jQuery("#submiteditar").prop('disabled', false);
                document.getElementById("pemail").innerHTML = "";
                return true;
            }
        }
        //fin validacion email
        
        //validacion nombre
        function validarnombre()
        {
            jQuery("#submiteditar").prop('disabled', true);
            var nombre = document.getElementById("nombre").value;
            if(nombre.length === 1)
            {
                document.getElementById("pnombre").innerHTML = "El nombre no es válido";
                return false;
            }else
            {
                jQuery("#submiteditar").prop('disabled', false);
                document.getElementById("pnombre").innerHTML = "";
                return true;
            }   
        }
        //fin validacion nombre
        
        //validacion de claves
        //cifrado clave, siempre hacer el cifrado ANTES de enviarlo al servidor
        //esto es para mas seguridad
        function validarclaves()
        {
            jQuery("#submiteditar").prop('disabled', true);
            var clave = document.getElementById("nuevaclave").value;
            var conclave = document.getElementById("connuevaclave").value;
            if(clave !== conclave)
            {
                document.getElementById("pconclave").innerHTML = "Las contraseñas no coinciden";
                return false;
            }else
            {
                jQuery("#submiteditar").prop('disabled', false);
                document.getElementById("pconclave").innerHTML = "";
                return true;
            }
        }
        
        function cifrado() {
            
            jQuery("#submiteditar").prop('disabled', true);
            if(validarclaves())
            {
                var clavecifrada = new PBKDF2(document.getElementById("nuevaclave").value, 1234, 1000, 32);
                var status_callback = function(percent_done) {};
                var result_callback = function(key) {
                    document.getElementById("nuevaclavesecreta").value = key;
                    jQuery("#submiteditar").prop('disabled', false);
                    return true;               
                };
                clavecifrada.deriveKey(status_callback, result_callback);          
            }else
            {
                return false;
            }
        }
        
        
        $(window).on('load', function()
        {
            $("#submiteditar").prop('disabled', true);
            <% String rut = usubuscar.getRut_user() +"-" + usubuscar.getDv_user() + ""; 
                BD bd = new BD();
                String q = "select * from rol";
                ResultSet res = bd.read(q);
                res.next();
                String relleno = "";
                do {
                        relleno = relleno + "<option value='" + res.getString("id_rol") +"'>" + 
                                res.getString("nombre_rol") +"</option>";
                    } while (res.next());
                %>
                 document.getElementById("selectrol").innerHTML = "<%= relleno %>";
                <%                                            
                q = "select * from rubro";
                res = bd.read(q);
                res.next();
                String relleno2 = "";
                do {
                        relleno2 = relleno2 + "<option value='" + res.getString("id_rubro") +"'>" + 
                                res.getString("nombre_rubro") +"</option>";
                    } while (res.next());
            %>
            document.getElementById("selectrubro").innerHTML = "<%= relleno2 %>";
            
            var auxrubro = "<%= usubuscar.getRubro_id_rubro()%>";
            var auxrol = "<%= usubuscar.getRol_id_rol()%>";
            $("#selectrubro").val(auxrubro);
            $("#selectrol").val(auxrol);
            
            var rut = "<%= rut%>";
            var email = "<%= usubuscar.getEmail_user() %>";
            var telefono = "<%= usubuscar.getFono_user()%>";
            var direccion = "<%= usubuscar.getDireccion_user()%>";
            var nombre = "<%= usubuscar.getNombre_user()%>";
            var apellido = "<%= usubuscar.getApellido_user()%>";
            
            $("#nuevaclave").on("change paste keyup input", function() {
                cifrado();
            });
            $("#connuevaclave").on("change paste keyup input", function() {
                cifrado();
            });
            $("#nombre").on("change paste keyup input", function() {
                validarnombre();
            });
            $("#email").on("change paste keyup input", function() {
                validaremail();
            });
            $("#telefono").on("change paste keyup input", function() {
                validartelefono();
            });
            $("#rut").on("change paste keyup input", function() {
                validarrut();
            });
            
            $("#selectrol").on("change paste keyup input", function() {
                jQuery("#submiteditar").prop('disabled', false);
            });
            
            $("#selectrubro").on("change paste keyup input", function() {
                jQuery("#submiteditar").prop('disabled', false);
            });
            
            if(telefono === "0")
            {
                telefono = "";
            }
            if(apellido === "NO INGRESADO")
            {
                apellido = "";
            }
            if(direccion === "NO INGRESADO")
            {
                direccion = "";
            }
            
            
            $('#rut').val(rut);
            $('#email').val(email);
            $('#telefono').val(telefono);
            $('#direccion').val(direccion);
            $('#nombre').val(nombre);
            $('#apellido').val(apellido);
        });
        
        function validar()
        {
            var valido = true;
            
            if(!validarclaves())
            {
                valido = false;
            }
            
            if(!validarrut())
            {
                valido = false;
            }
            
            if(!validaremail())
            {
                valido = false;
            }
            
            if(!validarnombre())
            {
                valido = false;
            }
            
            if(!validartelefono())
            {
                valido = false;
            }
            if(valido)
            {
                jQuery("#submiteditar").prop('disabled', false);
            }else
            {
                jQuery("#submiteditar").prop('disabled', true);
            }
            return valido;
        }

    </script>

  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
   

    <!-- Page Features -->
    <div class="formularioregistro">

      <div id="ingresar">
            <h5>Sólo cambie los que desea</h5>
            <form mode="post" action="EditarPerfil" onsubmit="return validar()">
                <table class="table">
                    <tr>
                        <td>Rut:</td><td><input type="text" name="rut" id="rut" ><label ><font color="red" id="prut" name="prut"></font> </label></td>
                    </tr>
                    <tr>
                        <td>Email:</td><td><input type="email" name="email" id="email"><label><font id="pemail" name="pemail" color="red"></font> </label></td>
                    <tr>
                        <td>Nueva clave:</td><td><input type="password" name="nuevaclave" id="nuevaclave" > <input type="hidden" style="display: none" id="nuevaclavesecreta" name="nuevaclavesecreta"></td>
                    </tr>
                    <tr>
                        <td>Confirmar clave:</td><td><input type="password" name="connuevaclave" id="connuevaclave" ><label><font color="red" id="pconclave" name="pconclave"></font></label></td>
                    </tr>
                    <tr>
                        <td>Nombre:</td><td><input type="text" name="nombre" id="nombre"><label ><font color="red" id="pnombre" name="pnombre"></font> </label></td>
                    <tr>  
                    <tr>
                        <td>Apellido:</td><td><input type="text" name="apellido" id="apellido"></td>
                    <tr>
                    <tr>
                        <td>Dirección:</td><td><input type="text" name="direccion" id="direccion"></td>
                    <tr>
                    <tr>
                        <td>Teléfono de contacto:</td><td><input type="number" name="telefono" id="telefono"><label ><font color="red" id="ptelefono" name="ptelefono"> </font></label></td>
                    </tr>
                    <tr>
                        <td>Rubro:</td><td><select id="selectrubro" name="selectrubro"></select></td>
                    </tr>
                    <tr>
                        <td>Rol:</td><td><select id="selectrol" name="selectrol"></select></td>
                    </tr>
                    <tr>
                        <td></td><td><input type="submit" value="Modificar Perfil" name="submiteditar" id="submiteditar"></td>
                    </tr>
                    <input type="hidden" style="display: none" id="tipomod" name="tipomod" value="modadmin">
                </table>
            </form>
        </div>

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
