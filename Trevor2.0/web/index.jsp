<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trevor-7917</title>
        <link rel="stylesheet" href="CSS/index.css">
        <link rel="stylesheet" href="CSS/cols.css">
    </head>
    <body>
        <script src="JS/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="JS/funciones.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <div class="contenedor">
            <div class="opcidad">
                <header class="col-12 col-t-12" id="header">
                    <div class="col-6 col-t-12 img">
                        <a href="${pageContext.servletContext.contextPath}/About" title="Acerca "> <img src="imagen/Trevor_isotipo_2.png"></a>
                    </div>
                    <div class="col-6 col-t-12 usrDiv" id="sesionDiv">
                        <form  name="main" action="Login?accion=login" method="POST">
                            <div class="col-12 error">
                                <c:if test="${error!=null}">
                                    <c:if test="${error==2}">
                                        <script>
                                            swal({
                                                text: "Usuario y/o Contraseña Incorrecto\nPorfavor, Intente Nuevamente",
                                                icon: "error",
                                                buttons: false,
                                                timer: 2000,
                                            });
                                        </script>
                                    </c:if>
                                </c:if>
                            </div>
                            <input  placeholder="Usuario o Correo" required id="usr" type="text" name="txtUsuario" ><br>
                            <input  placeholder="Contraseña" required id="pass" type="password" name="txtClave"><br>
                            <input type="submit" value="Entrar" name="btnEntrar">
                            <p class="back">Regresar</p>
                        </form>
                    </div>
                    <div class="col-6 col-t-12 usrDiv" id="registroDiv">
                        <form action="${pageContext.servletContext.contextPath}/Configuracion?accion=insertar_modificar" method="Post" id="formsingup">
                            <div class="col-12 names">
                                <input type="text" placeholder="Nombre" required id="name" name="txtnewname">
                                <input type="text" placeholder="Apellido" required id="lstName" name="txtnewLast">
                            </div>
                            <input type="text" placeholder="Nombre de Usuario" required id="nwusr" name="txtidUsuario"><br>
                            <input type="email" placeholder="Correo Electronico" required id="nwmail" name="txtMail"><br>
                            <input type="text" placeholder="Telefono" required id="nwCell" name="txtTelefono"><br>
                            <input type="password" placeholder="Contraseña" required id="nwpass" name="txtPass"><br>
                            <input type="password" placeholder="Confirmar Contraseña" required id="nwpass2" name="txtPass2"><br>
                            <input type="submit" value="Registrar" id="regis">
                            <p class="back">Regresar</p>
                        </form>
                    </div>
                    <div class="col-6 col-t-12 botones" id="Butons">
                        <Button class="Button_formato" id="sesion">Iniciar Sesión</Button>
                        <button class="Button_formato" id="registro">Registrarse</button>
                    </div>
                </header>
            </div>
        </div>
    </body>
</html>
