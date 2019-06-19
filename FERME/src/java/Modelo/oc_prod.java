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
public class oc_prod {
    
    private String producto_id_producto;
    private int orden_compra_id_orden;

    public oc_prod(String producto_id_producto, int orden_compra_id_orden) {
        this.producto_id_producto = producto_id_producto;
        this.orden_compra_id_orden = orden_compra_id_orden;
    }

    public oc_prod() {
    }
    
    

    public String getProducto_id_producto() {
        return producto_id_producto;
    }

    public void setProducto_id_producto(String producto_id_producto) {
        this.producto_id_producto = producto_id_producto;
    }

    public int getOrden_compra_id_orden() {
        return orden_compra_id_orden;
    }

    public void setOrden_compra_id_orden(int orden_compra_id_orden) {
        this.orden_compra_id_orden = orden_compra_id_orden;
    }
    
    
}
