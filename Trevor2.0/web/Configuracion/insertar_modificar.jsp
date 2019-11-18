<%@include file="/_menu.jsp" %>

<div class="col-6 col-t-12 usrDiv" id="registroDiv">
    <form action="${pageContext.servletContext.contextPath}/Configuracion?accion=insertar_modificar" method="Post" id="formsingup">
        <div class="col-12 names">
            <input type="text" placeholder="Nombre" required id="name" name="txtnewname" value="${usuario.nombres}">
            <input type="text" placeholder="Apellido" required id="lstName" name="txtnewLast" value="${usuario.apellidos}">
        </div>
        <input type="text" placeholder="Nombre de Usuario" required id="nwusr" name="txtidUsuario" value="${usuario.idusuario}"><br>
        <input type="email" placeholder="Correo Electronico" required id="nwmail" name="txtMail" value="${usuario.email}"><br>
        <input type="text" placeholder="Telefono" required id="nwCell" name="txtTelefono" value="${usuario.telefono}"><br>
        <input type="password" placeholder="Contraseña" required id="nwpass" name="txtPass" value="${usuario.clave}"><br>
        <input type="submit" value="Aceptar" id="regis">
        <p class="back" onclick="javascript: return window.history.back()">Regresar</p>
    </form>
</div>

<%@include file="/_down.jsp" %>
