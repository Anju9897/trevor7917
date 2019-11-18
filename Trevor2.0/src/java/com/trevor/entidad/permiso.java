/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.trevor.entidad;

import com.trevor.anotaciones.AutoIncrement;
import com.trevor.anotaciones.Entity;
import com.trevor.anotaciones.PrimaryKey;


@Entity (table = "permiso")
public class permiso {
    @PrimaryKey
    @AutoIncrement
    private int idpermiso;
    private int idmenu;
    private int idrol;

    public permiso() {
    }

    public permiso(int idpermiso, int idmenu, int idrol) {
        this.idpermiso = idpermiso;
        this.idmenu = idmenu;
        this.idrol = idrol;
    }

    public int getIdpermiso() {
        return idpermiso;
    }

    public void setIdpermiso(int idpermiso) {
        this.idpermiso = idpermiso;
    }

    public int getIdmenu() {
        return idmenu;
    }

    public void setIdmenu(int idmenu) {
        this.idmenu = idmenu;
    }

    public int getIdrol() {
        return idrol;
    }

    public void setIdrol(int idrol) {
        this.idrol = idrol;
    }
    
    
}
