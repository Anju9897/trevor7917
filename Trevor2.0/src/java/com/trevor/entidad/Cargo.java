package com.trevor.entidad;

import com.trevor.anotaciones.*;

@Entity(table = "cargo")
public class Cargo {

    @NotNull
    @PrimaryKey
    @AutoIncrement
    private int idcargo;
    @NotNull
    private String descripcion;
    @NotNull
    private String cargo;

    public Cargo() {
    }

    public Cargo(int idcargo, String descripcion, String cargo) {
        this.idcargo = idcargo;
        this.descripcion = descripcion;
        this.cargo = cargo;
    }

    public int getIdcargo() {
        return idcargo;
    }

    public void setIdcargo(int idcargo) {
        this.idcargo = idcargo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

}
