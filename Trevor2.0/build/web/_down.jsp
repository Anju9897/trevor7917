<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-12 footer" style="height: max-content;">  
            <strong>&copy; Copyright 2019 | Developed by : Wakandianos y una Blanca</strong>
</div>
</div>

<c:if test="${Rol==2}">
    <div class="col-1 stiki" id="btnredactar">
        <a class="icon icon-pencil2" title="Nuevo Mensaje" href="${pageContext.servletContext.contextPath}/Bandeja?accion=nuevo" id="redact">  </a>
    </div>
</c:if>
    </body>
</html>