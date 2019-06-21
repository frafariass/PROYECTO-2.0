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
      System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\cable.jpg",
               "tipo_producto", "tipoprod_imagen", 104L, "id_tipoprod"));
              System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\clavos.jpg",
            "tipo_producto", "tipoprod_imagen", 101L, "id_tipoprod"));
               System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\tornillos.jpg",
              "tipo_producto", "tipoprod_imagen", 103L, "id_tipoprod"));
                       System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\tuercas.jpg",
            "tipo_producto", "tipoprod_imagen", 102L, "id_tipoprod"));
                                System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\plagas.jpg",
             "tipo_producto", "tipoprod_imagen", 107L, "id_tipoprod"));
                                    System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\tuberia.jpg",
               "tipo_producto", "tipoprod_imagen", 106L, "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\productos\\clavogrande.jpg",
                "producto", "imagen", 10110100000000101L, "id_producto"));
                                       
      String fechavenctest = "21062019";
      String fechavenc = "";
      fechavenc = fechavenctest.substring(0,2);
        fechavenc = fechavenc + "-" + fechavenctest.substring(2,4);
        fechavenc = fechavenc + "-" + fechavenctest.substring(4,fechavenctest.length());
        System.out.println(fechavenc);

        
       
       
    }
    
}
