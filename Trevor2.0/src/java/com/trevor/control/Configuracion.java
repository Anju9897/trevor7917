package com.trevor.control;

import com.trevor.conexion.Conexion;
import com.trevor.conexion.ConexionPool;
import com.trevor.entidad.Menu;
import com.trevor.entidad.Usuario;
import com.trevor.entidad.rol;
import com.trevor.operaciones.Operaciones;
import com.trevor.utilerias.Hash;
import com.trevor.utilerias.Tabla;
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

@WebServlet(name = "Configuracion", urlPatterns = "{/Configuracion}")
public class Configuracion extends HttpServlet {

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
                if (request.getParameter("txtBusqueda") != null) {
                    sql = "select u.idUsuario,u.Nombres,u.Apellidos,u.email,u.telefono,r.rol from Usuario u inner join rol r on (u.idrol = r.idrol) where nombres like ?";
                } else {
                    sql = "select u.idUsuario,u.Nombres,u.Apellidos,u.email,u.telefono,r.rol from Usuario u inner join rol r on (u.idrol = r.idrol) order by r.rol asc";
                }
                String[][] usuario = null;
                if (request.getParameter("txtBusqueda") != null) {
                    List<Object> params = new ArrayList<>();
                    params.add("%" + request.getParameter("txtBusqueda").toString() + "%");
                    usuario = Operaciones.consultar(sql, params);
                } else {
                    usuario = Operaciones.consultar(sql, null);
                }
                List<rol> r = Operaciones.getTodos(new rol());
                request.getSession().setAttribute("roles", r);

                //declaracion de cabeceras a usar en la tabla HTML     
                String[] cabeceras = new String[]{"ID Usuario", "Nombre", "Apellido", "Email", "Telefono","Rol"};
                //variable de tipo Tabla para generar la Tabla HTML        
                Tabla tab = new Tabla(usuario, //array que contiene los datos     
                        "75%", //ancho de la tabla px | %    
                        Tabla.STYLE.OTRO, //estilo de la tabla        
                        Tabla.ALIGN.CENTER, // alineacion de la tabla      
                        cabeceras); //array con las cabeceras de la tabla 
                //boton eliminar          
                tab.setEliminable(true);
                //boton actualizar             
                tab.setModificable(true);
                //url del proyecto          
                tab.setPageContext(request.getContextPath());
                //pagina encargada de eliminar          
                tab.setPaginaEliminable("/Configuracion?accion=eliminar");
                //pagina encargada de actualizacion     
                tab.setPaginaModificable("/Configuracion?accion=modificar");
                //pagina encargada de seleccion para operaciones       
                tab.setPaginaSeleccionable("/Configuracion?accion=modificar");
                //icono para modificar y eliminar    
                tab.setIconoModificable("imagen/pencil2.png");
                tab.setIconoEliminable("imagen/bin.png");
                //columnas seleccionables        
                tab.setColumnasSeleccionables(new int[]{1});
                //pie de tabla           
                tab.setPie("Resultados");
                //imprime la tabla en pantalla    
                String tabla01 = tab.getTabla();
                request.setAttribute("tabla", tabla01);
                request.setAttribute("valor", request.getParameter("txtBusqueda"));
                request.getRequestDispatcher("Configuracion/consulta_usuarios.jsp").forward(request, response);
                
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
            //response.sendRedirect(request.getContextPath() + "/Paises");
        } else if (accion.equals("insertar")) {
            request.getRequestDispatcher("Configuracion/insertar_modificar.jsp").forward(request, response);
        } else if (accion.equals("modificar")) {
            try {
                Conexion conn = new ConexionPool();
                conn.conectar();
                Operaciones.abrirConexion(conn);
                Operaciones.iniciarTransaccion();
                Usuario p = Operaciones.get(request.getParameter("id"), new Usuario());
                request.setAttribute("usuario", p);
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
                    Logger.getLogger(Configuracion.class.getName()).log(Level.SEVERE, null, ex1);
                }
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Configuracion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.getRequestDispatcher("Configuracion/insertar_modificar.jsp").forward(request, response);
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
                    Logger.getLogger(Configuracion.class.getName()).log(Level.SEVERE, null, ex1);
                }
                request.getSession().setAttribute("resultado", 0);
            } finally {
                try {
                    Operaciones.cerrarConexion();
                } catch (SQLException ex) {
                    Logger.getLogger(Configuracion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            response.sendRedirect(request.getContextPath() + "/Configuracion");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "insertar_modificar": {
                String idusuario = request.getParameter("txtidUsuario");
                String Nombre = request.getParameter("txtnewname");
                String Apellido = request.getParameter("txtnewLast");
                String Telefono = request.getParameter("txtTelefono");
                String email = request.getParameter("txtMail");
                String pass = request.getParameter("txtPass");
                String pass2 = request.getParameter("txtPass2");
                String rol = request.getParameter("sltrol");
                try {
                    Conexion conn = new ConexionPool();
                    conn.conectar();
                    Operaciones.abrirConexion(conn);
                    Operaciones.iniciarTransaccion();
                    
                    Usuario u = Operaciones.get(idusuario,new Usuario());
                    // actualizar datos del usuario
                    if ( u.getIdusuario()!= null) {
                        Usuario p = new Usuario();
                        p.setIdusuario(idusuario);
                        p.setNombres(Nombre);
                        p.setApellidos(Apellido);
                        p.setEmail(email);
                        p.setTelefono(Telefono);
                        p.setIdrol(Integer.parseInt(rol));
                        p = Operaciones.actualizar(p.getIdusuario(), p);
                        if (p.getIdusuario() != null) {
                            request.getSession().setAttribute("resultado", 1);
                        } else {
                            request.getSession().setAttribute("resultado", 0);
                        }
                    } else {
                        // insertar usuario
                        if (pass.equals(pass2)) {
                            Usuario p = new Usuario();
                            p.setIdusuario(idusuario);
                            p.setNombres(Nombre);
                            p.setApellidos(Apellido);
                            p.setEmail(email);
                            p.setTelefono(Telefono);
                            p.setIdrol(2);
                            p.setClave(Hash.generarHash(pass, Hash.SHA256));
                            p.setIdarea(2);
                            p.setIdcargo(4);
                            p = Operaciones.insertar(p);
                            if (p.getIdusuario() != null) {
                                request.getSession().setAttribute("resultado", 1);
                            } else {
                                request.getSession().setAttribute("resultado", 0);
                            }
                        }
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
                response.sendRedirect("Principal");
                break;
            }
            case "eliminar": {
                break;
            }
        }
    }

}
