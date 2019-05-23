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
public class perfil_prod {
    
    public int perfil_id_perf;
    public String producto_id_producto;

    public perfil_prod(int perfil_id_perf, String producto_id_producto) {
        this.perfil_id_perf = perfil_id_perf;
        this.producto_id_producto = producto_id_producto;
    }

    public int getPerfil_id_perf() {
        return perfil_id_perf;
    }

    public void setPerfil_id_perf(int perfil_id_perf) {
        this.perfil_id_perf = perfil_id_perf;
    }

    public String getProducto_id_producto() {
        return producto_id_producto;
    }

    public void setProducto_id_producto(String producto_id_producto) {
        this.producto_id_producto = producto_id_producto;
    }
    
}
