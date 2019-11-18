
package com.trevor.entidad;
import com.trevor.anotaciones.*;
@Entity (table = "rol")
public class rol {
    @AutoIncrement
    @PrimaryKey
    @NotNull
    private  int idRol; 
    @NotNull
    private  String nombre; 

    public rol() {
    }

    public rol(int idRol, String nombre) {
        this.idRol = idRol;
        this.nombre = nombre;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
