/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.FileNotFoundException;

/**
 *
 * @author lordp
 */
public class ConsolaTest {
    
    public static void main(String[] args) throws FileNotFoundException
    {
        BD bd = new BD();
      System.out.println(bd.insertarImagenIdVarchar("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\cable.jpg",
                "tipo_producto", "tipoprod_imagen", "004", "id_tipoprod"));
              System.out.println(bd.insertarImagenIdVarchar("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\clavos.jpg",
             "tipo_producto", "tipoprod_imagen", "001", "id_tipoprod"));
               System.out.println(bd.insertarImagenIdVarchar("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\tornillos.jpg",
              "tipo_producto", "tipoprod_imagen", "003", "id_tipoprod"));
                        System.out.println(bd.insertarImagenIdVarchar("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\tuercas.jpg",
             "tipo_producto", "tipoprod_imagen", "002", "id_tipoprod"));
                                System.out.println(bd.insertarImagenIdVarchar("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\plagas.jpg",
              "tipo_producto", "tipoprod_imagen", "007", "id_tipoprod"));
                                    System.out.println(bd.insertarImagenIdVarchar("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\tuberia.jpg",
         "tipo_producto", "tipoprod_imagen", "006", "id_tipoprod"));
                                         System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\productos\\clavogrande.jpg",
                "producto", "imagen", 101, "id_producto"));

        
       
       
    }
    
}
