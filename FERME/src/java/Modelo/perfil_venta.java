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
public class perfil_venta {
    
    public int perfil_id_perf;
    public int venta_id_boleta;

    public perfil_venta(int perfil_id_perf, int venta_id_boleta) {
        this.perfil_id_perf = perfil_id_perf;
        this.venta_id_boleta = venta_id_boleta;
    }

    public int getPerfil_id_perf() {
        return perfil_id_perf;
    }

    public void setPerfil_id_perf(int perfil_id_perf) {
        this.perfil_id_perf = perfil_id_perf;
    }

    public int getVenta_id_boleta() {
        return venta_id_boleta;
    }

    public void setVenta_id_boleta(int venta_id_boleta) {
        this.venta_id_boleta = venta_id_boleta;
    }
    
    
}
