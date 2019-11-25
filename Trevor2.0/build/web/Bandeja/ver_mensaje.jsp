<%@include file="/_menu.jsp" %>



<div class="col-6 info2 fondoK">
    <center><p class="col-12 "  >Detalle del Mensaje</b></p></center>
    <!--usuario-->
    <p class="col-12 "  ><i>Enviado por:</i><br><b>${mensaje.u_reporta}</b></p>
    <br><br>
    <!--asunto-->
    <p class="col-12 col-t-12" ><i>Asunto:</i><br>${mensaje.asunto}</p>
    <!--Descripcion-->
    <p class="col-12"><i>Descripcion:</i><br> ${mensaje.descripcion} </p>

</div>
        <div class="col-12 butones">
        <div class="stiki mov"> <a class="icon icon-undo2  "  id="bck"  onclick="javascript: window.history.back()" title="Volver" > </a> </div>
        <div class="stiki"> <a  title="Emitir Ticket" class="icon icon-ticket" href="${pageContext.servletContext.contextPath}/Ticket?accion=generar"></a></div>
    </div>

<%@include file="/_down.jsp"%>