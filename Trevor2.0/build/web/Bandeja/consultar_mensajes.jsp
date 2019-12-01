<%@include file="/_menu.jsp" %>

<c:if test="${Rol==2}">
    <c:if test="${resultado!=null}">   
        <c:if test="${resultado==1}">        
            <script>
                swal({
                    text: "Mensaje Creado con Exito",
                    icon: "success",
                    buttons: false,
                    timer: 3000
                });
            </script>
        </c:if> 
        <c:if test="${resultado==0}">       
            <script>
                swal({
                    text: "Este Mensaje no pude ser recibido",
                    icon: "error",
                    buttons: false,
                    timer: 3000
                });
            </script>  
        </c:if>
    </c:if>
</c:if>

<div class="col-12 busqueda">    
    <h1>Bandeja de Mensajes</h1>
</div>
                ${tabla}


<%@include file="/_down.jsp" %>