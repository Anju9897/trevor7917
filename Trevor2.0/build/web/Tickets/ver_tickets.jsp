<%@include file="/_menu.jsp" %>

<div class="col-12">
    <div class="col-1"></div>
    <div class="col-10 fonditito">
        <div class="col-3 ."> 
            <div class="col-3 alta"></div><b class="dvalta"> ALTA </b>
        </div>
        <div class="col-3 ."> 
            <div class="col-3 media"></div><b class="dvmedia"> MEDIA </b>
        </div>
        <div class="col-3 ."> 
            <div class="col-3 baja"></div><b class="dvbaja"> BAJA </b>
        </div>
        <div class="col-3 ."> 
            <div class="col-3 urg"></div><b class="dvurg"> URGENTE </b>
        </div>
    </div>
</div>

<c:forEach var="vm" begin="${li-1}" end="${ls-1}" items="${vm}">
    <div class="col-12 ">
    <div class="col-1"></div>
    <a class="col-10 fondoMs" href="Tickets?accion=detalle">
        <div class="col-11 opcion3">
            <p class="col-4" ><b>Usuario:</b></br><i>${vm.usuario}</i></p>
            <p class="col-4" ><b>Fecha:</b></br><i>${vm.fecha}</i></p>
            <p class="col-4" ><b>Tipo:</b></br><i>${vm.tipo}</i></p>
        </div>
        <div class="col-1">
            <div class="col-12 bolita bolita-${vm.prioridad}"></div>
        </div>
    </a>
</div>
</c:forEach>


<div class="col-12">
    <div class="footer2">
    <c:forEach begin="1" end="${n_paginas_}" varStatus="i">
        <a href="${pageContext.servletContext.contextPath}/Tickets?pag=${i.index}">${i.index}</a>
    </c:forEach> </div>
</div>

<%@include file="/_down.jsp" %>