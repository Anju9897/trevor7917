<<<<<<< HEAD
<%@include file="../_menu.jsp" %>
<br>
<br>
<div class="iniciovision">
    <h1>Reporte Actual</h1>
    <img src="imagen/logo.png" style="width: 50px; height: 50px;">
</div>
<br>
<div class="col-12 controladoresA">
    <div class="col-2" id="sr">Sin Resolver<p>1</p></div>
    
    <div class="col-2" id="venhoy">Vence Hoy<p>3</p></div>
    <div class="col-2" id="open">Abiertos<p>5</p></div>
    <div class="col-2" id="wait">En Espera<p>7</p></div>
    <div class="col-2" id="pen">Generar Reportes<p></p></div>
    
</div>

<div>
    <br>
    <h2 class="h2v">Reportes de Trevor-9747</h2>
    <button class="segundovision">Tipo</button>
    <button class="segundovision">Estado</button>
    <button class="segundovision">Historial</button>
    <button class="segundovision">Prioridad</button>
    <button class="segundovision">administrador</button>
    
    
=======
<%@include file="_menu.jsp" %>

<%@include file="barra_lateral.jsp" %>
<div class="col-12 controladoresA">
    <div class="col-2" id="sr">Sin Resolver<p>1</p></div>
    <div class="col-2" id="ven">Vencidos<p>5</p></div>
    <div class="col-2" id="venhoy">Vence Hoy<p>3</p></div>
    <div class="col-2" id="open">Abiertos<p>5</p></div>
    <div class="col-2" id="wait">En Espera<p>7</p></div>
    <div class="col-2" id="pen">Pendientes<p>1</p></div>
</div>
<div class="row grafs">
</div>
<!-- espacio para los graficos -->
<div class="row graficos">
    <div id="sinResolver" class="hide">
        <table id="datos" border="1" class="hide">
            <tr><th>Clave</th><th>Valor</th></tr>
            <tr><td>5</td><td>121</td></tr>
            <tr><td>13</td><td>150</td></tr>
            <tr><td>20</td><td>144</td></tr>
            <tr><td>27</td><td>97</td></tr>
            <tr><td>36</td><td>108</td></tr>
        </table>
        <canvas id="lienzo" width="500" height="250" class="col-6">
            Su navegador no permite utilizar canvas.
        </canvas>

        <div class="informacion col-6">
            <div>
                <form>
                    <p> Monitoreo </p> <br>
                    <input type="radio">Dia<br>
                    <input type="radio">Mes<br>
                    <input type="radio">Año<br><br>
                    <input type="number"> al <input type="number"> dias
                </form>
            </div>
        </div>
    </div>
    <div id="vencidos" class="hide">
        <table id="tabla2" border="1" class="hide">
            <tr><th>Clave</th><th>Valor</th></tr>
            <tr><td>10</td><td>110</td></tr>
            <tr><td>20</td><td>60</td></tr>
            <tr><td>30</td><td>120</td></tr>
            <tr><td>40</td><td>90</td></tr>
            <tr><td>50</td><td>100</td></tr>
        </table>
        <canvas id="tb2" width="500" height="300" class="col-6">
            Su navegador no permite utilizar canvas.
        </canvas>
        <div class="informacion col-6">
            <div>
                <form>
                    <p> Monitoreo </p> <br>
                    <input type="radio">Dia<br>
                    <input type="radio">Mes<br>
                    <input type="radio">Año<br><br>
                    <input type="number"> al <input type="number"> dias
                </form>
            </div>
        </div>

    </div>
    <div id="Vence_hoy" class="hide">
        <table id="tabla3" border="1" class="hide">
            <tr><th>Clave</th><th>Valor</th></tr>
            <tr><td>15</td><td>10</td></tr>
            <tr><td>30</td><td>70</td></tr>
            <tr><td>45</td><td>50</td></tr>
            <tr><td>60</td><td>60</td></tr>
            <tr><td>75</td><td>40</td></tr>
        </table>
        <canvas id="tb3" width="500" height="300" class="col-6">
            Su navegador no permite utilizar canvas.
        </canvas>
        <div class="informacion col-6">
            <div>
                <form>
                    <p> Monitoreo </p> <br>
                    <input type="radio">Dia<br>
                    <input type="radio">Mes<br>
                    <input type="radio">Año<br><br>
                    <input type="number"> al <input type="number"> dias
                </form>
            </div>
        </div>

    </div>
    <div id="abiertos" class="hide">
        <table id="tabla4" border="1" class="hide">
            <tr><th>Clave</th><th>Valor</th></tr>
            <tr><td>10</td><td>145</td></tr>
            <tr><td>20</td><td>80</td></tr>
            <tr><td>30</td><td>120</td></tr>
            <tr><td>40</td><td>90</td></tr>
            <tr><td>50</td><td>80</td></tr>
            <tr><td>70</td><td>0</td></tr>
            <tr><td>90</td><td>45</td></tr>
        </table>
        <canvas id="tb4" width="500" height="300" class="col-6">
            Su navegador no permite utilizar canvas.
        </canvas>

        <div class="informacion col-6">
            <div>
                <form>
                    <p> Monitoreo </p> <br>
                    <input type="radio">Dia<br>
                    <input type="radio">Mes<br>
                    <input type="radio">Año<br><br>
                    <input type="number"> al <input type="number"> dias
                </form>
            </div>
        </div>
    </div>
    <div id="Espera" class="hide">
        <table id="tabla5" border="1" class="hide">
            <tr><th>Clave</th><th>Valor</th></tr>
            <tr><td>20</td><td>12</td></tr>
            <tr><td>40</td><td>24</td></tr>
            <tr><td>60</td><td>30</td></tr>
            <tr><td>80</td><td>24</td></tr>
            <tr><td>100</td><td>40</td></tr>
            <tr><td>105</td><td>120</td></tr>
            <tr><td>70</td><td>150</td></tr>

        </table>
        <canvas id="tb5" width="500" height="300" class="col-6">
            Su navegador no permite utilizar canvas.
        </canvas>
        <div class="informacion col-6">
            <div>
                <form>
                    <p> Monitoreo </p> <br>
                    <input type="radio">Dia<br>
                    <input type="radio">Mes<br>
                    <input type="radio">Año<br><br>
                    <input type="number"> al <input type="number"> dias
                </form>
            </div>
        </div>

    </div>
    <div id="pendientes" class="hide">
        <table id="tabla6" border="1" class="hide">
            <tr><th>Clave</th><th>Valor</th></tr>
            <tr><td>10</td><td>100</td></tr>
            <tr><td>20</td><td>50</td></tr>
            <tr><td>50</td><td>50</td></tr>
            <tr><td>80</td><td>75</td></tr>
            <tr><td>130</td><td>110</td></tr>
            <tr><td>150</td><td>90</td></tr>
            <tr><td>200</td><td>60</td></tr>
        </table>
        <canvas id="tb6" width="500" height="300" class="col-6">
            Su navegador no permite utilizar canvas.
        </canvas>
        <div class="informacion col-6">
            <div>
                <form>
                    <p> Monitoreo </p> <br>
                    <input type="radio">Dia<br>
                    <input type="radio">Mes<br>
                    <input type="radio">Año<br><br>
                    <input type="number"> al <input type="number"> dias
                </form>
            </div>
        </div>

    </div>
>>>>>>> 7e115a1027bf10552562cde371c28236d4129cc3
</div>

<%@include file="/_down.jsp" %>