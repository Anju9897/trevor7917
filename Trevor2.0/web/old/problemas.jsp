
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trevor</title>
        <link rel="stylesheet" href="CSS/icon.css">
        <link rel="stylesheet" href="CSS/nav.css">
        <link rel="stylesheet" href="CSS/cols.css">
        <link rel="stylesheet" href="CSS/lista.css">
        <link rel="stylesheet" href="CSS/icon2.css">


    </head>
    <body>
        <div class="contenedor row">
            <%@include file="Menu_agente.jsp"%>
            <div class="col-r2">
                <%@include file="barra_lateral.jsp"%>

                <div class="princ col-6  " >
                    <div class="list">
                        <h2 style="text-align: center">Lista de Administradores</h2>
                        <hr>
                        <br>
                        <p style="margin-left: 12px">Marina Claribel Guardado Monge</p>
                        <p style="margin-left: 12px">Xenia Mariel Duran Castillo<p>
                        <p style="margin-left: 12px">Juan Jose Ramos Garcia</p>
                        <p style="margin-left: 12px">Georgina Larissa Granados Garcia</p>
                        <p style="margin-left: 12px">Marina Claribel Guardado Monge</p>
                        <p style="margin-left: 12px">Xenia Mariel Duran Castillo<p>
                        <p style="margin-left: 12px">Juan Jose Ramos Garcia</p>
                        <p style="margin-left: 12px">Georgina Larissa Granados Garcia</p>
                        <br>
                        <hr >
                        <br>
                        <a title="Eliminar"><span class="erease icon icon-bin"></span></a>
                        <input type="text" placeholder="Nombre  Completo" name="Nombre a eliminar " style="margin-left: 10px"><br>
                        <br>

                        <div class="" id="mc">
                            <a title="Agregar"><span class="add icon icon-plus ps " id="mc" style=" "></span></a>
                            
                        </div>
                    </div>

                </div>
                
                <div class="info  hide col-4  res"    id="info">
                    <form action="" method="Post" >
                        <div class="col-12 ">
                            <h2 style="text-align: center">Resgistrar a un nuevo administrador</h2>
                            <input type="text" placeholder="Nombre" required id="name">
                            <input type="text" placeholder="Apellido" required id="lstName">
                        </div>
                        
                        <input type="text" placeholder="Nombre de Usuario" required id="nwusr"><br>
                        <input type="email" placeholder="Correo Electronico" required id="nwmail"><br>
                        <input type="password" placeholder="Contraseña" required id="nwpass"><br>
                        <input type="password" placeholder="Confirmar Contraseña" required id="nwpass2"><br>
                        <input type="submit" value="Registrar" id="regi">
                       
                    </form>
                </div>



            </div>
        </div>



        <script src="JS/jquery-3.4.1.js"></script>
        <script src="JS/funciones.js"></script>
    </body>
</html>
