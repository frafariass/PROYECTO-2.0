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
public class TipoProducto {
    
    public int id_tipoprod;
    public String nombre_tipoprod;

    public int getId_tipoprod() {
        return id_tipoprod;
    }

    public void setId_tipoprod(int id_tipoprod) {
        this.id_tipoprod = id_tipoprod;
    }

    public String getNombre_tipoprod() {
        return nombre_tipoprod;
    }

    public void setNombre_tipoprod(String nombre_tipoprod) {
        this.nombre_tipoprod = nombre_tipoprod;
    }

    public TipoProducto(int id_tipoprod, String nombre_tipoprod) {
        this.id_tipoprod = id_tipoprod;
        this.nombre_tipoprod = nombre_tipoprod;
    }
    
}
