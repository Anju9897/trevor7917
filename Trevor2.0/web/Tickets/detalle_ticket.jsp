<%@include file="/_menu.jsp" %>

<div class="col-1">
</div>
<div class="col-10 info hide" id="info">
    <div class="col-1">
        <div class="inicial round"><p>${inicial}</p></div>
    </div>
    <div class="col-11 info2">
        <p class="col-12 font"><b>${mensaje.u_reporta}</b></p>
        <br><br>
        <p class="col-12 font" >Asunto: <br><i style="font-size:16px;">${mensaje.asunto}</i></p>
        <p class="col-12 font">Descripcion:</p>
        <b class="col-12">${mensaje.descripcion}</b>

    </div>

    <%@include file="/_down.jsp" %>