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
    <div class="col-6 col-t-12 usrDiv" id="registroDiv">
        <form action="${pageContext.servletContext.contextPath}/Configuracion?accion=insertar_modificar" method="Post" id="formsingup">
            <div class="col-12 names">
            
                <input type="text" placeholder="Nombre" required id="name" name="txtnewname" value="${DatoUser.nombres}">
                <input type="text" placeholder="Apellido" required id="lstName" name="txtnewLast" value="${DatoUser.apellidos}">
            </div>
            <input type="text" placeholder="Nombre de Usuario" required id="nwusr" name="txtidUsuario" value="${DatoUser.idusuario}"><br>
            <input type="email" placeholder="Correo Electronico" required id="nwmail" name="txtMail" value="${DatoUser.email}"><br>
            <input type="text" placeholder="Telefono" required id="nwCell" name="txtTelefono" value="${DatoUser.telefono}"><br>
            <input type="submit" value="Aceptar" id="regis">
            <p class="back" onclick="javascript: return window.history.back()">Regresar</p>
        </form>
    </div>
</c:if>

<%@include file="/_down.jsp" %>