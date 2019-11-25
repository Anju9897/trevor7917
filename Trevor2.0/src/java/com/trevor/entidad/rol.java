
package com.trevor.entidad;
import com.trevor.anotaciones.*;
@Entity (table = "rol")
public class rol {
    @AutoIncrement
    @PrimaryKey
    @NotNull
    private  int idRol; 
    @NotNull
    private  String rol; 

    public rol() {
    }

    public rol(int idRol, String rol) {
        this.idRol = idRol;
        this.rol = rol;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }


    
}
