package com.trevor.entidad;

import com.trevor.anotaciones.*;

@Entity(table = "acciones")
public class Acciones {

    @PrimaryKey
    @NotNull
    @AutoIncrement
    private int idaccion;
    @NotNull
    private String descripcion;
    @NotNull
    private String u_encargado;

    public Acciones() {
    }

    public Acciones(int idaccion, String descripcion, String u_encargado) {
        this.idaccion = idaccion;
        this.descripcion = descripcion;
        this.u_encargado = u_encargado;
    }

    public int getIdaccion() {
        return idaccion;
    }

    public void setIdaccion(int idaccion) {
        this.idaccion = idaccion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getU_encargado() {
        return u_encargado;
    }

    public void setU_encargado(String u_encargado) {
        this.u_encargado = u_encargado;
    }

}
