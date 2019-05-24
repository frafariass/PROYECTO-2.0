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
        String pw = "rttr";
        Cifrado ci = new Cifrado();
        System.out.println(ci.cifrar(pw));
        /*fbc3506e98f0b0b8cbb9deb935d6aaac000f08614c63d43052dcd2fd196e9fddaec693cd4f5e3addd61c52fa3367a15c88841c434fc39fab465a00dc00b62c7f*/
    }
    
}
