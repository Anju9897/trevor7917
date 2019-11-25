<%@include file="/_menu.jsp" %>

<<<<<<< HEAD
<<<<<<< HEAD
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
=======
=======
>>>>>>> bfc55c69b94a3e756bb80d5955545a0ed3c610f4
<div class="col-5" id="usuarioform">
    <form action="${pageContext.servletContext.contextPath}/Configuracion?accion=insertar_modificar" method="Post" id="formsingup">
        <table>
            <tr>
                <td><label for="txtnewname">Nombre:</td>
                <td><input type="text" placeholder="Nombre" required  name="txtnewname" value="${usuario.nombres}"></td>
            </tr>
            <tr>
                <td><label for="txtnewLast">Apellido:</td>
                <td><input type="text" placeholder="Apellido" required  name="txtnewLast" value="${usuario.apellidos}"></td>
            </tr>
            <tr>
                <td><label for="txtidUsuario">Usuario:</td>
                <td><input type="text" placeholder="Nombre de Usuario" required readonly="readonly"  name="txtidUsuario" value="${usuario.idusuario}"></td>
            </tr>
            <tr>
                <td><label for="txtidUsuario">Correo:</td>
                <td><input type="email" placeholder="Correo Electronico" required  name="txtMail" value="${usuario.email}"></td>
            </tr>
            <tr>
                <td><label for="txtTelefono">Telefono:</td>
                <td><input type="text" placeholder="Telefono" name="txtTelefono" value="${usuario.telefono}"></td>
            </tr>
            <tr>
                <td><label for="txtidUsuario">Rol:</td>
                <td>
                    <select name="sltrol" class="select">
                        <c:forEach items="${roles}" var="r">
                            <option value="${r.idRol}">${r.rol}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            
            <tr>
                <td><input type="submit" value="Aceptar" id="Actualizar"></td>
                <td><p class="back" onclick="javascript: return window.history.back()">Regresar</p></td>
            </tr>

        </table>

        
        
<<<<<<< HEAD
>>>>>>> 7e115a1027bf10552562cde371c28236d4129cc3
=======
>>>>>>> bfc55c69b94a3e756bb80d5955545a0ed3c610f4
    </form>
</div>

<%@include file="/_down.jsp" %>
