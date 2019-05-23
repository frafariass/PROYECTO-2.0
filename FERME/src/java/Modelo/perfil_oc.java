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
public class perfil_oc {
    
    public int perfil_id_perf;
    public int orden_compra_id_orden;

    public perfil_oc(int perfil_id_perf, int orden_compra_id_orden) {
        this.perfil_id_perf = perfil_id_perf;
        this.orden_compra_id_orden = orden_compra_id_orden;
    }

    public int getPerfil_id_perf() {
        return perfil_id_perf;
    }

    public void setPerfil_id_perf(int perfil_id_perf) {
        this.perfil_id_perf = perfil_id_perf;
    }

    public int getOrden_compra_id_orden() {
        return orden_compra_id_orden;
    }

    public void setOrden_compra_id_orden(int orden_compra_id_orden) {
        this.orden_compra_id_orden = orden_compra_id_orden;
    }
    
}
