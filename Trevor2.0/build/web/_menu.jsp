<%@page import="com.trevor.entidad.Menu"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% HttpSession sesion = request.getSession();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trevor 7917</title>
        <link href="CSS/icon.css" rel="stylesheet" type="text/css">
        <link href="CSS/icon2.css" rel="stylesheet" type="text/css">
        <link href="CSS/menus.css" rel="stylesheet" type="text/css">
        <link href="CSS/cols.css" rel="stylesheet" type="text/css">
        <link href="CSS/tabla.css" rel="stylesheet" type="text/css">
        <link href="CSS/others_css.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div class="col-r nav">
            <ul>
                <c:forEach var="menu" items="${MenuPrincipal}">
                    <li>
                        <a title="${menu.menu}" href="${pageContext.servletContext.contextPath}${menu.url}">
                            <span class="${menu.descripcion}">
                            </span>
                        </a>
                    </li>    
                    </c:forEach>
                    <li>
                        <a  href="Principal?accion=logout" title="Cerrar Sesion">
                            <span  class="icon icon-exit">
                            </span>
                        </a>
                    </li>
            </ul>
        </div>
<div class="col-r2" id="content">
    <div class="col-12 info_usuario">
    <h4><strong>[<%= sesion.getAttribute("Nombre")%>]</strong> <span class="icon icon-user-tie" title="Usuario"></span></h4>
</div>