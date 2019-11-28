package com.trevor.control;

import com.trevor.conexion.Conexion;
import com.trevor.conexion.ConexionPool;
import com.trevor.entidad.Estado;
import com.trevor.entidad.Menu;
import com.trevor.entidad.Ticket;
import com.trevor.entidad.Usuario;
import com.trevor.operaciones.Operaciones;
import com.trevor.utilerias.Tabla;
import com.trevor.utilerias.vm_ticket;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
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
                List<vm_ticket> vm = new ArrayList<>();
                List<Object> params = new ArrayList<>();
                String sql2 = "select t.idticket,t.u_reporta,t.fecha_emision,t.tipo,t.prioridad,e.estado from ticket t inner join estado e on (t.idestado = e.idestado) where u_encargado like ? order by t.fecha_emision desc";
                params.add("%"+request.getSession().getAttribute("Usuario")+"%");
                String [][] rs = Operaciones.consultar(sql2, params);
                
                for(int i=0;i<rs[0].length;i++){
                    Date f = (rs[2][i] == null) ? null : new SimpleDateFormat("yyyy-MM-dd").parse(rs[2][i]);
                    vm_ticket v = new vm_ticket((Integer.parseInt(rs[0][i])),(rs[1][i]),((f == null) ? null : new Timestamp(f.getTime())),rs[3][i],rs[4][i],rs[5][i]);
                    vm.add(v);
                }
                double n_registros = rs[0].length;
                double  registros_pagina = 6;
                int n_paginas =  (n_registros < registros_pagina ? 1 : (int) Math.ceil(n_registros / registros_pagina));
                
                request.getSession().removeAttribute("vm");
                request.getSession().setAttribute("vm", vm);
                request.getSession().setAttribute("n_paginas_", n_paginas);
                
                int li = 1;
                int ls = (int)registros_pagina;
                
                if(request.getParameter("pag")!=null){
                    ls = Integer.parseInt( request.getParameter("pag")) * (int) registros_pagina;
                    li = ls - ((int) registros_pagina-1); 
                }
                    
                request.setAttribute("li", li);
                request.setAttribute("ls", ls);

                if(n_paginas!=0){
                    request.getSession().setAttribute("resultado",1);
                }
                
                Operaciones.commit();
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
        } else if (accion.equals("detalle")) {
            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                
                Ticket t = Operaciones.get(request.getParameter("id"), new Ticket());
                request.getSession().setAttribute("mensaje", t);
                request.getSession().setAttribute("inicial", t.getU_reporta().charAt(0));
                
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
            request.getRequestDispatcher("Tickets/detalle_ticket.jsp").forward(request, response);
        } else if(accion.equals("responder")){
            request.getRequestDispatcher("Tickets/accion_historial.jsp").forward(request, response);
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
