package com.trevor.control;

import com.trevor.conexion.Conexion;
import com.trevor.conexion.ConexionPool;
import com.trevor.entidad.Estado;
import com.trevor.entidad.HistorialTicket;
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

public class Error extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.starus_code");
        String servletName = (String) request.getAttribute("javax.servlet.error.servlet_name");
        String requestUrl = (String) request.getAttribute("javax.servlet.error.request_url");
        
        switch(statusCode){
            case 404:
                request.getSession().invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case 500:
                request.getSession().invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
            break;
            default:
                request.getSession().invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
            break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    }
}
