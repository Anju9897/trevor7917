<%@include file="/_menu.jsp" %>

<c:forEach items="${historial}" begin="${li-1}" end="${ls-1}"  var="i">
        <div class="col-12 ">
    <div class="col-1"></div>
    <a class="col-10 fondoMs" href="">
        <div class="col-11 opcion3">
            <p> Su solicitud ha sido aceptada por el administrador <i>${i.encargado}</i> 
                con el Ticket <i>#${i.idticket}</i> y esta en estado de <i>${i.estado}</i> </p>
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