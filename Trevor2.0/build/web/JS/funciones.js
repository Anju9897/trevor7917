
$(document).ready(function(){

    // funciones para ocultar o mostrar cuadros
    $("#sesion").on("click",function(){
        $('#sesionDiv').fadeIn();
        $('#Butons').hide();
    });

    $("#registro").on("click",function(){
        $('#registroDiv').fadeIn();
        $('#Butons').hide();
    });

    $(".back").on("click",function(){
        $('#sesionDiv').hide();
        $('#registroDiv').hide();
        $('#Butons').fadeIn();
    });

    // mostrar tabla 1
    $("#sr").on("click",function(){
        $("#sinResolver").fadeIn();
        $("#vencidos").hide();
        $("#Vence_hoy").hide();
        $("#abiertos").hide();
        $("#pendientes").hide();
        $("#Espera").hide();
    });

    // mostrar tabla 2
    $("#ven").on("click",function(){
        $("#vencidos").fadeIn();
        $("#sinResolver").hide();
        $("#Vence_hoy").hide();
        $("#abiertos").hide();
        $("#pendientes").hide();
        $("#Espera").hide();
    });

    // mostrar tabla 3
    $("#venhoy").on("click",function(){
        $("#Vence_hoy").fadeIn();
        $("#sinResolver").hide();
        $("#vencidos").hide();
        $("#abiertos").hide();
        $("#pendientes").hide();
        $("#Espera").hide();
    });

    // mostrar tabla 4
    $("#open").on("click",function(){
        $("#abiertos").fadeIn();
        $("#sinResolver").hide();
        $("#vencidos").hide();
        $("#Vence_hoy").hide();
        $("#pendientes").hide();
        $("#Espera").hide();
    });

    // mostrar tabla 5
    $("#wait").on("click",function(){
        $("#Espera").fadeIn();
        $("#sinResolver").hide();
        $("#vencidos").hide();
        $("#abiertos").hide();
        $("#pendientes").hide();
        $("#Vence_hoy").hide();
    });

    // mostrar tabla 6
    $("#pen").on("click",function(){
        $("#pendientes").fadeIn();
        $("#sinResolver").hide();
        $("#vencidos").hide();
        $("#abiertos").hide();
        $("#Vence_hoy").hide();
        $("#Espera").hide();
    });

    $("#mc").on("click",function(){
        $("#info").fadeIn();
        $("#principal").hide();
    });

    $("#bck").on("click",function(){
        $("#principal").fadeIn();
        $("#info").hide();
    });
    $("#redact").on("click",function(){
        $("#soli").fadeIn();
        $("#principal").hide();
        $("#btnredactar").hide();
    });
    $("#null").on("click",function(){
        $("#soli").hide();
        $("#principal").fadeIn();
        $("#btnredactar").fadeIn();
    });
});
