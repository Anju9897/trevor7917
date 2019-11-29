
package com.trevor.utilerias;

public class vm_noti {
    private String encargado;
    private int idticket;
    private String estado;

    public vm_noti() {
    }

    public vm_noti(String encargado, int idticket, String estado) {
        this.encargado = encargado;
        this.idticket = idticket;
        this.estado = estado;
    }

    public String getEncargado() {
        return encargado;
    }

    public void setEncargado(String encargado) {
        this.encargado = encargado;
    }

    public int getIdticket() {
        return idticket;
    }

    public void setIdticket(int idticket) {
        this.idticket = idticket;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }


    
    
}
