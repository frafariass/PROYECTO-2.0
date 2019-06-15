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
                "tipo_producto", "tipoprod_imagen", 4, "id_tipoprod"));
              System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\construccion\\clavos.jpg",
                "tipo_producto", "tipoprod_imagen", 1, "id_tipoprod"));
                     System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\construccion\\tornillos.jpg",
                "tipo_producto", "tipoprod_imagen", 3, "id_tipoprod"));
                            System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\construccion\\tuercas.jpg",
                "tipo_producto", "tipoprod_imagen", 2, "id_tipoprod"));
                                   System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\plagas.jpg",
                "tipo_producto", "tipoprod_imagen", 7, "id_tipoprod"));
                                          System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\tuberia.jpg",
                "tipo_producto", "tipoprod_imagen", 6, "id_tipoprod"));
       
    }
    
}
