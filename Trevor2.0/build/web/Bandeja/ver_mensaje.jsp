<%@include file="/_menu.jsp" %>



<div class="col-9 info2 fondoK">
    <!--usuario-->
    <p class="col-12 "  ><b>${mensaje.u_reporta}</b></p>
    <br><br>
    <!--asunto-->
    <i class="col-12 col-t-12" >${mensaje.asunto}</i>
    <!--Descripcion-->
    <p class="col-12"> ${mensaje.descripcion} </p>

</div>
        <div class="col-12 butones">
        <div class="stiki mov"> <a class="icon icon-undo2  "  id="bck"  onclick="javascript: window.history.back()" title="Volver" > </a> </div>
        <div class="stiki"> <a  title="Emitir Ticket" class="icon icon-ticket" href="${pageContext.servletContext.contextPath}/Ticket?accion=generar"></a></div>
    </div>

<%@include file="/_down.jsp"%>