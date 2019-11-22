<%@page session="true" %>

<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("usuario") == null || request.getSession() == null) {
        response.sendRedirect("Principal?accion=Login");
    }
    response.setHeader("Cache-control", "no-cache,no-store,must-validate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>



<div class="col-r nav">
    <ul>
        <li><a href="/Trevor2.0/Principal?accion=conf" title="Configuracion"><span class="icon icon-cog"></span></a></li>
        <li><a href="/Trevor2.0/Principal?accion=mail" title="Bandeja de Entrada"><span class="icon icon-drawer "></span></a></li>
        <li><a href="" title="Notificacion"><span class="icon icon-bell"></span></a></li>
        <li><a href="/Trevor2.0/Principal?accion=out" title="Salir"><span class="icon icon-exit"></span></a></li>
    </ul>
</div>