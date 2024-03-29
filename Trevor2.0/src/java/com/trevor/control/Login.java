package com.trevor.control;

import com.trevor.conexion.*;
import com.trevor.entidad.*;
import com.trevor.operaciones.Operaciones;
import com.trevor.utilerias.Hash;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (accion.equals("login")) {
            try {
                iniciarSesion(request, response);
            } catch (SQLException ex) {
            }
        } else if (accion.equals("registrar")) {
            try {
                registrar(request, response);
            } catch (SQLException ex) {
            }
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String idusuario = request.getParameter("txtidUsuario");
        String Nombre = request.getParameter("txtnewname");
        String Apellido = request.getParameter("txtnewLast");
        String Telefono = request.getParameter("txtTelefono");
        String email = request.getParameter("txtMail");
        String pass = request.getParameter("txtPass");
        String pass2 = request.getParameter("txtPass2");
        try {
            Conexion conn = new ConexionPool();
            conn.conectar();
            Operaciones.abrirConexion(conn);
            Operaciones.iniciarTransaccion();
            Usuario u = Operaciones.get(idusuario, new Usuario());
            if (pass.equals(pass2)) {
                Usuario p = new Usuario();
                p.setIdusuario(idusuario);
                p.setNombres(Nombre);
                p.setApellidos(Apellido);
                p.setEmail(email);
                p.setTelefono(Telefono);
                p.setIdrol(2);
                p.setClave(Hash.generarHash(pass, Hash.SHA256));
                p = Operaciones.insertar(p);
                if (p.getIdusuario() != null) {
                    request.setAttribute("resultado", 1);
                } else {
                    request.setAttribute("resultado", 0);
                }
            }else{
                request.setAttribute("registro", 0);
            }
            Operaciones.commit();
        } catch (Exception ex) {
            try {
                Operaciones.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(Configuracion.class.getName()).log(Level.SEVERE, null, ex1);
            }
            request.getSession().setAttribute("resultado", 2);
        } finally {
            try {
                Operaciones.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(Configuracion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        response.sendRedirect("Login");
    }

    private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String usuario = request.getParameter("txtUsuario");
        String clave = request.getParameter("txtClave");
        PrintWriter io = response.getWriter();
        if (usuario == null) {
            usuario = "";
        }
        if (clave == null) {
            clave = "";
        }
        try {
            Conexion conn = new ConexionPool();
            conn.conectar();
            Operaciones.abrirConexion(conn);
            Operaciones.iniciarTransaccion();
            if (conn.getConexion() == null) {
                request.setAttribute("error", 1);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                HttpSession sesion = request.getSession();
                Usuario u = Operaciones.get(usuario, new Usuario());
                if (u.getIdusuario() != null) {
                    if (u.getClave().equals(Hash.generarHash(clave, Hash.SHA256))) {
                        sesion.setAttribute("Usuario", u.getIdusuario());
                        sesion.setAttribute("Nombre", u.getNombres() + " "
                                + u.getApellidos());
                        sesion.setAttribute("Rol", u.getIdrol());
                        sesion.setAttribute("DatoUser", u);
                        List<Menu> permisos = getPermisos(u.getIdrol());
                        List<Menu> MenuPrincipal = permisos.stream().filter(field -> field.getIdpadre() == 0).collect(Collectors.toList());
                        sesion.setAttribute("MenuPrincipal", MenuPrincipal);
                        sesion.setAttribute("Permisos", permisos);

                        response.sendRedirect("Principal");
                    } else {
                        request.setAttribute("error", 2);
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("error", 2);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }
            Operaciones.commit();
        } catch (Exception ex) {
            Operaciones.rollback();
            io.print(ex);
        } finally {
            try {
                Operaciones.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private List<Menu> getPermisos(Integer idrol) throws SQLException {
        List<Menu> permisos = new ArrayList();
        try {
            String sql = "select * from menu where idmenu in (select idmenu from permiso where idrol = ?)";
            List<Object> param = new ArrayList();
            param.add(idrol);
            String[][] rs = Operaciones.consultar(sql, param);
            for (int i = 0; i < rs[0].length; i++) {
                Menu m = new Menu(Integer.parseInt(rs[0][i]), rs[1][i], rs[2][i], rs[3][i], Integer.parseInt(rs[4][i] == null ? "0" : rs[4][i]));
                permisos.add(m);
            }
        } catch (Exception ex) {
            Operaciones.rollback();
        }
        return permisos;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

}
