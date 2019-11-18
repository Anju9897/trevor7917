<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trevor-7917 / Bandeja de Entrada</title>

    <link rel="stylesheet" href="CSS/icon.css">
    <link rel="stylesheet" href="CSS/nav.css">
    <link rel="stylesheet" href="CSS/cols.css">
    
</head>
<body>
    <div class="contenedor row">
        <%@include file="menu_usuario.jsp" %>
        <div class="col-r2">
            <div class="col-1 stiki" id="btnredactar">
                <span class="icon icon-pencil2" title="Redactar" id="redact">  </span>
            </div>
            <div id="principal">
                    <div class="col-11 panel" >
                          <h2>  Bandeja de Entrada </h2>
                    </div>
                        <div class="col-12 opcion2">
                            <p class="col-12" ><b>McLaren</b></p>
                            <br><br>
                            <i class="col-12 col-t-12" >Asunto: Problema en el centro de computo A21</i>
                            <p class="col-12">Muy buenos dias, queria consultarles que la maquina numero 3 de la fila 8 esta dando problemas a la hora de encender</p>
                            <br>
                        </div>
                        <div class="col-12 opcion2">
                            <p class="col-12 col-t-12" ><b>McLaren</b></p>
                            <br><br>
                            <i class="col-12 col-t-12" >Asunto: Problema en el centro de computo A21</i>
                            <p class="col-12 col-t-12" >Lorem ipsum dolor sit amet consectetur adipisicing elit. Totam quasi repellendus, voluptates dolorem quaerat at facilis, debitis, inventore molestiae libero tempore voluptas nulla quidem sunt saepe nobis cumque iusto corporis? </p>
                            <br>
                        </div>
                        <div class="col-12 opcion2">
                            <p class="col-12 col-t-12" ><b> McLaren </b></p>
                            <br><br>
                            <i class="col-12 col-t-12" >Asunto: Problema en el centro de computo A21</i>
                            <p class="col-12 col-t-12" >Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit eum animi tempora veritatis ratione numquam repudiandae enimrepellat doloribus, id mollitia, ab et,  quibusdam non sapiente! Incidunt veniam tempore quae!</p>
                            <br>
                        </div>
                        <div class="col-12 opcion2">
                                <p class="col-12" ><b>McLaren</b></p>
                                <br><br>
                                <i class="col-12 col-t-12" >Asunto: Problema en el centro de computo A21</i>
                                <p class="col-12">Muy buenos dias, queria consultarles que la maquina numero 3 de la fila 8 esta dando problemas a la hora de encender</p>
                                <br>
                            </div>         
            </div>
            <!-- Cuadro para redactar solicitud -->
            <div class="col-11" id="soli">
                <form action="Principal?accion=mail" method="GET">
                    <h3 class="col-12">Nuevo Mensaje</h3>
                    <div class="infoA">
                        <input type="text" placeholder="Solicitante" name="nombreS"><br>
                        <input type="text" placeholder="Asunto" name="asunto"><br><br>
                    </div>
                    <div>
                        <label for="problema">Clasificación:</label><br>
                        <input type="radio" name="problema"> Software<br>
                        <input type="radio" name="problema"> Hardware<br>
                        <input type="radio" name="problema"> Problemas de Conexión<br>
                        <input type="radio" name="problema"> Accidente<br>
                        <input type="radio" name="problema"> Falla de Sistema<br><br>
                    </div>
                    <div>
                        <textarea placeholder="Descripcion de Solicitud"></textarea>
                    </div>
                    <div class="btnUsr">
                        <input type="button" value="Anular" id="null">
                        <input type="submit" value="Enviar" id="send">
                    </div>
                </form>
            </div>
        </div>
    </div>
    

    <script src="JS/jquery-3.4.1.js"></script>
    <script src="JS/funciones.js"></script>
    <script src="JS/graficas.js"></script>   
</body>
</html>