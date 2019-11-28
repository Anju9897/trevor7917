<%@include file="/_menu.jsp" %>
<div class="inivision">
    <h1>Reportes Trevor-7917</h1>
    <img src="imagen/logo.png" style="width: 50px; height: 50px;" >
</div>
<div class="controladoresA">

    <div class="col-2" id="">Sin Resolver<p>1</p></div>
    <div class="col-2" id="">Vencidos<p>5</p></div>
    <div class="col-2" id="">Vence Hoy<p>3</p></div>
    <div class="col-2" id="">Abiertos<p>5</p></div>
    <div class="col-2" id="">En Espera<p>7</p></div>
    <div class="col-2" id="">Realizar<p>Reporte</p></div>  
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
                <form action="Vision?accion=generar_reportes" method="Post">
                    <h3 style="text-align: center">Detalle de reporte por estado </h3>
                    <div><label for="estado"/>Estado: </div>
                    <div>
                        <select name="estado">
                            <c:forEach items="${estado}" var="es">
                                <option value="${es.idestado}">${es.estado}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <h4>Dia : </h4>
                    <input class="datepicker" type="text" name="txtFecha" size="25">
                    <br>
                    <br>
                    <h4>Mes: </h4>

                    <select name="mesreporte">
                        <option value="1">Enero</option>
                        <option value="2">Febrero</option>
                        <option value="3">Marzo</option>
                        <option value="4">Abrir</option>
                        <option value="5">Mayo</option>
                        <option value="6">Junio</option>
                        <option value="7">Julio</option>
                        <option value="8">Agosto</option>
                        <option value="9">Septiembre</option>
                        <option value="10">Octubre</option>
                        <option value="11">Noviembre</option>
                        <option value="12">Diciembre</option>

                    </select>
                    <br>
                    <br>

                    <h4>Año: </h4>

                    <select name="añoreporte">
                        <option value="1">2019</option>
                        <option value="2">2018</option>
                        <option value="3">2017</option>
                        <option value="4">2016</option>
                        <option value="5">2015</option>
                        <option value="6">2014</option>
                        <option value="7">2013</option>
                        <option value="">2012</option>

                    </select>
                    <br>



                </form> 

            </div>

            <div class="col-6 cuadrore" id="vencidos">
                <form action="Vision?accion=generar_reportes" method="Post">
                    <h3 style="text-align: center">Detalle de reporte por tipo </h3>
                    <h4>Dia : </h4>

                    <input class="datepicker" type="text" name="txtFecha" size="25">
                    <br>
                    <br>
                    <h4>Mes: </h4>

                    <select>
                        <option value="1">Enero</option>
                        <option value="2">Febrero</option>
                        <option value="3">Marzo</option>
                        <option value="4">Abrir</option>
                        <option value="5">Mayo</option>
                        <option value="6">Junio</option>
                        <option value="7">Julio</option>
                        <option value="8">Agosto</option>
                        <option value="9">Septiembre</option>
                        <option value="10">Octubre</option>
                        <option value="11">Noviembre</option>
                        <option value="12">Diciembre</option>

                    </select>
                    <br>
                    <br>

                    <h4>Año: </h4>

                    <select>
                        <option value="1">2019</option>
                        <option value="2">2018</option>
                        <option value="3">2017</option>
                        <option value="4">2016</option>
                        <option value="5">2015</option>
                        <option value="6">2014</option>
                        <option value="7">2013</option>
                        <option value="">2012</option>

                    </select>
                    <br>
                </form>

            </div>

            <div class="col-6 cuadrore" id="Vence_hoy">
                <form action="Vision?accion=generar_reportes" method="Post">
                    <h3 style="text-align: center">Detalle de reporte por Historial </h3>
                    <h4>Dia : </h4>

                    <input class="datepicker" type="text" name="txtFecha" size="25">
                    <br>
                    <br>
                    <h4>Mes: </h4>

                    <select>
                        <option value="1">Enero</option>
                        <option value="2">Febrero</option>
                        <option value="3">Marzo</option>
                        <option value="4">Abrir</option>
                        <option value="5">Mayo</option>
                        <option value="6">Junio</option>
                        <option value="7">Julio</option>
                        <option value="8">Agosto</option>
                        <option value="9">Septiembre</option>
                        <option value="10">Octubre</option>
                        <option value="11">Noviembre</option>
                        <option value="12">Diciembre</option>

                    </select>
                    <br>
                    <br>

                    <h4>Año: </h4>

                    <select>
                        <option value="1">2019</option>
                        <option value="2">2018</option>
                        <option value="3">2017</option>
                        <option value="4">2016</option>
                        <option value="5">2015</option>
                        <option value="6">2014</option>
                        <option value="7">2013</option>
                        <option value="">2012</option>

                    </select>
                    <br>
                </form>

            </div>

            <div class="col-6 cuadrore" id="abiertos">
                <form action="Vision?accion=generar_reportes" method="Post">
                    <h3 style="text-align: center">Detalle de reporte por prioridad </h3>
                    <div class=""><label for="prioridad"/>Prioridades:</div>
                    <select name="Prioridad">
                        <c:forEach items="${Prioridad}" var="pr">
                            <option value="${pr}">${pr}</option>
                        </c:forEach>
                    </select>
                    <h4>Dia : </h4>

                    <input class="datepicker" type="text" name="txtFecha" size="25">
                    <br>
                    <br>
                    <h4>Mes: </h4>

                    <select>
                        <option value="1">Enero</option>
                        <option value="2">Febrero</option>
                        <option value="3">Marzo</option>
                        <option value="4">Abrir</option>
                        <option value="5">Mayo</option>
                        <option value="6">Junio</option>
                        <option value="7">Julio</option>
                        <option value="8">Agosto</option>
                        <option value="9">Septiembre</option>
                        <option value="10">Octubre</option>
                        <option value="11">Noviembre</option>
                        <option value="12">Diciembre</option>

                    </select>
                    <br>
                    <br>

                    <h4>Año: </h4>

                    <select>
                        <option value="1">2019</option>
                        <option value="2">2018</option>
                        <option value="3">2017</option>
                        <option value="4">2016</option>
                        <option value="5">2015</option>
                        <option value="6">2014</option>
                        <option value="7">2013</option>
                        <option value="">2012</option>

                    </select>
                    <br>
                </form>


            </div>

            <div class="col-6 cuadrore" id="pendientes">
                <form action="Vision?accion=generar_reportes" method="Post">
                    <h3 style="text-align: center">Detalle de reporte por Administradores </h3>
                    <h4>Dia : </h4>

                    <input class="datepicker" type="text" name="txtFecha" size="25">
                    <br>
                    <br>
                    <h4>Mes: </h4>

                    <select>
                        <option value="1">Enero</option>
                        <option value="2">Febrero</option>
                        <option value="3">Marzo</option>
                        <option value="4">Abrir</option>
                        <option value="5">Mayo</option>
                        <option value="6">Junio</option>
                        <option value="7">Julio</option>
                        <option value="8">Agosto</option>
                        <option value="9">Septiembre</option>
                        <option value="10">Octubre</option>
                        <option value="11">Noviembre</option>
                        <option value="12">Diciembre</option>

                    </select>
                    <br>
                    <br>

                    <h4>Año: </h4>

                    <select>
                        <option value="1">2019</option>
                        <option value="2">2018</option>
                        <option value="3">2017</option>
                        <option value="4">2016</option>
                        <option value="5">2015</option>
                        <option value="6">2014</option>
                        <option value="7">2013</option>
                        <option value="">2012</option>

                    </select>
                    <br>
                </form>

            </div>
            <button class=" col-4 generarreportelista">Generar Reporte</button>
        </div>

    </div>


</div>

<script>
    window.onload = function () {
        var dtp = new DateTimePicker('.datepicker', {timePicker: true, format: 'd/m/y:i'});
    };
</script>
<script src="JS/funciones.js"></script>
<%@include file="/_down.jsp" %>