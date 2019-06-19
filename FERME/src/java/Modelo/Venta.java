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
public class Venta {
    
    private int id_boleta;
    private String fecha_boleta;
    private int total_venta;
    private int tipo_venta_id_tipoventa;
    private int estado_id_estado;

    public Venta(int id_boleta, String fecha_boleta, int total_venta, int tipo_venta_id_tipoventa, int estado_id_estado) {
        this.id_boleta = id_boleta;
        this.fecha_boleta = fecha_boleta;
        this.total_venta = total_venta;
        this.tipo_venta_id_tipoventa = tipo_venta_id_tipoventa;
        this.estado_id_estado = estado_id_estado;
    }

    public int getId_boleta() {
        return id_boleta;
    }

    public void setId_boleta(int id_boleta) {
        this.id_boleta = id_boleta;
    }

    public String getFecha_boleta() {
        return fecha_boleta;
    }

    public void setFecha_boleta(String fecha_boleta) {
        this.fecha_boleta = fecha_boleta;
    }

    public int getTotal_venta() {
        return total_venta;
    }

    public void setTotal_venta(int total_venta) {
        this.total_venta = total_venta;
    }

    public int getTipo_venta_id_tipoventa() {
        return tipo_venta_id_tipoventa;
    }

    public void setTipo_venta_id_tipoventa(int tipo_venta_id_tipoventa) {
        this.tipo_venta_id_tipoventa = tipo_venta_id_tipoventa;
    }

    public int getEstado_id_estado() {
        return estado_id_estado;
    }

    public void setEstado_id_estado(int estado_id_estado) {
        this.estado_id_estado = estado_id_estado;
    }
    
    
    
}
