
package com.trevor.utilerias;



public class vm_repo {

    private int cEstado;
    private String estado;
    private int idestado;

    public vm_repo() {
    }

    public vm_repo(int cEstado, String estado,int idestado) {
        this.cEstado = cEstado;
        this.estado = estado;
        this.idestado = idestado;
    }

    public int getcEstado() {
        return cEstado;
    }

    public void setcEstado(int cEstado) {
        this.cEstado = cEstado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdestado() {
        return idestado;
    }

    public void setIdestado(int idestado) {
        this.idestado = idestado;
    }
    
    
}
