<%@include file="/_menu.jsp" %>

<div class="col-5" id="usuarioform">
    <form action="${pageContext.servletContext.contextPath}/Configuracion?accion=insertar_modificar" method="Post" id="formsingup">
        <table>
            <tr>
                <td colspan="2"><h2>Configuracion e Informacion del Usuario</td>
            </tr>
            <tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr>
            <tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr>
            <tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr>
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

        
        
    </form>
</div>
            
    <script>
        window.onload = function () {
            document.getElementById("txtnewname").focus();
        };
    </script>         

<%@include file="/_down.jsp" %>
