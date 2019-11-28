<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/_menu.jsp" %>

<c:if test="${Rol==1}">
    <c:if test="${resultado!=null}">   
        <c:if test="${resultado==1}">        
            <p style="color:darkgreen">
                <strong>Operación realizada correctamente.</strong>
            </p>   
        </c:if> 
        <c:if test="${resultado==0}">       
            <p style="color:darkred">
                <strong>La operación no se realizó.</strong>
            </p>    
        </c:if>
    </c:if> 
    <div class="busqueda">    
        <h1>Listado Usuarios</h1>
        <br>
        <form action="${pageContext.servletContext.contextPath}/Configuracion" method="get">      
            <input type="text" placeholder="Nombre de Usuario" name="txtBusqueda" id="txtBusqueda" value="${valor}" />    
            <input class="icon icon-search buttons" type="submit" value="Buscar"/>
            <div class="stiki">
                <a class="buttons" href="${pageContext.servletContext.contextPath}/Configuracion?accion=insertar"><span class="icon icon-user-plus" title="Nuevo Usuario"></span></a>  
            </div>
        </form> 

    </div>          

    <br/> 
    ${tabla}
    <script>
        window.onload = function () {
            document.getElementById("txtBusqueda").focus();
        };
    </script> 
</c:if>

<c:if test="${Rol==2}">
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
                    <td><input type="text" placeholder="Nombre" required  name="txtnewname" value="${DatoUser.nombres}"></td>
                </tr>
                <tr>
                    <td><label for="txtnewLast">Apellido:</td>
                    <td><input type="text" placeholder="Apellido" required  name="txtnewLast" value="${DatoUser.apellidos}"></td>
                </tr>
                <tr>
                    <td><label for="txtidUsuario">Usuario:</td>
                    <td><input type="text" placeholder="Nombre de Usuario" required readonly="readonly"  name="txtidUsuario" value="${DatoUser.idusuario}"></td>
                </tr>
                <tr>
                    <td><label for="txtidUsuario">Correo:</td>
                    <td><input type="email" placeholder="Correo Electronico" required  name="txtMail" value="${DatoUser.email}"></td>
                </tr>
                <tr>
                    <td><label for="txtTelefono">Telefono:</td>
                    <td><input type="text" placeholder="Telefono" name="txtTelefono" value="${DatoUser.telefono}"></td>
                </tr>
                <tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr>
             <tr>
                 <td><input class="botA icon icon-undo2 " type="submit" value="Aceptar" id="Actualizar"></td>
                <td><a class=" icon icon-undo2 botA"type="button" value="Regresar" onclick="javascript: window.history.back()" id="null"> </a> </td>
            </tr>

            </table>
        </form>
    </div>
</c:if>
    
    <script>
        window.onload = function () {
            document.getElementById("txtnewname").focus();
        };
    </script> 

<%@include file="/_down.jsp" %>
