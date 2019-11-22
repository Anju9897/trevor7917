package com.trevor.entidad;

import com.trevor.anotaciones.*;

@Entity(table = "estado")
public class Estado {

    @NotNull
    @PrimaryKey
    @AutoIncrement
    private int idestado;
    @NotNull
    private String estado;

    public Estado() {
    }

    public Estado(int idestado, String estado) {
        this.idestado = idestado;
        this.estado = estado;
    }

    public int getIdestado() {
        return idestado;
    }

    public void setIdestado(int idestado) {
        this.idestado = idestado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}
