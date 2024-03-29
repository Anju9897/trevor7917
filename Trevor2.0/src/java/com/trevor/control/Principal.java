package com.trevor.control;

import com.trevor.entidad.Menu;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

@WebServlet(name = "Principal", urlPatterns = {"/Principal"})
public class Principal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter io = response.getWriter();
        String accion = request.getParameter("accion");        
        if (accion ==null){
            HttpSession s = request.getSession();
            if(s.getAttribute("Usuario") == null || request.getSession() == null || s.getAttribute("MenuPrincipal") == null){
                response.sendRedirect("Login");
            }else{
                response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
                List<Menu> per = (List<Menu>)s.getAttribute("Permisos");
                List<Menu> MenuPrincipal = per.stream().filter(field -> field.getIdpadre()==0).collect(Collectors.toList());
                request.setAttribute("MenuPrincipal", MenuPrincipal);
                String op = request.getParameter("op");
                if (op!=null){
                    List<Menu> PermisosAsignados = per.stream().filter(field -> 
                            field.getIdpadre()==Integer.parseInt(op)).collect(Collectors.toList());
                    request.setAttribute("PermisosAsignados", PermisosAsignados);
                }
                if( (int) request.getSession().getAttribute("Rol") == 1){
                    response.sendRedirect(request.getContextPath()+"/Configuracion");
                }else{
                    response.sendRedirect(request.getContextPath()+"/Bandeja");
                }
            }
        }else if (accion.equals("logout")){
            logout(request, response);
        }
    }
    
    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession sesion = request.getSession();
        sesion.removeAttribute("Usuario");
        sesion.removeAttribute("Nombre");
        sesion.removeAttribute("Rol");
        sesion.invalidate();
        response.sendRedirect("Login");
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
