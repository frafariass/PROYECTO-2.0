/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author lordp
 */
public class BD {

    public BD() {
    }
    
    public void update(String q) //se conecta a la BD con las credenciales que estamos usando 
    {
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conexion = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","FERRETERIA","123");
            Statement consulta = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_UPDATABLE);
            consulta.executeUpdate(q);
            conexion.close();
        }catch(ClassNotFoundException | SQLException e)
        {
        }
        
    }
    
    public ResultSet read(String q) //Ingresar la query en el argumento, pasos a seguir en los ejemplos abajo
    {
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conexion = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","FERRETERIA","123");
            Statement consulta = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);  
            ResultSet res = consulta.executeQuery(q);
            return res;
        }catch(ClassNotFoundException | SQLException e)
        {
            return null;
        }
        
    }
    
    /*
    
    EJEMPLOS
    
    (no estoy seguro que funcione asi ya que jamas he hecho funcionar esto con oracle,
         tengo fe eso si xd)
    
    Para update (crear, eliminar, modificar)
        BD bd = new BD();            
        String q = "insert into usuario "
                          + "values ('"+rutint+"', '"+digitochar+"', "
                           + "'"+nombre+"', '"+apellido+"', '"+email+"', '"+clavecifrada+"', '"+direccion+"', "+telefono+", "+1+", "+1+")";
        bd.update(q);
        
       
    
    Para read (consultas)
        String q = "select * from usuario where rut_user = " +rutint+ " and " + "contrasena = '" +clavecifrada+"'";  la query           
        ResultSet res = bd.read(q);   ejecutando la query
        res.next();  "moviendo la query" al primer resultado
        Usuario usu = new Usuario(Integer.parseInt(res.getString("rut_user")), res.getString("dv_user").charAt(0), 
            res.getString("nombre_user"), res.getString("apellido_user"), 
            res.getString("email_user"), res.getString("contrasena"), 
            res.getString("direccion_user"), res.getString("fono_user"), 
            Integer.parseInt(res.getString("rubro_id_rubro")), Integer.parseInt(res.getString("estado")));   creando un usuario a partir del usuario obtenido en la BD
        
        
     SI QUIEREN REDIRECCIONAR DESPUES
        response.sendRedirect("login.jsp"); esto todo se hace en un SERVLET (controlador)
    
    */
    
}
