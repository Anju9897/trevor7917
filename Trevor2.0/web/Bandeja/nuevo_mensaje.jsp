<%@include file="/_menu.jsp" %>

<div class="col-12" id="soli">
     <form class="col-6 areaM fondoK2" action="Bandeja?accion=Enviar" method="Post">
        <table class="  col-12"> 
            
            <tr><td><h3 class="col-12 new">Nuevo Mensaje</h3></td></tr>
            <tr>
                <td><label for="usuario">Usuario</label></td>
                <td><input type="text" placeholder="Solicitante" name="usuario" readonly="readonly" value="${Usuario}"></td>
            </tr>
            <tr>
                <td><label for="Asunto">Asunto:</label></td>
                <td><input type="text" placeholder="Asunto" name="asunto"></td>
            </tr>
            <tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr>
            <tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr>
            <tr>
                <td><label for="problema">Clasificación de Problema:</label></td>
                <td>
                    <c:forEach var="problema" items="${problema}">
                        <input type="radio" name="problema" value="${problema}">
                        <label for="problema">${problema}</label><br>
                    </c:forEach>
                </td>
            </tr>
            <tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr>
            <tr>
                    <td><label for="Descripcion">Descripcion</label></td>
                <td><textarea maxlength="2000" cols="70" rows="15" name="Descripcion" placeholder="Descripcion de Problema"></textarea></td>
            </tr>
            <tr><br></tr><tr><br></tr><tr><br></tr><tr><br></tr>
            <tr>
                <td> <input  class="botA icon icon-undo2 " type="submit" value="Enviar" id="send" ></td>
                <td><a class=" icon icon-undo2 botA"type="button" value="Regresar" onclick="javascript: window.history.back()" id="null"> </a> </td>
            </tr>
        </table>
    </form>
</div>

<%@include file="/_down.jsp" %>