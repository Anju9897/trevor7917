
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
    $(".cuadro").hide();
    
    $('#sr p').on("click",function(){
        $(".cuadro").show();
        $("#sinResolver").fadeIn();
        $("#vencidos").hide();
        $("#Vence_hoy").hide();
        $("#abiertos").hide();
        $("#pendientes").hide();
        $("#Espera").hide();
    });

    // mostrar tabla 2
    $("#ven p").on("click",function(){
        
        $(".cuadro").show();
        $("#vencidos").fadeIn();
        $("#sinResolver").hide();
        $("#Vence_hoy").hide();
        $("#abiertos").hide();
        $("#pendientes").hide();
        $("#Espera").hide();
    });

    // mostrar tabla 3
    $("#venhoy p").on("click",function(){
        $(".cuadro").show();
        $("#Vence_hoy").fadeIn();
        $("#sinResolver").hide();
        $("#vencidos").hide();
        $("#abiertos").hide();
        $("#pendientes").hide();
        $("#Espera").hide();
    });

    // mostrar tabla 4
    $("#open p").on("click",function(){
        $(".cuadro").show();
        $("#abiertos").fadeIn();
        $("#sinResolver").hide();
        $("#vencidos").hide();
        $("#Vence_hoy").hide();
        $("#pendientes").hide();
        $("#Espera").hide();
    });

    // mostrar tabla 5
    $("#wait p").on("click",function(){
        $(".cuadro").show();
        $("#Espera").fadeIn();
        $("#sinResolver").hide();
        $("#vencidos").hide();
        $("#abiertos").hide();
        $("#pendientes").hide();
        $("#Vence_hoy").hide();
    });

    // mostrar tabla 6
    $("#pen p").on("click",function(){
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
