<%@include file="/_menu.jsp" %>

<div class="col-12">
    <div class="col-1">
    </div>
    <div class="col-10 info hide" id="info">
        <div class="col-1">
            <div class="inicial round"><p>${inicial}</p></div>
        </div>
        <div class="col-11 info2">
            <p class="col-3 font"><b>${mensaje.u_reporta}</b></p>
            <p class="col-3 font" >Estado:  <i style="font-size:16px;">${mensaje.idestado}</i></p>
            <p class="col-3 font" >Prioridad: <i style="font-size:16px;">${mensaje.prioridad}</i></p>
            <p class="col-3 font" >Tipo: <i style="font-size:16px;">${mensaje.tipo}</i></p>
            <p class="col-12 font" >Asunto: <br><i style="font-size:16px;">${mensaje.asunto}</i></p>
            <p class="col-12 font">Descripcion:</p>
            <b class="col-12">${mensaje.descripcion}</b>
        </div>
    </div>
</div>

<div class="col-12 butones">
            <div class="stiki mov"> <a class="icon icon-undo2  "  id="bck"  onclick="javascript: window.history.back()" title="Volver" > </a> </div>
            <div class="stiki"> <a  title="Editar" class="icon icon-pencil2" href="${pageContext.servletContext.contextPath}/Tickets?accion=generar"></a></div>
   
    </div>


<%@include file="/_down.jsp" %>