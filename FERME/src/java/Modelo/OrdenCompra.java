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
public class OrdenCompra {
    
    public int id_orden;
    public int fecha_creacion;
    public int total_compra;
    public int estado_id_estado;

    public OrdenCompra(int id_orden, int fecha_creacion, int total_compra, int estado_id_estado) {
        this.id_orden = id_orden;
        this.fecha_creacion = fecha_creacion;
        this.total_compra = total_compra;
        this.estado_id_estado = estado_id_estado;
    }

    public int getId_orden() {
        return id_orden;
    }

    public void setId_orden(int id_orden) {
        this.id_orden = id_orden;
    }

    public int getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(int fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public int getTotal_compra() {
        return total_compra;
    }

    public void setTotal_compra(int total_compra) {
        this.total_compra = total_compra;
    }

    public int getEstado_id_estado() {
        return estado_id_estado;
    }

    public void setEstado_id_estado(int estado_id_estado) {
        this.estado_id_estado = estado_id_estado;
    }

    
}
