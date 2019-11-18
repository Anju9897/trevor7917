
<%@page session="true" %>

<link rel="stylesheet" href="CSS/icon2.css">

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
        <c:forEach var="menu" items="${MenuPrincipal}">
            <li><a href="${pageContext.servletContext.contextPath}${menu.url}?op=${menu.idmenu}">${menu.menu}</a></li>    
        </c:forEach>
    </ul>
</div>