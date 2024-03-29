package com.trevor.control;

import com.trevor.conexion.Conexion;
import com.trevor.conexion.ConexionPool;
import com.trevor.entidad.Menu;
import com.trevor.entidad.Ticket;
import com.trevor.entidad.Usuario;
import com.trevor.operaciones.Operaciones;
import com.trevor.utilerias.Tabla;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Bandeja", urlPatterns = "{/Bandeja}")
public class Bandeja extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession();
        List<Menu> per = (List<Menu>) s.getAttribute("Permisos");
        List<Menu> MenuPrincipal = per.stream().filter(field -> field.getIdpadre() == 0).collect(Collectors.toList());
        request.setAttribute("MenuPrincipal", MenuPrincipal);
        String op = request.getParameter("op");
        if (op != null) {
            List<Menu> PermisosAsignados = per.stream().filter(field -> field.getIdpadre() == Integer.parseInt(op)).collect(Collectors.toList());
            request.setAttribute("PermisosAsignados", PermisosAsignados);
        }
        String accion = request.getParameter("accion");
        List<String> problema = new ArrayList<>();
        problema.add("Software");
        problema.add("Hardware");
        problema.add("Conexion");
        problema.add("Accidente");
        problema.add("Fallo Sistema");
        s.setAttribute("problema", problema);
        if (accion == null) {
            if (request.getSession().getAttribute("resultado") != null) {
                request.setAttribute("resultado", request.getSession().getAttribute("resultado"));
                request.getSession().removeAttribute("resultado");
            }
            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                String sql = "";
                int rol = (int) request.getSession().getAttribute("Rol");
                String[][] mensaje = null;
                String[] cabeceras = null;
                if (rol == 1) {
                    sql = "select idticket,asunto,substring(descripcion,0,25),u_reporta,isnull(Tipo,'sin clasificacion'),convert(varchar(10),fecha_emision,103) from Ticket where idestado = ?";
                    List<Object> params = new ArrayList<>();
                    params.add(1);
                    mensaje = Operaciones.consultar(sql, params);
                    cabeceras = new String[]{"id Mensaje", "Asunto", "Descripcion", "Usuario", "Tipo de Problema", "Fecha Envio"};
                } else {
                    sql = "select asunto,substring(descripcion,0,25),isnull(Tipo,'sin clasificacion'),convert(varchar(10),fecha_emision,103) from Ticket where u_reporta like ? and idestado = ?";
                    List<Object> params = new ArrayList<>();
                    params.add("%" + request.getSession().getAttribute("Usuario").toString() + "%");
                    params.add(1);
                    mensaje = Operaciones.consultar(sql, params);
                    //declaracion de cabeceras a usar en la tabla HTML   
                    cabeceras = new String[]{"Asunto", "Descripcion", "Tipo de Problema", "Fecha Envio"};
                }
                //variable de tipo Tabla para generar la Tabla HTML        
                Tabla tab = new Tabla(mensaje, //array que contiene los datos     
                        "75%", //ancho de la tabla px | %    
                        Tabla.STYLE.OTRO, //estilo de la tabla        
                        Tabla.ALIGN.CENTER, // alineacion de la tabla      
                        cabeceras); //array con las cabeceras de la tabla 
                //boton eliminar          
                tab.setEliminable(false);
                //boton actualizar             
                tab.setModificable(false);
                //url del proyecto          
                tab.setPageContext(request.getContextPath());
                //pagina encargada de eliminar          
                //pagina encargada de actualizacion     
                //pagina encargada de seleccion para operaciones     
                if ((int) request.getSession().getAttribute("Rol") == 1) {
                    tab.setPaginaModificable("/Bandeja?accion=ver_mensaje");
                    tab.setPaginaEliminable("/Bandeja?accion=eliminar");
                    tab.setPaginaSeleccionable("/Bandeja?accion=ver_mensaje");
                    tab.setColumnasSeleccionables(new int[]{1});
                }
                //columnas seleccionables 
                //pie de tabla           
                tab.setPie("Mensajes");
                //imprime la tabla en pantalla    
                String tabla01 = mensaje != null ? tab.getTabla() : "<center><Strong id='nomessage'>No Tienes Mensajes</Strong></center>";
                request.setAttribute("tabla", tabla01);
                
                request.getSession().removeAttribute("resultado");
                request.getSession().setAttribute("resultado",2);

                request.getRequestDispatcher("Bandeja/consultar_mensajes.jsp").forward(request, response);
            } catch (Exception ex) {
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Configuracion.class.getName()).log(Level.SEVERE, null, ex1);
                }
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Configuracion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            response.sendRedirect(request.getContextPath() + "/Bandeja");
        } else if (accion.equals("nuevo")) {
            request.getRequestDispatcher("Bandeja/nuevo_mensaje.jsp").forward(request, response);
        } else if (accion.equals("ver_mensaje")) {
            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                Ticket p = Operaciones.get(request.getParameter("id"), new Ticket());
                request.getSession().removeAttribute("mensaje");
                request.getSession().setAttribute("mensaje", p);
                request.getSession().removeAttribute("inicial");
                request.getSession().setAttribute("inicial", p.getU_reporta().charAt(0));
                Operaciones.commit();
            } catch (Exception ex) {
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Configuracion.class.getName()).log(Level.SEVERE, null, ex1);
                }
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Configuracion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.getRequestDispatcher("Bandeja/ver_mensaje.jsp").forward(request, response);
        } else if (accion.equals("eliminar")) {

            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                Usuario p = Operaciones.eliminar(request.getParameter("id"), new Usuario());
                if (p.getIdusuario() != null) {
                    request.getSession().setAttribute("resultado", 1);
                } else {
                    request.getSession().setAttribute("resultado", 0);
                }
                Operaciones.commit();
            } catch (Exception ex) {
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Bandeja.class.getName()).log(Level.SEVERE, null, ex1);
                }
                request.getSession().setAttribute("resultado", 0);
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Bandeja.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            response.sendRedirect(request.getContextPath() + "/Bandeja");
        } else if (accion.equals("ticket")) {
            response.sendRedirect(request.getContextPath() + "/Tickets?accion=generar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String usuario = request.getParameter("usuario");
        String asunto = request.getParameter("asunto");
        String tipo = request.getParameter("problema");

        String descripcion = request.getParameter("Descripcion");
        switch (accion) {
            case "Enviar": {
                try {
                    Conexion conn = new ConexionPool();
                    conn.conectar();
                    Operaciones.abrirConexion(conn);
                    Operaciones.iniciarTransaccion();
                    if (usuario != null && !usuario.equals("")) {
                        Ticket t = new Ticket();
                        t.setIdestado(1);
                        t.setTipo(tipo);
                        t.setAsunto(asunto);
                        t.setDescripcion(descripcion);
                        Date fec = new Date();
                        t.setFecha_emision(new Timestamp(fec.getTime()));
                        t.setU_reporta(usuario);
                        t = Operaciones.insertar(t);
                        request.setAttribute("ticket", t);
                        if (t.getU_reporta() != null) {
                            request.getSession().setAttribute("resultado", 1);
                        } else {
                            request.getSession().setAttribute("resultado", 0);
                        }
                    }
                    Operaciones.commit();
                } catch (Exception ex) {
                    try {
                        Operaciones.rollback();
                    } catch (SQLException ex1) {
                        Logger.getLogger(Bandeja.class.getName()).log(Level.SEVERE, null, ex1);
                    }
                    request.getSession().setAttribute("resultado", 2);
                } finally {
                    try {
                        Operaciones.cerrarConexion();
                    } catch (SQLException ex) {
                        Logger.getLogger(Bandeja.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                response.sendRedirect(request.getContextPath() + "/Bandeja");
                break;
            }
            case "eliminar": {
                break;
            }
        }
    }

}
