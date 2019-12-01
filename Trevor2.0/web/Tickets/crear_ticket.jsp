<%@include file="/_menu.jsp" %>

<div class="col-12 busqueda">    
    <h1>Asignar Ticket</h1>
</div>

<form action="Tickets?accion=asignar_ticket" method="Post">
    <div class="col-1"></div>
    <div class="col-6 info hide" id="info">
        <div class="col-2">
            <div class="inicial round"><p>${inicial}</p></div>
        </div>
        
        <div class="col-10 info2">
            <table class="col-12">
                <tr>
                    <td><input type="text" name="reporta" title="Reportador" class="font totick nomu" readonly="readonly" value="${mensaje.u_reporta}"/></td>
               
                </tr>
                
                <tr>
                    <td> <hr> <br></td>
               
                </tr>
                
                <tr>
                    <td class="font letr"><b> Asunto:</b></td>
                    <td class="font letr"><b> Tipo de Problema:</b> </td>
                </tr>
                <tr>
                    <td><input type="text" name="asunto" class="totick nomu2" value="${mensaje.asunto}"></td>
                    <td><input type="text" name="tipo" class="totick numu2" value="${mensaje.tipo}"></td>
                </tr>
                <tr>
                    <td> <hr> <br></td>
               
                </tr>
                <tr>
                    <td class=" letr font"> <b>Descripcion:</b></td>
                </tr>
                <tr>
                    <td colspan="4"><textarea cols="25" rows="10" name="descripcion" class="totick" readonly="readonly" >${mensaje.descripcion}</textarea></td>
                </tr>
            </table>
        </div>
        </div>
        <div class="col-a"></div>
        <div class="col-3 info">
            <div class="col-1 letr"><label for="estado"/><b >Estado: </b> </div>
            <div class="col-6 cuadrore">
                <select id="statu" name="estado">
                    <c:forEach items="${estado}" begin="1" end="3" var="e">
                        <option value="${e.idestado}">${e.estado}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-1 letr"><label for="prioridad"/> <b>Prioridad: </b></div>
            <div class="col-6 cuadrore">
                <select  name="prioridad">
                    <c:forEach items="${prioridad}" var="p">
                        <option value="${p}">${p}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-4 letr"><label for="encargado"> <b> Encargado:</b></div>
            <div class="col-6 "><input type="text" name="encargado" class="totick nomu" readonly="readonly" value="${Usuario}"> </div>
            <div class="col-12 letr"><label for="fechafin"><b>Fecha Esperada a finalizar:</b></div>
            <div class="alineado">
                <input type="date"  size="25" class="nuevafecha " name="fechafin">
            </div>
            
            <div class="col-12 alineado2">
                <textarea cols="36" rows="7" placeholder="Escriba una observacion" id="obv" name="observacion"></textarea>
            </div>
            
            <div class="col-12"><input type="submit" value="Aceptar" id="Actualizar" ></div>
        </div>
        <div class="col-12 butones">
            
            <div class="stiki"> <a class="icon icon-cross"  id="bck"  onclick="javascript: window.history.back()" title="Cancelar" > </a> </div>

        </div>
</form>

<%@include file="/_down.jsp" %>
