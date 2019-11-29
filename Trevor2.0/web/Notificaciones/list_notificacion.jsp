<%@include file="/_menu.jsp" %>
<c:if test="${historial!=null}">
    <div class="col-12 busqueda">    
        <h1>Notificaciones de Tickets</h1>
    </div>
    <c:forEach  begin="${li-1}" end="${ls-1}" varStatus="i">
        <div class="col-12 ">
            <div class="col-1"></div>
            <a class="col-10 fondoMs" href="">
                <div class="col-11 opcion3">
                    <p> Su solicitud ha sido aceptada por el administrador <b class="hover">${historial.get(i.index).getEncargado()}</b> 
                        con el Ticket <b class="hover">#${historial.get(i.index).getIdticket()}</b> y esta en estado de <b class="hover">${historial.get(i.index).getEstado()}</b> </p>
                </div>
            </a>
        </div>
    </c:forEach>

    <div class="col-12">
        <div class="footer2">
            <c:forEach begin="1" end="${n_paginas_}" varStatus="i">
                <a href="${pageContext.servletContext.contextPath}/Notificacion?pag=${i.index}">${i.index}</a>
            </c:forEach> </div>
    </div>

</c:if>

<c:if test="${historial==null}">
    <div class="col-12 busqueda">    
        <h1>No tienes notifiaciones aun</h1>
    </div>
</c:if>

<%@include file="/_down.jsp" %>