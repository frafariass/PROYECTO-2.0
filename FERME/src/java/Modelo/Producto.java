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
public class Producto {
    public String id_producto;                 
    public String desc_producto;               
    public int precio_unitario;            
    public int precio_compra;               
    public int stock;                       
    public int stock_critico;               
    public String fecha_venc;                  
    public int familia_id_familia;           
    public int tipo_producto_id_tipoprod;   
    public int estado;

    public Producto(String id_producto, String desc_producto, int precio_unitario, int precio_compra, int stock, int stock_critico, String fecha_venc, int familia_id_familia, int tipo_producto_id_tipoprod, int estado) {
        this.id_producto = id_producto;
        this.desc_producto = desc_producto;
        this.precio_unitario = precio_unitario;
        this.precio_compra = precio_compra;
        this.stock = stock;
        this.stock_critico = stock_critico;
        this.fecha_venc = fecha_venc;
        this.familia_id_familia = familia_id_familia;
        this.tipo_producto_id_tipoprod = tipo_producto_id_tipoprod;
        this.estado = estado;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getDesc_producto() {
        return desc_producto;
    }

    public void setDesc_producto(String desc_producto) {
        this.desc_producto = desc_producto;
    }

    public int getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(int precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    public int getPrecio_compra() {
        return precio_compra;
    }

    public void setPrecio_compra(int precio_compra) {
        this.precio_compra = precio_compra;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStock_critico() {
        return stock_critico;
    }

    public void setStock_critico(int stock_critico) {
        this.stock_critico = stock_critico;
    }

    public String getFecha_venc() {
        return fecha_venc;
    }

    public void setFecha_venc(String fecha_venc) {
        this.fecha_venc = fecha_venc;
    }

    public int getFamilia_id_familia() {
        return familia_id_familia;
    }

    public void setFamilia_id_familia(int familia_id_familia) {
        this.familia_id_familia = familia_id_familia;
    }

    public int getTipo_producto_id_tipoprod() {
        return tipo_producto_id_tipoprod;
    }

    public void setTipo_producto_id_tipoprod(int tipo_producto_id_tipoprod) {
        this.tipo_producto_id_tipoprod = tipo_producto_id_tipoprod;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
}
