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
public class vnt_prod {
    
    public int venta_id_boleta;
    public String producto_id_producto;

    public vnt_prod(int venta_id_boleta, String producto_id_producto) {
        this.venta_id_boleta = venta_id_boleta;
        this.producto_id_producto = producto_id_producto;
    }

    public int getVenta_id_boleta() {
        return venta_id_boleta;
    }

    public void setVenta_id_boleta(int venta_id_boleta) {
        this.venta_id_boleta = venta_id_boleta;
    }

    public String getProducto_id_producto() {
        return producto_id_producto;
    }

    public void setProducto_id_producto(String producto_id_producto) {
        this.producto_id_producto = producto_id_producto;
    }
    
}
