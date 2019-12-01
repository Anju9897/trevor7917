<%@include file="/_menu.jsp" %>
<div class="inivision">    
    <div class="busqueda">    
        <h1 class="col-6">Reportes Trevor7917</h1>
        <img src="imagen/logo.png" style="width: 75px; height: auto;" >
    </div>
</div>
<div class="controladoresA">
    <c:if test="${conteo!=null}">
        <c:forEach items="${conteo}" var="c">
            <div class="col-2">${c.estado}<p>${c.cEstado}</p></div>
                </c:forEach>  
            </c:if>
            <c:if test="${conteo==null}">
        <div class="col-2">mensaje<p>0</p></div>
        <div class="col-2">abierto<p>0</p></div>
        <div class="col-2">cerrado<p>0</p></div>
        <div class="col-2">en espera<p>0</p></div>
    </c:if>
</div>
<div class="row">
    <div class="col-12">
        <div class="col-4 listadere">
            <div id="sr"><p> Reportes por estado</p></div>
            <div id="ven"><p>Reportes por tipo</p></div>
            <div id="venhoy"><p>Reportes por historial</p></div>
            <div id="open"><p>Reportes por prioridad</p></div>
            <div id="pen"><p>Reportes por administradores</p></div> 
        </div>
        <div class="cuadro">
            <div class="col-6 cuadrore" id="sinResolver">
                <form action="Reportes?accion=reporte_estado" method="Post">
                    <table class="col-12">
                        <tr> <h3 style="text-align: center; color: #3a727f;">Detalle de reporte de Administradores</h3></tr>
                        <tr><p style="text-align: center; color: #3a727f;"> Digite el rango de fecha en el que desea realizar el reporte</p></tr>
                        <tr >
                            <td colspan="3"><h4 style="color:#3a727f">Desde:</h4></td>
                            <td colspan="3"><h4  style="color:#3a727f">Hasta:</h4></td>
                        </tr>
                        <tr>
                            <td colspan="3"><input class="nuevafecha" type="date" name="fechaini" size="25"></td>
                            <td colspan="3"><input class="nuevafecha" type="date" name="fechafin" size="25"></td>
                        </tr>
                    </table>
                    <input type="submit" class=" col-4 generarreportelista" value="Generar Reporte"/>
                </form> 

            </div>

            <div class="col-6 cuadrore" id="vencidos">
                <form action="Reportes?accion=reporte_problema" method="Post">
                    <table class="col-12">
                        <tr> <h3 style="text-align: center; color: #3a727f;">Detalle de reporte de Administradores</h3></tr>
                        <tr><p style="text-align: center; color: #3a727f;"> Digite el rango de fecha en el que desea realizar el reporte</p></tr>
                        <tr >
                            <td colspan="3"><h4 style="color:#3a727f">Desde:</h4></td>
                            <td colspan="3"><h4  style="color:#3a727f">Hasta:</h4></td>
                        </tr>
                        <tr>
                            <td colspan="3"><input class="nuevafecha" type="date" name="fechaini" size="25"></td>
                            <td colspan="3"><input class="nuevafecha" type="date" name="fechafin" size="25"></td>
                        </tr>
                    </table>
                    <input type="submit" class=" col-4 generarreportelista" value="Generar Reporte"/>
                </form>

            </div>

            <div class="col-6 cuadrore" id="Vence_hoy">
                <form action="Reporte?accion=reporte_historial" method="Post">
                    <table class="col-12">
                        <tr> <h3 style="text-align: center; color: #3a727f;">Detalle de reporte de Administradores</h3></tr>
                        <tr><p style="text-align: center; color: #3a727f;"> Digite el rango de fecha en el que desea realizar el reporte</p></tr>
                        <tr >
                            <td colspan="3"><h4 style="color:#3a727f">Desde:</h4></td>
                            <td colspan="3"><h4  style="color:#3a727f">Hasta:</h4></td>
                        </tr>
                        <tr>
                            <td colspan="3"><input class="nuevafecha" type="date" name="fechaini" size="25"></td>
                            <td colspan="3"><input class="nuevafecha" type="date" name="fechafin" size="25"></td>
                        </tr>
                    </table>
                    <input type="submit" class=" col-4 generarreportelista" value="Generar Reporte"/>
                </form>

            </div>

            <div class="col-6 cuadrore" id="abiertos">
                <form action="Reportes?accion=reporte_prioridad" method="Post">
                    <table class="col-12">
                        <tr> <h3 style="text-align: center; color: #3a727f;">Detalle de reporte de Administradores</h3></tr>
                        <tr><p style="text-align: center; color: #3a727f;"> Digite el rango de fecha en el que desea realizar el reporte</p></tr>
                        <tr >
                            <td colspan="3"><h4 style="color:#3a727f">Desde:</h4></td>
                            <td colspan="3"><h4  style="color:#3a727f">Hasta:</h4></td>
                        </tr>
                        <tr>
                            <td colspan="3"><input class="nuevafecha" type="date" name="fechaini" size="25"></td>
                            <td colspan="3"><input class="nuevafecha" type="date" name="fechafin" size="25"></td>
                        </tr>
                    </table>
                    <input type="submit" class=" col-4 generarreportelista" value="Generar Reporte"/>
                </form>


            </div>

            <div class="col-6 cuadrore" id="pendientes">
                <form action="Reportes?accion=generar_reportes" method="Post">
                    <table class="col-12">
                        <tr> <h3 style="text-align: center; color: #3a727f;">Detalle de reporte de Administradores</h3></tr>
                        <tr><p style="text-align: center; color: #3a727f;"> Digite el rango de fecha en el que desea realizar el reporte</p></tr>
                        <tr >
                            <td colspan="3"><h4 style="color:#3a727f">Desde:</h4></td>
                            <td colspan="3"><h4  style="color:#3a727f">Hasta:</h4></td>
                        </tr>
                        <tr>
                            <td colspan="3"><input class="nuevafecha" type="date" name="fechaini" size="25"></td>
                            <td colspan="3"><input class="nuevafecha" type="date" name="fechafin" size="25"></td>
                        </tr>
                    </table>
                    <input type="submit" class=" col-4 generarreportelista" value="Generar Reporte"/>
                </form>

            </div>
        </div>
    </div>
</div>

<script>
    window.onload = function () {
        var dtp = new DateTimePicker('.datepicker', {timePicker: true, format: 'd/m/y:i'});
    };
</script>
<%@include file="/_down.jsp" %>