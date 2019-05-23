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
public class Usuario {
    
    public int rut_user;
    public char dv_user;
    public String nombre_user;      
    public String apellido_user;
    public String email_user;
    public String contrasena;       
    public String direccion_user;   
    public String fono_user;
    public int rubro_id_rubro;
    public int estado;

    public Usuario(int rut_user, char dv_user, String nombre_user, String apellido_user, String email_user, String contrasena, String direccion_user, String fono_user, int rubro_id_rubro, int estado) {
        this.rut_user = rut_user;
        this.dv_user = dv_user;
        this.nombre_user = nombre_user;
        this.apellido_user = apellido_user;
        this.email_user = email_user;
        this.contrasena = contrasena;
        this.direccion_user = direccion_user;
        this.fono_user = fono_user;
        this.rubro_id_rubro = rubro_id_rubro;
        this.estado = estado;
    }

    public int getRut_user() {
        return rut_user;
    }

    public void setRut_user(int rut_user) {
        this.rut_user = rut_user;
    }

    public char getDv_user() {
        return dv_user;
    }

    public void setDv_user(char dv_user) {
        this.dv_user = dv_user;
    }

    public String getNombre_user() {
        return nombre_user;
    }

    public void setNombre_user(String nombre_user) {
        this.nombre_user = nombre_user;
    }

    public String getApellido_user() {
        return apellido_user;
    }

    public void setApellido_user(String apellido_user) {
        this.apellido_user = apellido_user;
    }

    public String getEmail_user() {
        return email_user;
    }

    public void setEmail_user(String email_user) {
        this.email_user = email_user;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getDireccion_user() {
        return direccion_user;
    }

    public void setDireccion_user(String direccion_user) {
        this.direccion_user = direccion_user;
    }

    public String getFono_user() {
        return fono_user;
    }

    public void setFono_user(String fono_user) {
        this.fono_user = fono_user;
    }

    public int getRubro_id_rubro() {
        return rubro_id_rubro;
    }

    public void setRubro_id_rubro(int rubro_id_rubro) {
        this.rubro_id_rubro = rubro_id_rubro;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    
    
    
}
