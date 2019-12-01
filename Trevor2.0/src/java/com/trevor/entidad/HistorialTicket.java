package com.trevor.entidad;

import com.trevor.anotaciones.*;
import java.util.Date;

@Entity(table = "historialTicket")
public class HistorialTicket {

    @NotNull
    @PrimaryKey
    @AutoIncrement
    private int idhistorial;
    @NotNull
    private int idticket;
    @NotNull
    private String u_reporta;
    @NotNull
    private String observaciones;
    @NotNull
    private Date fecha_final;

    public HistorialTicket() {
    }

    public HistorialTicket(int idhistorial, int idticket, String u_reporta, String observaciones, Date fecha_final) {
        this.idhistorial = idhistorial;
        this.idticket = idticket;
        this.u_reporta = u_reporta;
        this.observaciones = observaciones;
        this.fecha_final = fecha_final;
    }

    public int getIdhistorial() {
        return idhistorial;
    }

    public void setIdhistorial(int idhistorial) {
        this.idhistorial = idhistorial;
    }

    public int getIdticket() {
        return idticket;
    }

    public void setIdticket(int idticket) {
        this.idticket = idticket;
    }

    public String getU_reporta() {
        return u_reporta;
    }

    public void setU_reporta(String u_reporta) {
        this.u_reporta = u_reporta;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Date getFecha_final() {
        return fecha_final;
    }

    public void setFecha_final(Date fecha_final) {
        this.fecha_final = fecha_final;
    }

}
