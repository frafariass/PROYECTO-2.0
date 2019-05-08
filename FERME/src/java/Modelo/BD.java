/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author lordp
 */
public class BD {

    public BD() {
    }
    
    public String conectar() //se conecta a la BD con las credenciales que estamos usando 
    {
        String conexion = '"' + "jdbc:oracle:thin:@localhost:1521:XE" + '"';
        String usuario = '"' + "FERRETERIA" + '"';
        String pass = '"' + "123" + '"';
        conexion = conexion + "," + usuario + "," + pass  ;
        return conexion;
    }
    
    //despues de conectar, necesitan declarar el tipo de operacion que haran query o update
    //ojo, es una declaracion por operacion
    public String statementUpdate() //declarar que es update
    {
        String consulta = "conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_UPDATABLE);";
        return consulta;
    }
    
    public String statementRead() //declarar que es read
    {
        String consulta = "conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE , ResultSet.CONCUR_READ_ONLY);";
        return consulta;
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
