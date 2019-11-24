<%@include file="/_menu.jsp" %>

<div class="col-6 col-t-12" id="registroDiv">
    <form action="${pageContext.servletContext.contextPath}/Configuracion?accion=insertar_modificar" method="Post" id="formsingup">
        <div class="col-12 names">
            <input type="text" placeholder="Nombre" required  name="txtnewname" value="${usuario.nombres}">
            <input type="text" placeholder="Apellido" required  name="txtnewLast" value="${usuario.apellidos}">
        </div>
        <input type="text" placeholder="Nombre de Usuario" required  name="txtidUsuario" value="${usuario.idusuario}"><br>
        <input type="email" placeholder="Correo Electronico" required  name="txtMail" value="${usuario.email}"><br>
        <input type="text" placeholder="Telefono" name="txtTelefono" value="${usuario.telefono}"><br>
        
        <select name="sltrol" >
            <c:forEach items="${roles}" var="r">
                <option value="${r.idrol}">${r.rol}</option>
            </c:forEach>
        </select>
        
        <input type="submit" value="Aceptar" id="Actualizar">
        <p class="back" onclick="javascript: return window.history.back()">Regresar</p>
    </form>
</div>

<%@include file="/_down.jsp" %>
