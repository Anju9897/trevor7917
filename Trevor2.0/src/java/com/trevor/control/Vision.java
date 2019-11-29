package com.trevor.control;

import com.trevor.conexion.Conexion;
import com.trevor.conexion.ConexionPool;
import com.trevor.entidad.Estado;
import com.trevor.entidad.Menu;
import com.trevor.operaciones.Operaciones;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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

@WebServlet(name = "Vision", urlPatterns = "{/Vision}")

public class Vision extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession();
        List<Menu> per = (List<Menu>) s.getAttribute("Permisos");
        List<Menu> MenuPrincipal = per.stream().filter(field -> field.getIdpadre() == 0).collect(Collectors.toList());
        request.setAttribute("MenuPrincipal", MenuPrincipal);
        String op = request.getParameter("op");

        String accion = request.getParameter("accion");
        if (op != null) {
            List<Menu> PermisosAsignados = per.stream().filter(field -> field.getIdpadre() == Integer.parseInt(op)).collect(Collectors.toList());
            request.setAttribute("PermisosAsignados", PermisosAsignados);
        }
        if (accion == null) {

            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                List<String> pr = new ArrayList<>();
                pr.add("Baja");
                pr.add("Media");
                pr.add("Alta");
                pr.add("Urgente");
                List<String> tp = new ArrayList<>();
                tp.add("Preguntas");
                tp.add("Incidentes");
                tp.add("Problemas");
                tp.add("solicitud de funcion");
                List<Estado> es = Operaciones.getTodos(new Estado());
                request.getSession().setAttribute("estado", es);
                request.getSession().setAttribute("Prioridad", pr);
                request.getSession().setAttribute("tipo", tp);

                Operaciones.commit();
                request.getRequestDispatcher("Vision/Vision.jsp").forward(request, response);

            } catch (Exception ex) {
                try {
                    Operaciones.rollback();

                } catch (SQLException ex1) {
                    Logger.getLogger(Vision.class.getName()).log(Level.SEVERE, null, ex1);
                }
            } finally {
                try {
                    Operaciones.cerrarConexion();

                } catch (SQLException ex) {
                    Logger.getLogger(Vision.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

    }
    //llevar datos de la base de datos  a  la pagina vision

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static class adm_reporte {

        public adm_reporte() {
        }
    }

}
