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
       System.out.println(bd.insertarImagen("C:\\Users\\lordp\\Desktop\\PROYECTO 2.0\\images\\tipo_producto\\construccion\\productos\\clavogrande.jpg",
                "producto", "imagen", 1, "id_producto"));
       
    }
    
}
