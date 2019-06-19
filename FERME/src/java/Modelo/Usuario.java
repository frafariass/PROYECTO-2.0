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
    
    private int rut_user;
    private char dv_user;
    private String nombre_user;      
    private String apellido_user;
    private String email_user;
    private String contrasena;       
    private String direccion_user;   
    private String fono_user;
    private int estado;
    private int rubro_id_rubro;

    public Usuario(int rut_user, char dv_user, String nombre_user, String apellido_user, String email_user, String contrasena, String direccion_user, String fono_user, int estado, int rubro_id_rubro) {
        this.rut_user = rut_user;
        this.dv_user = dv_user;
        this.nombre_user = nombre_user;
        this.apellido_user = apellido_user;
        this.email_user = email_user;
        this.contrasena = contrasena;
        this.direccion_user = direccion_user;
        this.fono_user = fono_user;
        this.estado = estado;
        this.rubro_id_rubro = rubro_id_rubro;
    }

    public Usuario() {
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
