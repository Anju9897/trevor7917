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
            <p class="col-3 font" >Estado:  <i style="font-size:20px;">
                
                    <c:if test="${mensaje.idestado==1}">
                        Mensaje
                    </c:if>
                    <c:if test="${mensaje.idestado==2}">
                        Abierto
                    </c:if>
                    <c:if test="${mensaje.idestado==3}">
                        cerrado
                    </c:if>
                    <c:if test="${mensaje.idestado==4}">
                        en espera
                    </c:if>
                    
                </i></p>
            <p class="col-3 font" >Prioridad: <i style="font-size:20px;">${mensaje.prioridad}</i></p>
            <p class="col-3 font" >Tipo: <i style="font-size:20px;">${mensaje.tipo}</i></p>
            <p class="col-6 font" >Asunto: <br><i style="font-size:20px;">${mensaje.asunto}</i></p>
            <p class="col-6 font" >Fecha Reportado: <br><i style="font-size:20px;">${mensaje.fecha_emision}</i></p>
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