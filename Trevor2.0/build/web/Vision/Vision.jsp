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
                    <input class="nuevafecha" type="date" name="txtFecha" size="25">
                    <br>
                    <br>
                    <h4>Mes: </h4>

                    <select name="mesreporte">
                        <c:forEach begin="0" end="${mes.size()-1}" varStatus="m">
                            <option value="${mes.get(m.index)}">${mes.get(m.index)}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <br>

                    <h4>Año: </h4>

                    <select name="añoreporte">
                        <c:forEach items="${ao}" var="a">
                            <option value="${a}">${a}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <input type="submit" class=" col-4 generarreportelista" value="Generar Reporte"/>
                </form> 

            </div>

            <div class="col-6 cuadrore" id="vencidos">
                <form action="Vision?accion=generar_reportes" method="Post">
                    <h3 style="text-align: center">Detalle de reporte por tipo </h3>
                    <div><label for="tipo"/>Tipo </div>
                    <div>
                        <select name="tipo">
                            <c:forEach items="${tipo}" var="tp">
                                <option value="${tp}">${tp}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <h4>Dia : </h4>
                    <input class="nuevafecha" type="date" name="txtFecha" size="25">
                    <br>
                    <br>
                    <h4>Mes: </h4>

                    <select name="mesreporte">
                        <c:forEach begin="0" end="${mes.size()-1}" varStatus="m">
                            <option value="${mes.get(m.index)}">${mes.get(m.index)}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <br>

                    <h4>Año: </h4>

                    <select name="añoreporte">
                        <c:forEach items="${ao}" var="a">
                            <option value="${a}">${a}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <input type="submit" class=" col-4 generarreportelista" value="Generar Reporte"/>
                </form>

            </div>

            <div class="col-6 cuadrore" id="Vence_hoy">
                <form action="Vision?accion=generar_reportes" method="Post">
                    <h3 style="text-align: center">Detalle de reporte por Historial </h3>
                

                    <h4>Dia : </h4>
                    <input class="nuevafecha" type="date" name="txtFecha" size="25">
                    <br>
                    <br>
                    <h4>Mes: </h4>

                    <select name="mesreporte">
                        <c:forEach begin="0" end="${mes.size()-1}" varStatus="m">
                            <option value="${mes.get(m.index)}">${mes.get(m.index)}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <br>

                    <h4>Año: </h4>

                    <select name="añoreporte">
                        <c:forEach items="${ao}" var="a">
                            <option value="${a}">${a}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <input type="submit" class=" col-4 generarreportelista" value="Generar Reporte"/>
                </form>

            </div>

            <div class="col-6 cuadrore" id="abiertos">
                <form action="Vision?accion=generar_reportes" method="Post">
                    <h3 style="text-align: center">Detalle de reporte por prioridad </h3>
                    <div class=""><label for="Prioridad"/>Prioridad: </div>
                    <select name="Prioridad">
                        <c:forEach items="${Prioridad}" var="pr">
                            <option value="${pr}">${pr}</option>
                        </c:forEach>
                    </select>
                    <h4>Dia : </h4>
                    <input class="nuevafecha" type="date" name="txtFecha" size="25">
                    <br>
                    <br>
                    <h4>Mes: </h4>

                    <select name="mesreporte">
                        <c:forEach begin="0" end="${mes.size()-1}" varStatus="m">
                            <option value="${mes.get(m.index)}">${mes.get(m.index)}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <br>

                    <h4>Año: </h4>

                    <select name="añoreporte">
                        <c:forEach items="${ao}" var="a">
                            <option value="${a}">${a}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <input type="submit" class=" col-4 generarreportelista" value="Generar Reporte"/>
                </form>


            </div>

            <div class="col-6 cuadrore" id="pendientes">
                <form action="Vision?accion=generar_reportes" method="Post">
                    <h3 style="text-align: center">Detalle de reporte por Administradores </h3>
                    <h4>Dia : </h4>
                    <input class="nuevafecha" type="date" name="txtFecha" size="25">
                    <br>
                    <br>
                    <h4>Mes: </h4>

                    <select name="mesreporte">
                        <c:forEach begin="0" end="${mes.size()-1}" varStatus="m">
                            <option value="${mes.get(m.index)}">${mes.get(m.index)}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <br>

                    <h4>Año: </h4>

                    <select name="añoreporte">
                        <c:forEach items="${ao}" var="a">
                            <option value="${a}">${a}</option>
                        </c:forEach>
                    </select>
                    <br>
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