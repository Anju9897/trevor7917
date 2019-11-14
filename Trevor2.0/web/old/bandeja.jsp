<%-- 
    Document   : bandeja
    Created on : 10-16-2019, 03:55:12 PM
    Author     : Georgina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trevor-7917 /Bandeja</title>
        <link rel="stylesheet" href="CSS/icon.css">
        <link rel="stylesheet" href="CSS/nav.css">
        <link rel="stylesheet" href="/CSS/cols.css">
    </head>
    <body>
        <div class="contenedor row">
            <%@include file="Menu_agente.jsp" %>
            <div class="col-r2">
                <div id="principal">
                    
                <%@include file="barra_lateral.jsp" %>
                    <div class="col-12 opcion2" id="mc">
                        <p class="col-12" ><b>McLaren</b></p>
                        <br><br>
                        <i class="col-12 col-t-12" >Asunto: Problema en el centro de computo A21</i>
                        <p class="col-12">Muy buenos dias, queria consultarles que la maquina numero 3 de la fila 8 esta dando problemas a la hora de encender</p>
                        <br>
                    </div>
                    <div class="col-12 opcion2">
                        <p class="col-12 col-t-12" ><b> Marcy </b></p>
                        <br><br>
                        <i class="col-12 col-t-12" >Asunto: Problema en el centro de computo A21</i>
                        <p class="col-12 col-t-12" >Lorem ipsum dolor sit amet consectetur adipisicing elit. Totam quasi repellendus, voluptates dolorem quaerat at facilis, debitis, inventore molestiae libero tempore voluptas nulla quidem sunt saepe nobis cumque iusto corporis? </p>
                        <br>
                    </div>
                    <div class="col-12 opcion2">
                        <p class="col-12 col-t-12" ><b> Phillip </b></p>
                        <br><br>
                        <i class="col-12 col-t-12" >Asunto: Problema en el centro de computo A21</i>
                        <p class="col-12 col-t-12" >Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit eum animi tempora veritatis ratione numquam repudiandae enimrepellat doloribus, id mollitia, ab et,  quibusdam non sapiente! Incidunt veniam tempore quae!</p>
                        <br>
                    </div>
                </div>
                <div class="col-12 info hide" id="info">
                    <div class="col-1">
                        <div class="round"><p>M</p></div>
                    </div>
                <div class="col-11 info2">
                    <p class="col-12" ><b>McLaren</b></p>
                    <br><br>
                    <i class="col-12 col-t-12" >Asunto: Problema en el centro de computo A21</i>
                    <p class="col-12">Muy buenos dias, queria consultarles que la maquina numero 3 de la fila 8 esta dando problemas a la hora de encender</p>
                    <br>
                    <p class="col-12">Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus ipsa saepe recusandae iste, harum iusto aliquid dolor in aperiam ab, repellendus omnis ea voluptatibus labore modi sit. Eveniet, vitae possimus.
                    Molestias optio maiores corrupti praesentium culpa, eligendi ab nesciunt, sequi, libero porro beatae? Nisi voluptates ex iure aspernatur fugiat amet, sapiente sed ad impedit maiores provident porro, alias id blanditiis?
                    Repudiandae ex repellat et ipsam nulla praesentium eligendi, nihil eveniet, numquam dicta dolore sed voluptates, amet nisi expedita vero quisquam sunt aliquid libero cum id deleniti aliquam ab? Mollitia, at.
                    Quam voluptatibus, dolorem recusandae exercitationem blanditiis soluta sint expedita? Dicta enim iusto ab debitis vitae maiores aut, similique ratione quibusdam incidunt quasi consectetur molestias tempora in. Debitis amet nulla reiciendis.
                    Provident aspernatur dolor quo quaerat pariatur voluptatum architecto sunt rerum nihil id sint maxime quae, alias omnis nemo? Asperiores molestiae similique voluptatibus recusandae libero sunt culpa, fugiat necessitatibus maxime enim?</p>
                    <div class="col-12 butones">
                        <button id="bck" class="icon icon-undo2" title="Volver"></button>
                        <a href="Principal?accion=Tickets"><button class="icon icon-ticket" title="Emitir Ticket"></button></a>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <script src="JS/jquery-3.4.1.js"></script>
    <script src="JS/funciones.js"></script>
</body>
    </body>
</html>
