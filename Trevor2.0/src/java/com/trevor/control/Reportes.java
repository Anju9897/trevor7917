package com.trevor.control;

import com.trevor.conexion.Conexion;
import com.trevor.conexion.ConexionPool;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

@WebServlet(name = "Reportes", urlPatterns = {"/Reportes"})
public class Reportes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) {

        } else if (accion.equals("reporte_estado")) {

        } else if (accion.equals("reporte_problema")) {
            
            try {
                String inicio = request.getParameter("fechaini");
                Date fi = new SimpleDateFormat("yyyy-MM-dd").parse(inicio);
                String fin = request.getParameter("fechafin");
                Date ff = new SimpleDateFormat("yyyy-MM-dd").parse(fin);
                Conexion cn = new ConexionPool();
                cn.conectar();
                Connection conexion = cn.getConexion();
                ServletContext context = request.getServletContext();

                //obtenemos el reporte (archivo .jasper) en un archivo de tipo file
                File reportFile = new File(context.getRealPath("/") + "Reportes/reporte_problema.jasper");
                //configuramos los parametros en una varible de tipo Map
                //que como un array
                Map parameters = new HashMap();
                parameters.put("inicio", fi);
                parameters.put("fin", ff);
                //para agregar mas parametro solo llame el metodo put() varias veces
                byte[] bytes = null;
                try {
                    bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conexion);
                } catch (JRException ex) {
                    Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.setContentType("application/pdf");
                //para que el pdf se pueda ver en microsoft explorer
                response.setHeader("Cache-Control", "cache");
                //para que aparezca el diálogo abrir/guardar
                //response.setHeader("Content-Disposition", "attachment; filename=reporte_administracion.pdf");
                response.setHeader("Content-Disposition", "inline; filename=reporte_problema.pdf");
                response.setContentLength(bytes.length);
                try (ServletOutputStream ouputStream = response.getOutputStream()) {
                    ouputStream.write(bytes, 0, bytes.length);
                    ouputStream.flush();
                }
                response.sendRedirect(request.getContextPath() + "/Vision");

            } catch (ParseException ex) {
                Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (accion.equals("reporte_historial")) {
            try {
                String inicio = request.getParameter("fechaini");
                Date fi = new SimpleDateFormat("yyyy-MM-dd").parse(inicio);
                String fin = request.getParameter("fechafin");
                Date ff = new SimpleDateFormat("yyyy-MM-dd").parse(fin);
                Conexion cn = new ConexionPool();
                cn.conectar();
                Connection conexion = cn.getConexion();
                ServletContext context = request.getServletContext();

                //obtenemos el reporte (archivo .jasper) en un archivo de tipo file
                File reportFile = new File(context.getRealPath("/") + "Reportes/reporte_historial.jasper");

                //para agregar mas parametro solo llame el metodo put() varias veces
                byte[] bytes = null;
                try {
                    bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, conexion);
                } catch (JRException ex) {
                    Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.setContentType("application/pdf");
                //para que el pdf se pueda ver en microsoft explorer
                response.setHeader("Cache-Control", "cache");
                //para que aparezca el diálogo abrir/guardar
                //response.setHeader("Content-Disposition", "attachment; filename=reporte_administracion.pdf");
                response.setHeader("Content-Disposition", "inline; filename=reporte_historial.pdf");
                response.setContentLength(bytes.length);
                try (ServletOutputStream ouputStream = response.getOutputStream()) {
                    ouputStream.write(bytes, 0, bytes.length);
                    ouputStream.flush();
                }
                response.sendRedirect(request.getContextPath() + "/Vision");

            } catch (ParseException ex) {
                Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (accion.equals("reporte_prioridad")) {
            try {
                String inicio = request.getParameter("fechaini");
                Date fi = new SimpleDateFormat("yyyy-MM-dd").parse(inicio);
                String fin = request.getParameter("fechafin");
                Date ff = new SimpleDateFormat("yyyy-MM-dd").parse(fin);
                Conexion cn = new ConexionPool();
                cn.conectar();
                Connection conexion = cn.getConexion();
                ServletContext context = request.getServletContext();

                //obtenemos el reporte (archivo .jasper) en un archivo de tipo file
                File reportFile = new File(context.getRealPath("/") + "Reportes/reporte_prioridad.jasper");
                //configuramos los parametros en una varible de tipo Map
                //que como un array
                Map parameters = new HashMap();
                parameters.put("inicio", fi);
                parameters.put("fin", ff);
                //para agregar mas parametro solo llame el metodo put() varias veces
                byte[] bytes = null;
                try {
                    bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conexion);
                } catch (JRException ex) {
                    Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.setContentType("application/pdf");
                //para que el pdf se pueda ver en microsoft explorer
                response.setHeader("Cache-Control", "cache");
                //para que aparezca el diálogo abrir/guardar
                //response.setHeader("Content-Disposition", "attachment; filename=reporte_administracion.pdf");
                response.setHeader("Content-Disposition", "inline; filename=reporte_prioridad.pdf");
                response.setContentLength(bytes.length);
                try (ServletOutputStream ouputStream = response.getOutputStream()) {
                    ouputStream.write(bytes, 0, bytes.length);
                    ouputStream.flush();
                }
                response.sendRedirect(request.getContextPath() + "/Vision");

            } catch (ParseException ex) {
                Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (accion.equals("generar_reportes")) {
            try {
                String inicio = request.getParameter("fechaini");
                Date fi = new SimpleDateFormat("yyyy-MM-dd").parse(inicio);
                String fin = request.getParameter("fechafin");
                Date ff = new SimpleDateFormat("yyyy-MM-dd").parse(fin);
                Conexion cn = new ConexionPool();
                cn.conectar();
                Connection conexion = cn.getConexion();
                ServletContext context = request.getServletContext();

                //obtenemos el reporte (archivo .jasper) en un archivo de tipo file
                File reportFile = new File(context.getRealPath("/") + "Reportes/reporte_administradores.jasper");
                //configuramos los parametros en una varible de tipo Map
                //que como un array
                Map parameters = new HashMap();
                parameters.put("inicio", fi);
                parameters.put("fin", ff);
                //para agregar mas parametro solo llame el metodo put() varias veces
                byte[] bytes = null;
                try {
                    bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conexion);
                } catch (JRException ex) {
                    Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.setContentType("application/pdf");
                //para que el pdf se pueda ver en microsoft explorer
                response.setHeader("Cache-Control", "cache");
                //para que aparezca el diálogo abrir/guardar
                //response.setHeader("Content-Disposition", "attachment; filename=reporte_administracion.pdf");
                response.setHeader("Content-Disposition", "inline; filename=reporte_administradores.pdf");
                response.setContentLength(bytes.length);
                try (ServletOutputStream ouputStream = response.getOutputStream()) {
                    ouputStream.write(bytes, 0, bytes.length);
                    ouputStream.flush();
                }
                response.sendRedirect(request.getContextPath() + "/Vision");

            } catch (ParseException ex) {
                Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
