/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// nomas es la interfaaz 
package com.trevor.conexion;

import java.sql.Connection;

public interface Conexion {

    public void conectar();

    public Connection getConexion();

    public void desconectar();

}
