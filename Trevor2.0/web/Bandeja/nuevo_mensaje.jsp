<%@include file="/_menu.jsp" %>

<div class="col-12" id="soli">
    <form action="Bandeja?accion=Enviar" method="Post">
        <h3 class="col-12">Nuevo Mensaje</h3>
        <div class="infoA">
            <input type="text" placeholder="Solicitante" name="usuario" readonly="readonly" value="${Usuario}"><br>
            <input type="text" placeholder="Asunto" name="asunto"><br><br>
        </div>
        <div>
            <label>Clasificación:</label><br>
            <c:forEach var="problema" items="${problema}">
                <input type="radio" name="problema" value="${problema}">
                <label for="problema">${problema}</label><br>
            </c:forEach>
        </div>
        <div>
            <textarea name="Descripcion" placeholder="Descripcion de Solicitud"></textarea>
        </div>
        <div class="btnUsr">
            <input type="button" value="Regresar" onclick="javascript: window.history.back()" id="null">
            <input type="submit" value="Enviar" id="send">
        </div>
    </form>
</div>

<%@include file="/_down.jsp" %>