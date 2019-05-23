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
    
    public ResultSet read(String q) //se conecta a la BD con las credenciales que estamos usando 
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
        Class.forName ("oracle.jdbc.OracleDriver");
        BD bd = new BD();
        Connection conexion = BD.conectar();
        Statement consulta = BD.statementUpdate();
        String q = "INSERT INTO USUARIO VALUES " + (ATRIBUTOS);
        consulta.executeUpdate(q);
        
        SI QUIEREN REDIRECCIONAR DESPUES
        request.getRequestDispatcher("exito.jsp").forward(request, response);
    
    Para read (consultas)
        Class.forName ("oracle.jdbc.OracleDriver");
        BD bd = new BD();
        Connection conexion = BD.conectar();
        Statement consulta = BD.statementRead();
        String q = "SELECT * FROM USUARIO"; 
        ResultSet res = consulta.executeQuery(q);  (res tendra los resultados de la query)
        res.last(); o res.next();  (para que el resulset "avance", no pregunten, asi funciona)
        String resultado = res.getString("nombre");  esto deberia retornar el nombre de la ultima o primera fila, dependiendo de lo que eligieron arriba
        
    
    
    */
    
}
