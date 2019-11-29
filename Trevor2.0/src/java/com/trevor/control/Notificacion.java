package com.trevor.control;

import com.trevor.conexion.Conexion;
import com.trevor.conexion.ConexionPool;
import com.trevor.operaciones.Operaciones;
import com.trevor.utilerias.vm_noti;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Notificacion", urlPatterns = {"/Notificacion"})
public class Notificacion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

                String sql = "select t.u_encargado,t.idticket,e.estado from ticket t inner join estado e on (t.idestado = e.idestado) where t.u_reporta like ? and t.u_encargado is not null";
                List<Object> params = new ArrayList<>();
                params.add("%" + request.getSession().getAttribute("Usuario") + "%");
                String[][] rs = Operaciones.consultar(sql, params);

                vm_noti t = new vm_noti();
                
                List<vm_noti> v = new ArrayList<>();

                for (int j = 0; j < rs[0].length; j++) {
                    t = new vm_noti(rs[0][j], Integer.parseInt(rs[1][j]), rs[2][j]);
                    v.add(t);
                }

                double n_registros = rs[0].length;
                double registros_pagina = 10;
                int n_paginas = (n_registros < registros_pagina ? 1 : (int) Math.ceil(n_registros / registros_pagina));

                request.getSession().removeAttribute("historial");
                request.getSession().setAttribute("historial", v);
                request.getSession().setAttribute("n_paginas_", n_paginas);

                int li = 1;
                int ls = (int) registros_pagina;

                if (request.getParameter("pag") != null) {
                    ls = Integer.parseInt(request.getParameter("pag")) * (int) registros_pagina;
                    li = ls - ((int) registros_pagina - 1);
                }

                request.setAttribute("li", li);
                request.setAttribute("ls", ls);

                if (n_paginas != 0) {
                    request.getSession().setAttribute("resultado", 1);
                }

                Operaciones.commit();
                request.getRequestDispatcher("Notificaciones/list_notificacion.jsp").forward(request, response);
            } catch (Exception ex) {
                try {
                    Operaciones.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(Notificacion.class.getName()).log(Level.SEVERE, null, ex1);
                }
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Notificacion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else if (accion.equals("")) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
