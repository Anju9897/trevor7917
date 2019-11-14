package com.trevor.entidad;
import com.trevor.anotaciones.*;

@Entity (table = "usuario")

public class Usuario {
   @PrimaryKey
   private String idusuario;
   private String nombres;
   private String apellidos;
   private String email;
   private String telefono;
   private String clave;
   private int idrol;
   private int idcargo;
   private int idarea;

    public Usuario() {
    }

    public Usuario(String idusuario, String nombres, String apellidos, String email, String telefono, String clave, int idrol, int idcargo, int idarea) {
        this.idusuario = idusuario;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.email = email;
        this.telefono = telefono;
        this.clave = clave;
        this.idrol = idrol;
        this.idcargo = idcargo;
        this.idarea = idarea;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getIdrol() {
        return idrol;
    }

    public void setIdrol(int idrol) {
        this.idrol = idrol;
    }

    public int getIdcargo() {
        return idcargo;
    }

    public void setIdcargo(int idcargo) {
        this.idcargo = idcargo;
    }

    public int getIdarea() {
        return idarea;
    }

    public void setIdarea(int idarea) {
        this.idarea = idarea;
    }
   
   
    
}
