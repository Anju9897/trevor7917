<%@include file="/_menu.jsp" %>

<form action="Ticket?accion=asignar_ticket">
    <div class="col-1"></div>
    <div class="col-6 info hide" id="info">
        <div class="col-2">
            <div class="inicial round"><p>${inicial}</p></div>
        </div>
        
        <div class="col-10 info2">
            <table class="col-12">
                <tr>
                    <td><input type="text" name="reporta" title="Reportador" class="font totick" readonly="readonly" placeholder="${mensaje.u_reporta}"/></td>
                </tr>
                <tr>
                    <td class="font">Asunto:</td>
                    <td class="font">Tipo de Problema:</td>
                </tr>
                <tr>
                    <td><input type="text" name="asunto" class="totick" placeholder="${mensaje.asunto}"></td>
                    <td><input type="text" name="tipo" class="totick" placeholder="${mensaje.tipo}"></td>
                </tr>
                <tr>
                    <td class="font">Descripcion:</td>
                </tr>
                <tr>
                    <td colspan="4"><textarea cols="25" rows="10" name="descripcion" class="totick" readonly="readonly">${mensaje.descripcion}</textarea></td>
                </tr>
            </table>
        </div>
        </div>
            
            
        <div class="col-a"></div>
        <div class="col-3 info">
            <div class="col-6"><label for="estado"/>Estado:</div>
            <div class="col-6">
                <select name="estado">
                    <c:forEach items="${estado}" var="e">
                        <option value="${e.idestado}">${e.estado}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-6"><label for="prioridad"/>Prioridades:</div>
            <div class="col-6">
                <select name="prioridad">
                    <c:forEach items="${prioridad}" var="p">
                        <option value="${p}">${p}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-6"><label for="encargado">Asignado A:</div>
            <div class="col-6"><input type name="encargado" class="totick" readonly="readonly" placeholder="${Usuario}"></div>
        </div>
        <div class="col-12 butones">
            <div class="stiki"> <a class="icon icon-cross"  id="bck"  onclick="javascript: window.history.back()" title="Cancelar" > </a> </div>

        </div>
</form>

<%@include file="/_down.jsp" %>
