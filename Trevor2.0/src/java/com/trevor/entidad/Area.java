package com.trevor.entidad;

import com.trevor.anotaciones.*;

@Entity(table = "area")
public class Area {

    @PrimaryKey
    @NotNull
    @AutoIncrement
    private int idarea;
    @NotNull
    private String nombre;
    @NotNull
    private String descripcion;

    public Area() {
    }

    public Area(int idarea, String nombre, String descripcion) {
        this.idarea = idarea;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public int getIdarea() {
        return idarea;
    }

    public void setIdarea(int idarea) {
        this.idarea = idarea;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
