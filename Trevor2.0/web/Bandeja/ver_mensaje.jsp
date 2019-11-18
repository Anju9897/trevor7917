<%@include file="/_menu.jsp" %>

<div class="col-11 info2">
    <!--usuario-->
    <p class="col-12" ><b>${mensaje.u_reporta}</b></p>
    <br><br>
    <!--asunto-->
    <i class="col-12 col-t-12" >${mensaje.asunto}</i>
    <!--Descripcion-->
    <p class="col-12"> ${mensaje.descripcion} </p>
    <div class="col-12 butones">
        <button id="bck" class="icon icon-undo2" title="Volver" onclick="javascript: window.history.back()"></button>
        <a href="${pageContext.servletContext.contextPath}/Ticket?accion=generar"><button class="icon icon-ticket" title="Emitir Ticket"></button></a>
    </div>
</div>

<%@include file="/_down.jsp"%>