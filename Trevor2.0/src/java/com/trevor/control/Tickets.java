package com.trevor.control;

import com.trevor.conexion.Conexion;
import com.trevor.conexion.ConexionPool;
import com.trevor.entidad.Estado;
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

@WebServlet(name = "Tickets", urlPatterns = "{/Tickets}")
public class Tickets extends HttpServlet {

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
                sql = "select idticket,asunto,descripcion,u_reporta,fecha_emision from Ticket where u_encargado like ? ";
                List<Object> params = new ArrayList<>();
                params.add("%" + request.getSession().getAttribute("Usuario") + "%");
                mensaje = Operaciones.consultar(sql, params);
                request.getRequestDispatcher("Tickets/ver_tickets.jsp").forward(request, response);
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
        } else if (accion.equals("generar")) {
            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                List<String> p = new ArrayList<>();
                p.add("Baja");
                p.add("Media");
                p.add("Alta");
                p.add("Urgente");
                List<Estado> e = Operaciones.getTodos(new Estado());
                request.getSession().setAttribute("estado", e);
                request.getSession().setAttribute("prioridad", p);
                Operaciones.commit();
            } catch (Exception ex) {
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Tickets.class.getName()).log(Level.SEVERE, null, ex1);
                }
                Logger.getLogger(Tickets.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Tickets.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            request.getRequestDispatcher("Tickets/crear_ticket.jsp").forward(request, response);
        } else if (accion.equals("ver_mensaje")) {
            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
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
            request.getRequestDispatcher("Tickets/ver_tickets.jsp").forward(request, response);
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
            response.sendRedirect(request.getContextPath() + "/Tickets");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String u_encargado = request.getParameter("encargado");
        int idestado = Integer.parseInt(request.getParameter("estado"));
        String prioridad = request.getParameter("prioridad");
        switch (accion) {
            case "asignar_ticket": {
                try {
                    Conexion conn = new ConexionPool();
                    conn.conectar();
                    Operaciones.abrirConexion(conn);
                    Operaciones.iniciarTransaccion();
                    Ticket t = (Ticket) request.getSession().getAttribute("mensaje");
                    t = Operaciones.get(t.getIdticket(), new Ticket());
                    if (t.getIdticket() != 0) {
                        Ticket t3 = new Ticket();
                        t3.setDescripcion(t.getDescripcion());
                        t3.setU_encargado(u_encargado);
                        t3.setU_reporta(t.getU_reporta());
                        t3.setFecha_emision(t.getFecha_emision());
                        t3.setIdestado(idestado);
                        t3.setPrioridad(prioridad);
                        t3.setTipo(t.getTipo());
                        t3.setAsunto(t.getAsunto());
                        t3 = Operaciones.actualizar(t.getIdticket(), t3);
                        if (t3.getIdticket() != 0) {
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
                response.sendRedirect(request.getContextPath() + "/Tickets");
                break;
            }
            case "eliminar": {
                break;
            }
        }
    }
}
