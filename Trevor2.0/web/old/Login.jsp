<%-- 
    Document   : Login
    Created on : 10-16-2019, 03:49:26 PM
    Author     : Georgina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trevor-7917 /Login</title>
        <link rel="stylesheet" href="CSS/index.css">
        <link rel="stylesheet" href="CSS/cols.css">
    </head>
    <body>
        <script src="JS/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="JS/funciones.js"></script>
        <div class="contenedor">
            <div class="opcidad">
                <header class="col-12 col-t-12" id="header">
                    <div class="col-6 col-t-12 img">
                        <a href="/Trevor2.0/Principal?accion=index" title="Inicio"> <img src="imagen/Trevor_isotipo_2.png" alt=""></a>
                    </div>
                    <div class="col-6 col-t-12 usrDiv" id="sesionDiv">


                        <form action="Auth?accion=iniciar" method="POST" id="formlogin" name="formulariologin">
                            <div class="col-12 error">
                                <c:if test="${error!=null}">
                                    <c:if test="${error==2}">
                                        <p><strong style="color: red">Usuario y/o contraseña incorrectos</strong></p>
                                    </c:if>
                                </c:if>
                            </div>
                            <input type="text" placeholder="Usuario o Correo" required id="usr" name="usr"><br>
                            <input type="password" placeholder="Contraseña" required id="pass" name="pass"><br>
                            <input type="submit" value="Ingresar" id="start">
                            <p class="back">Regresar</p>
                        </form>
                    </div>
                    <div class="col-6 col-t-12 usrDiv" id="registroDiv">
                        <form action="Auth?accion=registrar" method="Post" id="formsingup">
                            <div class="col-12 names">
                                <input type="text" placeholder="Nombre" required id="name" name="usrn">
                                <input type="text" placeholder="Apellido" required id="lstName" name="usrlst">
                            </div>
                            <input type="text" placeholder="Nombre de Usuario" required id="nwusr" name="nameusr"><br>
                            <input type="email" placeholder="Correo Electronico" required id="nwmail" name="usrmail"><br>
                            <input type="password" placeholder="Contraseña" required id="nwpass" name="usrpass"><br>
                            <input type="password" placeholder="Confirmar Contraseña" required id="nwpass2" name="usrpass2"><br>
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
