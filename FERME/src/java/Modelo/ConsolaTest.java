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
public class ConsolaTest {
    
    public static void main(String[] args)
    {
        String rut = "193622879";
        int rutint = 19362287;
        String clavecifrada = "asd";
        String q = "select * from cliente where rut = " +rutint+ " and " + "clave = '" +clavecifrada+"'";  
        System.out.println(q);
    }
    
}
