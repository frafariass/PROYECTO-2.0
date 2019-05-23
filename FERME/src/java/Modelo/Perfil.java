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
public class Perfil {
    
    public int id_perf;                  
    public int usuario_rut_user;         
    public int rol_id_rol;               
    public int estado;                   
    public int usuario_rubro_id_rubro;   

    public Perfil(int id_perf, int usuario_rut_user, int rol_id_rol, int estado, int usuario_rubro_id_rubro) {
        this.id_perf = id_perf;
        this.usuario_rut_user = usuario_rut_user;
        this.rol_id_rol = rol_id_rol;
        this.estado = estado;
        this.usuario_rubro_id_rubro = usuario_rubro_id_rubro;
    }

    public int getId_perf() {
        return id_perf;
    }

    public void setId_perf(int id_perf) {
        this.id_perf = id_perf;
    }

    public int getUsuario_rut_user() {
        return usuario_rut_user;
    }

    public void setUsuario_rut_user(int usuario_rut_user) {
        this.usuario_rut_user = usuario_rut_user;
    }

    public int getRol_id_rol() {
        return rol_id_rol;
    }

    public void setRol_id_rol(int rol_id_rol) {
        this.rol_id_rol = rol_id_rol;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getUsuario_rubro_id_rubro() {
        return usuario_rubro_id_rubro;
    }

    public void setUsuario_rubro_id_rubro(int usuario_rubro_id_rubro) {
        this.usuario_rubro_id_rubro = usuario_rubro_id_rubro;
    }
    
    
}
