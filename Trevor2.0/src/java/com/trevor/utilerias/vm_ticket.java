
package com.trevor.utilerias;

import java.util.Date;

public class vm_ticket {
    private String usuario;
    private Date fecha;
    private String tipo;
    private String prioridad;

    public vm_ticket() {
    }

    public vm_ticket(String usuario, Date fecha, String tipo, String prioridad) {
        this.usuario = usuario;
        this.fecha = fecha;
        this.tipo = tipo;
        this.prioridad = prioridad;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }
    
    
}

