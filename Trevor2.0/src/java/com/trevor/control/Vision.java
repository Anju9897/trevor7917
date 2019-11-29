package com.trevor.control;

import com.trevor.conexion.Conexion;
import com.trevor.conexion.ConexionPool;
import com.trevor.entidad.Estado;
import com.trevor.entidad.Menu;
import com.trevor.operaciones.Operaciones;
import com.trevor.utilerias.vm_repo;
import java.io.IOException;
import java.io.PrintWriter;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession();
        List<Menu> per = (List<Menu>) s.getAttribute("Permisos");
        List<Menu> MenuPrincipal = per.stream().filter(field -> field.getIdpadre() == 0).collect(Collectors.toList());
        request.setAttribute("MenuPrincipal", MenuPrincipal);
        String op = request.getParameter("op");
        if (op != null) {
            List<Menu> PermisosAsignados = per.stream().filter(field -> field.getIdpadre() == Integer.parseInt(op)).collect(Collectors.toList());
            request.setAttribute("PermisosAsignados", PermisosAsignados);
            PrintWriter io = response.getWriter();
        }

        String accion = request.getParameter("accion");
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
                
                // la lista de la sentencia sql
                String sql_cont = "select count(t.idestado) ,e.estado,t.idestado from ticket t inner join estado e on (t.idestado = e.idestado) group by t.idestado,e.estado";
                String [][] rs = Operaciones.consultar(sql_cont, null);
                vm_repo vm = new vm_repo();
                
                List<vm_repo> lst = new ArrayList<>();
                for(int i=0;i<rs[0].length;i++){
                    vm = new vm_repo(Integer.parseInt(rs[0][i]),rs[1][i],Integer.parseInt(rs[2][i]));
                    lst.add(vm);
                }
                
                request.getSession().removeAttribute("conteo");
                request.getSession().setAttribute("conteo", lst);
                
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

}