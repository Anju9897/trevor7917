
<%@include file="/_menu.jsp" %>

<div class="col-12 busqueda">    
    <h1>Tickets Asignados</h1>
</div>

<div class="col-12">
    <div class="col-1"></div>
    <div class="col-10 fonditito">
        <div class="col-3 ."> 
            <div class="col-3 baja"></div><b class="dvbaja"> BAJA </b>
        </div>
        <div class="col-3 ."> 
            <div class="col-3 media"></div><b class="dvmedia"> MEDIA </b>
        </div>
        <div class="col-3 ."> 
            <div class="col-3 alta"></div><b class="dvalta"> ALTA </b>
        </div>
        <div class="col-3 ."> 
            <div class="col-3 urg"></div><b class="dvurg"> URGENTE </b>
        </div>
    </div>
</div>

<c:if test="${vm!=null}">
    <c:forEach var="vm" begin="${li-1}" end="${ls-1}" items="${vm}">
        <div class="col-12 ">
            <div class="col-1"></div>
            <a class="col-10 fondoMs" href="Tickets?accion=detalle&id=${vm.idticket}">
                <div class="col-11 opcion3">
                    <p class="col-3" ><b>Reporta:</b></br><i>${vm.usuario}</i></p>
                    <p class="col-3" ><b>Fecha Asignado:</b></br><i> <fmt:formatDate type="date" dateStyle = "short" value="${vm.fecha}"/> </i></p>
                    <p class="col-3" ><b>Problema:</b></br><i>${vm.tipo}</i></p>
                    <p class="col-3" ><b>Estado:</b></br><i>${vm.estado}</i></p>
                </div>
                <div class="col-1">
                    <div class=" col-2 bolita bolita-${vm.prioridad}"></div>
                </div>
            </a>
        </div>
    </c:forEach>
</c:if>



<div class="col-12">
    <div class="footer2">
        <c:forEach begin="1" end="${n_paginas_}" varStatus="i">
            <a href="${pageContext.servletContext.contextPath}/Tickets?pag=${i.index}">${i.index}</a>
        </c:forEach> </div>
</div>

<%@include file="/_down.jsp" %>