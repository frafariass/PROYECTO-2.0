<%-- 
    Document   : editarperfil
    Created on : 23-05-2019, 23:52:21
    Author     : lordp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<% 
   if(usu == null)
   {
       response.sendRedirect("login.jsp");
   }
   %>
<!DOCTYPE html>
<html>
    <script type="text/javascript">
        
        function validartelefono()
        {

            var telefono = document.getElementById("telefono").value;
            if(telefono.length !== 9 && telefono.length !== 0)
            {
                document.getElementById("ptelefono").innerHTML = "El teléfono debe tener 9 números";
                return false;
            }else
            {
                document.getElementById("ptelefono").innerHTML = "";
                return true;
            }
        }
        //fin validacion telefono
        
        //validacion email
        function validaremail()
        {
            var email = document.getElementById("email").value;
            if(!email.includes("@"))
            {
                document.getElementById("pemail").innerHTML = "El email no es válido";
                return false;
            }else
            {
                document.getElementById("pemail").innerHTML = "";
                return true;
            }
        }
        //fin validacion email
        
        //validacion nombre
        function validarnombre()
        {
            var nombre = document.getElementById("nombre").value;
            if(nombre.length === 1)
            {
                document.getElementById("pnombre").innerHTML = "El nombre no es válido";
                return false;
            }else
            {
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
            var clave = document.getElementById("nuevaclave").value;
            var conclave = document.getElementById("connuevaclave").value;
            if(clave !== conclave)
            {
                document.getElementById("pconclave").innerHTML = "Las contraseñas no coinciden";
                return false;
            }else
            {
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
        
        function cifradoclaveactual() {
            
            jQuery("#submiteditar").prop('disabled', true);
            if(validarclaves())
            {
                var clavecifrada = new PBKDF2(document.getElementById("clave").value, 1234, 1000, 32);
                var status_callback = function(percent_done) {};
                var result_callback = function(key) {
                    document.getElementById("clavesecreta").value = key;
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
            var email = "<%= usu.getEmail_user() %>";
            var telefono = "<%= usu.getFono_user()%>";
            var direccion = "<%= usu.getDireccion_user()%>";
            var nombre = "<%= usu.getNombre_user()%>";
            var apellido = "<%= usu.getApellido_user()%>";
            
            $("#nuevaclave").on("change paste keyup", function() {
                cifrado();
            });
            $("#connuevaclave").on("change paste keyup", function() {
                cifrado();
            });
            $("#clave").on("change paste keyup", function() {
                cifradoclaveactual();
            });
            $("#nombre").on("change paste keyup", function() {
                validarnombre();
            });
            $("#email").on("change paste keyup", function() {
                validaremail();
            });
            $("#telefono").on("change paste keyup", function() {
                validartelefono();
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
            $('#email').val(email);
            $('#telefono').val(telefono);
            $('#direccion').val(direccion);
            $('#nombre').val(nombre);
            $('#apellido').val(apellido);
        });
        
        function validar()
        {
            var valido = true;
            var claveusuariologeado = "<%= usu.getContrasena()%>";

            
            if(claveusuariologeado !== document.getElementById("clavesecreta").value)   
            {
                valido = false;
            }
            
            if(!validarclaves())
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
            <h5>Ingrese sus datos, los campos con * son necesarios</h5>
            <form mode="post" action="EditarPerfil" onsubmit="return validar()">
                <table class="table">
                    <tr>
                        <td>Clave actual:</td><td><input type="password" name="clave" id="clave" ><font color="red">* </font><input type="hidden" style="display: none" id="clavesecreta" name="clavesecreta"></td>
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
                        <td> Teléfono de contacto:</td><td><input type="number" name="telefono" id="telefono"><label ><font color="red" id="ptelefono" name="ptelefono"> </font></label></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Editar perfil" name="submiteditar" id="submiteditar"></td>
                    </tr>
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
