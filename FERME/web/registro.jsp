<%-- 
    Document   : registro
    Created on : 23-05-2019, 0:42:18
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<% 
    
   if(request.getSession().getAttribute("usu1") != null)
   {
       response.sendRedirect("index.jsp");
   }
   
   %>
<!DOCTYPE html>
<html>
    
    <script type="text/javascript">
        function validar()
        {
            var valido = true;
            
            //validacion de telefono
            var telefono = document.getElementById("telefono").value;
            if(telefono.length !== 9 && telefono.length !== 0)
            {
                document.getElementById("ptelefono").innerHTML = "<font color='red'>* El teléfono debe tener 9 números</font>";
                valido = false;
            }else
            {
                document.getElementById("ptelefono").innerHTML = "<font color='red'>* </font>";
            }
            //fin validacion telefono
            
            //validacion rut, que sea valido el que esta ingresando
            var rut = document.getElementById("rut").value;
            rut = rut.replace(".", "");
            rut = rut.trim();
            var rutsinguion = rut;
            rutsinguion = rutsinguion.replace("-", "");

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
            
            digitocalculado = digitocalculado.toString();
            
            if(digitocalculado !== digitorutingresado)
            {
                document.getElementById("prut").innerHTML = "<font color='red'>* El rut no es válido</font>";
                valido = false;
            }else
            {
                document.getElementById("prut").innerHTML = "<font color='red'>* </font>";
            }
            //fin validacion rut
            
            //validacion de claves
            var clavecifrada = document.getElementById("clavesecreta").value;
            var conclavecifrada = document.getElementById("conclavesecreta").value;
            
            if(clavecifrada !== conclavecifrada)
            {
                valido = false;
            }
            //fin validacion claves
            
            //validacion email
            var email = document.getElementById("email").value;
            if(!email.includes("@"))
            {
                document.getElementById("pemail").innerHTML = "<font color='red'>* El email no es válido</font>";
                valido = false;
            }else
            {
                document.getElementById("pemail").innerHTML = "<font color='red'>* </font>";
            }
            var nombre = document.getElementById("nombre").value;
            if(nombre.length <= 1)
            {
                document.getElementById("pnombre").innerHTML = "<font color='red'>* El nombre no es válido</font>";
                valido = false;
            }else
            {
                document.getElementById("pnombre").innerHTML = "<font color='red'>* </font>";
            }

            
            return valido;
        }
        
        //cifrado clave, siempre hacer el cifrado ANTES de enviarlo al servidor
        //esto es para mas seguridad
        //la comparacion se ejecuta cada 1 segundo, avisando si no coinciden
        window.setInterval(comparacion, 1000);
        function comparacion()
        {
            var clavecifrada = document.getElementById("clavesecreta").value;
            var conclavecifrada = document.getElementById("conclavesecreta").value;
            if(clavecifrada !== conclavecifrada)
            {
                document.getElementById("pconclave").innerHTML = "<font color='red'>* Las contraseñas no coinciden</font>";
            }else
            {
                document.getElementById("pconclave").innerHTML = "<font color='red'>* </font>";
            }
        }
        
        //CIFRADO DE CLAVES, SE CIFRA CADA VEZ QUE EL USUARIO APRIETA UNA TECLA
        //esto es para que la contraseña se compare y valide
        window.onload = (function()
        {
            var timer = null;
            $('#conclave').keydown(function(){
                   clearTimeout(timer); 
                   timer = setTimeout(cifrado, 5)
            });
            $('#clave').keydown(function(){
                   clearTimeout(timer); 
                   timer = setTimeout(cifrado, 5)
            });
        });
        function cifrado() {
            
            var clavecifrada = new PBKDF2(document.getElementById("clave").value, 1234, 1000, 32);
            var status_callback = function(percent_done) {};
            var result_callback = function(key) {
                document.getElementById("clavesecreta").value = key;};
            clavecifrada.deriveKey(status_callback, result_callback);          

            var conclavecifrada = new PBKDF2(document.getElementById("conclave").value, 1234, 1000, 32);
            var status_callback1 = function(percent_done) {};
            var result_callback1 = function(key) {
                document.getElementById("conclavesecreta").value = key;};
            conclavecifrada.deriveKey(status_callback1, result_callback1);
            
        }
        
        
    </script>
    
    
  <!-- Page Content -->
  <div class="container">


    <!-- Page Features -->
    		<div id="status"></div>

    <div class="formularioregistro">

        <div id="registroDiv1">
            <h5>Registro</h5>
            <div id="registroDiv">
                <form method="post" action="Registro" onsubmit="return validar()">
                    <table>
                        <tr>
                            <td>Rut:</td><td><input type="text" name="rut" id="rut" ><label id="prut" name="prut"><font color="red">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Clave:</td><td><input type="password" name="clave" id="clave" ><font color="red">* </font> <input type="hidden" id="clavesecreta" name="clavesecreta"></td>
                        </tr>

                        <tr>
                            <td>Confirmar Clave:</td><td><input type="password" name="conclave" id="conclave" ><label id="pconclave" name="pconclave"><font color="red">* </font></label> <input type="hidden" id="conclavesecreta" name="conclavesecreta"></td>
                        </tr>
                        
                        <tr>
                            <td>Email:</td><td><input type="text" name="email" id="email" ><label id="pemail" name="pemail"><font color="red">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Nombre:</td><td><input type="text" name="nombre" id="nombre" ><label id="pnombre" name="pnombre"><font color="red">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Apellido:</td><td><input type="text" name="apellido" id="apellido" ><label id="papellido" name="papellido"></label></td>
                        </tr>
                        <tr>
                            <td>Direccion:</td><td><input type="text" name="direccion" id="direccion"></td>
                        </tr>

                        <tr>
                            <td>Teléfono de contacto:</td><td><input type="number" name="telefono" id="telefono"><label id="ptelefono" name="ptelefono"><font color="red"> </font></label></td>
                        </tr>

                        <tr>
                            <td><a href="javascript:window.history.back();">&laquo; Volver</a></td><td><input type="submit" value="Enviar" name="submitn"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
      
    </div>


  </div>
    <!-- /.row -->
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
