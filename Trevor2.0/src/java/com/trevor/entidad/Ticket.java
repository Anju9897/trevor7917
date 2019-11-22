package com.trevor.entidad;

import com.trevor.anotaciones.*;
import java.util.Date;

@Entity(table = "Ticket")
public class Ticket {

    @PrimaryKey
    @NotNull
    @AutoIncrement
    private int idticket;
    @NotNull
    private String descripcion;
    @NotNull
    private String u_encargado;
    @NotNull
    private String u_reporta;
    @NotNull
    private Date fecha_emision;
    @NotNull
    private int idestado;
    @NotNull
    private String prioridad;
    private String Tipo;
    private String Asunto;

    public Ticket() {
    }

    public Ticket(int idticket, String descripcion, String u_encargado, String u_reporta, Date fecha_emision, int idestado, String prioridad, String Tipo, String Asunto) {
        this.idticket = idticket;
        this.descripcion = descripcion;
        this.u_encargado = u_encargado;
        this.u_reporta = u_reporta;
        this.fecha_emision = fecha_emision;
        this.idestado = idestado;
        this.prioridad = prioridad;
        this.Tipo = Tipo;
        this.Asunto = Asunto;
    }

    public int getIdticket() {
        return idticket;
    }

    public void setIdticket(int idticket) {
        this.idticket = idticket;
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

    public String getU_reporta() {
        return u_reporta;
    }

    public void setU_reporta(String u_reporta) {
        this.u_reporta = u_reporta;
    }

    public Date getFecha_emision() {
        return fecha_emision;
    }

    public void setFecha_emision(Date fecha_emision) {
        this.fecha_emision = fecha_emision;
    }

    public int getIdestado() {
        return idestado;
    }

    public void setIdestado(int idestado) {
        this.idestado = idestado;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public String getAsunto() {
        return Asunto;
    }

    public void setAsunto(String Asunto) {
        this.Asunto = Asunto;
    }

}
