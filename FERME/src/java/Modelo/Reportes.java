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
public class Reportes {
    
    private int id_reporte;
    private String contenido_reporte;
    private int fecha_reporte;
    private int perfil_id_perf;
    private int tipo_reporte_id_trep;

    public Reportes(int id_reporte, String contenido_reporte, int fecha_reporte, int perfil_id_perf, int tipo_reporte_id_trep) {
        this.id_reporte = id_reporte;
        this.contenido_reporte = contenido_reporte;
        this.fecha_reporte = fecha_reporte;
        this.perfil_id_perf = perfil_id_perf;
        this.tipo_reporte_id_trep = tipo_reporte_id_trep;
    }

    public Reportes() {
    }
    
    

    public int getId_reporte() {
        return id_reporte;
    }

    public void setId_reporte(int id_reporte) {
        this.id_reporte = id_reporte;
    }

    public String getContenido_reporte() {
        return contenido_reporte;
    }

    public void setContenido_reporte(String contenido_reporte) {
        this.contenido_reporte = contenido_reporte;
    }

    public int getFecha_reporte() {
        return fecha_reporte;
    }

    public void setFecha_reporte(int fecha_reporte) {
        this.fecha_reporte = fecha_reporte;
    }

    public int getPerfil_id_perf() {
        return perfil_id_perf;
    }

    public void setPerfil_id_perf(int perfil_id_perf) {
        this.perfil_id_perf = perfil_id_perf;
    }

    public int getTipo_reporte_id_trep() {
        return tipo_reporte_id_trep;
    }

    public void setTipo_reporte_id_trep(int tipo_reporte_id_trep) {
        this.tipo_reporte_id_trep = tipo_reporte_id_trep;
    }
    
    
}
