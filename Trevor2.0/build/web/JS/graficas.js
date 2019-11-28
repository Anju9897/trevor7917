function retornarLienzo(x) {
    var canvas = document.getElementById(x);
    if (canvas.getContext) {
        var lienzo = canvas.getContext("2d");
        return lienzo;
    } else
        return false;
}

function dibujar1() {

    var lienzo = retornarLienzo("lienzo");
    if (lienzo) {

        // Defino límites en píxeles
        var minx = 55;
        var maxx = 500;
        var miny = 20;
        var maxy = 200;

        // Dimensiones para el gráfico
        var ancho = maxx - minx;
        var alto = maxy - miny;

        // Obtener valores mínimo y máximo
        var minv = "nulo";
        var maxv = 0;

        var valor = 0;

        // Recorrer la tabla para obtener los valores mínimo y máximo
        var tabla = document.getElementById("datos");
        for (var i = 1, fila; fila = tabla.rows[i]; i++) {
            valor = parseFloat(fila.cells[1].innerHTML);
            if (minv == "nulo" || minv > valor) {
                minv = valor;
            }
            if (maxv < valor) {
                maxv = valor;
            }
        }

        // Escala
        /*
            Se utiliza para adaptar los valores de la tabla
            en las dimensiones del lienzo 
        */
        var escala = maxv - minv;

        // Cantidad de filas
        var cant = i;

        // Dibujar abcisas
        lienzo.beginPath();
        lienzo.font = '16px Calibri';
        lienzo.lineWidth = 1;
        lienzo.fillStyle = 'white';
        x = minx;
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            lienzo.fillText(row.cells[0].innerHTML, x, maxy + 40);
            x += ancho / (cant - 2); // avanzo las abcisas
        }
        lienzo.stroke();

        // Dibujar ordenadas
        lienzo.beginPath();
        lienzo.font = '16px Calibri';
        lienzo.lineWidth = 1;
        lienzo.fillStyle = 'white';
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto   
            lienzo.fillText(row.cells[1].innerHTML, minx - 20, y);
        }
        lienzo.stroke();
        lienzo.beginPath();
        lienzo.lineWidth = 1;
        lienzo.setLineDash([5, 2]);
        lienzo.strokeStyle = "#fff";
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto   
            lienzo.moveTo(minx, y);
            lienzo.lineTo(maxx, y);
        }
        lienzo.stroke();

        // Dibujar recuadro
        lienzo.beginPath();
        lienzo.strokeStyle = "#3a727f";
        lienzo.setLineDash([0, 0]);
        lienzo.lineWidth = 1;
        lienzo.strokeRect(minx, miny - 20, maxx - minx, maxy - miny + 40);

        // Dibujar líneas
        lienzo.strokeStyle = "#fff";

        // Calculo el primer valor
        valor = parseFloat(tabla.rows[1].cells[1].innerHTML);
        var x = minx;
        var y = maxy - (valor - minv) * (alto / escala);
        // Dibujo el primer valor (punto)
        lienzo.fillRect(x - 2, y - 2, 4, 4);
        lienzo.moveTo(x, y);

        // Desde el segundo hasta el último valor
        for (var i = 2, row; row = tabla.rows[i]; i++) {
            x += ancho / (cant - 2); // avanzo las abcisas
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto
            lienzo.lineTo(x, y); // dibujo una línea entre ambos puntos
            lienzo.fillRect(x - 2, y - 2, 4, 4); // dibujo el nuevo punto
        }
        lienzo.stroke();

    }
}

dibujar1();

function retornarLienzo(x) {
    var canvas = document.getElementById(x);
    if (canvas.getContext) {
        var lienzo = canvas.getContext("2d");
        return lienzo;
    } else
        return false;
}

function dibujar2() {

    var lienzo = retornarLienzo("tb2");
    if (lienzo) {

        // Defino límites en píxeles
        var minx = 55;
        var maxx = 500;
        var miny = 20;
        var maxy = 200;

        // Dimensiones para el gráfico
        var ancho = maxx - minx;
        var alto = maxy - miny;

        // Obtener valores mínimo y máximo
        var minv = "nulo";
        var maxv = 0;

        var valor = 0;

        // Recorrer la tabla para obtener los valores mínimo y máximo
        var tabla = document.getElementById("tabla2");
        for (var i = 1, fila; fila = tabla.rows[i]; i++) {
            valor = parseFloat(fila.cells[1].innerHTML);
            if (minv == "nulo" || minv > valor) {
                minv = valor;
            }
            if (maxv < valor) {
                maxv = valor;
            }
        }

        // Escala
        /*
            Se utiliza para adaptar los valores de la tabla
            en las dimensiones del lienzo 
        */
        var escala = maxv - minv;

        // Cantidad de filas
        var cant = i;

        // Dibujar abcisas
        lienzo.beginPath();
        lienzo.font = '12px Calibri';
        lienzo.lineWidth = 1;
        lienzo.fillStyle = 'white';
        x = minx;
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            lienzo.fillText(row.cells[0].innerHTML, x, maxy + 40);
            x += ancho / (cant - 2); // avanzo las abcisas
        }
        lienzo.stroke();

        // Dibujar ordenadas
        lienzo.beginPath();
        lienzo.font = '16px Calibri';
        lienzo.lineWidth = 1;
        lienzo.fillStyle = 'white';
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto   
            lienzo.fillText(row.cells[1].innerHTML, minx - 20, y);
        }
        lienzo.stroke();
        lienzo.beginPath();
        lienzo.lineWidth = 1;
        lienzo.setLineDash([5, 2]);
        lienzo.strokeStyle = "#fff";
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto   
            lienzo.moveTo(minx, y);
            lienzo.lineTo(maxx, y);
        }
        lienzo.stroke();

        // Dibujar recuadro
        lienzo.beginPath();
        lienzo.strokeStyle = "#3a727f";
        lienzo.setLineDash([0, 0]);
        lienzo.lineWidth = 1;
        lienzo.strokeRect(minx, miny - 20, maxx - minx, maxy - miny + 40);

        // Dibujar líneas
        lienzo.strokeStyle = "#fff";

        // Calculo el primer valor
        valor = parseFloat(tabla.rows[1].cells[1].innerHTML);
        var x = minx;
        var y = maxy - (valor - minv) * (alto / escala);
        // Dibujo el primer valor (punto)
        lienzo.fillRect(x - 2, y - 2, 4, 4);
        lienzo.moveTo(x, y);

        // Desde el segundo hasta el último valor
        for (var i = 2, row; row = tabla.rows[i]; i++) {
            x += ancho / (cant - 2); // avanzo las abcisas
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto
            lienzo.lineTo(x, y); // dibujo una línea entre ambos puntos
            lienzo.fillRect(x - 2, y - 2, 4, 4); // dibujo el nuevo punto
        }
        lienzo.stroke();

    }
}

dibujar2();

function retornarLienzo(x) {
    var canvas = document.getElementById(x);
    if (canvas.getContext) {
        var lienzo = canvas.getContext("2d");
        return lienzo;
    } else
        return false;
}

function dibujar3() {

    var lienzo = retornarLienzo("tb3");
    if (lienzo) {

        // Defino límites en píxeles
        var minx = 55;
        var maxx = 500;
        var miny = 20;
        var maxy = 200;

        // Dimensiones para el gráfico
        var ancho = maxx - minx;
        var alto = maxy - miny;

        // Obtener valores mínimo y máximo
        var minv = "nulo";
        var maxv = 0;

        var valor = 0;

        // Recorrer la tabla para obtener los valores mínimo y máximo
        var tabla = document.getElementById("tabla3");
        for (var i = 1, fila; fila = tabla.rows[i]; i++) {
            valor = parseFloat(fila.cells[1].innerHTML);
            if (minv == "nulo" || minv > valor) {
                minv = valor;
            }
            if (maxv < valor) {
                maxv = valor;
            }
        }

        // Escala
        /*
            Se utiliza para adaptar los valores de la tabla
            en las dimensiones del lienzo 
        */
        var escala = maxv - minv;

        // Cantidad de filas
        var cant = i;

        // Dibujar abcisas
        lienzo.beginPath();
        lienzo.font = '16px Calibri';
        lienzo.lineWidth = 1;
        lienzo.fillStyle = 'white';
        x = minx;
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            lienzo.fillText(row.cells[0].innerHTML, x, maxy + 40);
            x += ancho / (cant - 2); // avanzo las abcisas
        }
        lienzo.stroke();

        // Dibujar ordenadas
        lienzo.beginPath();
        lienzo.font = '16px Calibri';
        lienzo.lineWidth = 1;
        lienzo.fillStyle = 'white';
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto   
            lienzo.fillText(row.cells[1].innerHTML, minx - 20, y);
        }
        lienzo.stroke();
        lienzo.beginPath();
        lienzo.lineWidth = 1;
        lienzo.setLineDash([5, 2]);
        lienzo.strokeStyle = "#fff";
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto   
            lienzo.moveTo(minx, y);
            lienzo.lineTo(maxx, y);
        }
        lienzo.stroke();

        // Dibujar recuadro
        lienzo.beginPath();
        lienzo.strokeStyle = "#3a727f";
        lienzo.setLineDash([0, 0]);
        lienzo.lineWidth = 1;
        lienzo.strokeRect(minx, miny - 20, maxx - minx, maxy - miny + 40);

        // Dibujar líneas
        lienzo.strokeStyle = "#fff";

        // Calculo el primer valor
        valor = parseFloat(tabla.rows[1].cells[1].innerHTML);
        var x = minx;
        var y = maxy - (valor - minv) * (alto / escala);
        // Dibujo el primer valor (punto)
        lienzo.fillRect(x - 2, y - 2, 4, 4);
        lienzo.moveTo(x, y);

        // Desde el segundo hasta el último valor
        for (var i = 2, row; row = tabla.rows[i]; i++) {
            x += ancho / (cant - 2); // avanzo las abcisas
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto
            lienzo.lineTo(x, y); // dibujo una línea entre ambos puntos
            lienzo.fillRect(x - 2, y - 2, 4, 4); // dibujo el nuevo punto
        }
        lienzo.stroke();

    }
}

dibujar3();

function retornarLienzo(x) {
    var canvas = document.getElementById(x);
    if (canvas.getContext) {
        var lienzo = canvas.getContext("2d");
        return lienzo;
    } else
        return false;
}

function dibujar4() {

    var lienzo = retornarLienzo("tb4");
    if (lienzo) {

        // Defino límites en píxeles
        var minx = 55;
        var maxx = 500;
        var miny = 20;
        var maxy = 200;

        // Dimensiones para el gráfico
        var ancho = maxx - minx;
        var alto = maxy - miny;

        // Obtener valores mínimo y máximo
        var minv = "nulo";
        var maxv = 0;

        var valor = 0;

        // Recorrer la tabla para obtener los valores mínimo y máximo
        var tabla = document.getElementById("tabla4");
        for (var i = 1, fila; fila = tabla.rows[i]; i++) {
            valor = parseFloat(fila.cells[1].innerHTML);
            if (minv == "nulo" || minv > valor) {
                minv = valor;
            }
            if (maxv < valor) {
                maxv = valor;
            }
        }

        // Escala
        /*
            Se utiliza para adaptar los valores de la tabla
            en las dimensiones del lienzo 
        */
        var escala = maxv - minv;

        // Cantidad de filas
        var cant = i;

        // Dibujar abcisas
        lienzo.beginPath();
        lienzo.font = '16px Calibri';
        lienzo.lineWidth = 1;
        lienzo.fillStyle = 'white';
        x = minx;
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            lienzo.fillText(row.cells[0].innerHTML, x, maxy + 40);
            x += ancho / (cant - 2); // avanzo las abcisas
        }
        lienzo.stroke();

        // Dibujar ordenadas
        lienzo.beginPath();
        lienzo.font = '16px Calibri';
        lienzo.lineWidth = 1;
        lienzo.fillStyle = 'white';
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto   
            lienzo.fillText(row.cells[1].innerHTML, minx - 20, y);
        }
        lienzo.stroke();
        lienzo.beginPath();
        lienzo.lineWidth = 1;
        lienzo.setLineDash([5, 2]);
        lienzo.strokeStyle = "#fff";
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto   
            lienzo.moveTo(minx, y);
            lienzo.lineTo(maxx, y);
        }
        lienzo.stroke();

        // Dibujar recuadro
        lienzo.beginPath();
        lienzo.strokeStyle = "#3a727f";
        lienzo.setLineDash([0, 0]);
        lienzo.lineWidth = 1;
        lienzo.strokeRect(minx, miny - 20, maxx - minx, maxy - miny + 40);

        // Dibujar líneas
        lienzo.strokeStyle = "#fff";

        // Calculo el primer valor
        valor = parseFloat(tabla.rows[1].cells[1].innerHTML);
        var x = minx;
        var y = maxy - (valor - minv) * (alto / escala);
        // Dibujo el primer valor (punto)
        lienzo.fillRect(x - 2, y - 2, 4, 4);
        lienzo.moveTo(x, y);

        // Desde el segundo hasta el último valor
        for (var i = 2, row; row = tabla.rows[i]; i++) {
            x += ancho / (cant - 2); // avanzo las abcisas
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto
            lienzo.lineTo(x, y); // dibujo una línea entre ambos puntos
            lienzo.fillRect(x - 2, y - 2, 4, 4); // dibujo el nuevo punto
        }
        lienzo.stroke();

    }
}

dibujar4();

function retornarLienzo(x) {
    var canvas = document.getElementById(x);
    if (canvas.getContext) {
        var lienzo = canvas.getContext("2d");
        return lienzo;
    } else
        return false;
}

function dibujar5() {

    var lienzo = retornarLienzo("tb5");
    if (lienzo) {

        // Defino límites en píxeles
        var minx = 55;
        var maxx = 500;
        var miny = 20;
        var maxy = 200;

        // Dimensiones para el gráfico
        var ancho = maxx - minx;
        var alto = maxy - miny;

        // Obtener valores mínimo y máximo
        var minv = "nulo";
        var maxv = 0;

        var valor = 0;

        // Recorrer la tabla para obtener los valores mínimo y máximo
        var tabla = document.getElementById("tabla5");
        for (var i = 1, fila; fila = tabla.rows[i]; i++) {
            valor = parseFloat(fila.cells[1].innerHTML);
            if (minv == "nulo" || minv > valor) {
                minv = valor;
            }
            if (maxv < valor) {
                maxv = valor;
            }
        }

        // Escala
        /*
            Se utiliza para adaptar los valores de la tabla
            en las dimensiones del lienzo 
        */
        var escala = maxv - minv;

        // Cantidad de filas
        var cant = i;

        // Dibujar abcisas
        lienzo.beginPath();
        lienzo.font = '16px Calibri';
        lienzo.lineWidth = 1;
        lienzo.fillStyle = 'white';
        x = minx;
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            lienzo.fillText(row.cells[0].innerHTML, x, maxy + 40);
            x += ancho / (cant - 2); // avanzo las abcisas
        }
        lienzo.stroke();

        // Dibujar ordenadas
        lienzo.beginPath();
        lienzo.font = '16px Calibri';
        lienzo.lineWidth = 1;
        lienzo.fillStyle = 'white';
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto   
            lienzo.fillText(row.cells[1].innerHTML, minx - 20, y);
        }
        lienzo.stroke();
        lienzo.beginPath();
        lienzo.lineWidth = 1;
        lienzo.setLineDash([5, 2]);
        lienzo.strokeStyle = "#fff";
        for (var i = 1, row; row = tabla.rows[i]; i++) {
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto   
            lienzo.moveTo(minx, y);
            lienzo.lineTo(maxx, y);
        }
        lienzo.stroke();

        // Dibujar recuadro
        lienzo.beginPath();
        lienzo.strokeStyle = "#3a727f";
        lienzo.setLineDash([0, 0]);
        lienzo.lineWidth = 1;
        lienzo.strokeRect(minx, miny - 20, maxx - minx, maxy - miny + 40);

        // Dibujar líneas
        lienzo.strokeStyle = "#fff";

        // Calculo el primer valor
        valor = parseFloat(tabla.rows[1].cells[1].innerHTML);
        var x = minx;
        var y = maxy - (valor - minv) * (alto / escala);
        // Dibujo el primer valor (punto)
        lienzo.fillRect(x - 2, y - 2, 4, 4);
        lienzo.moveTo(x, y);

        // Desde el segundo hasta el último valor
        for (var i = 2, row; row = tabla.rows[i]; i++) {
            x += ancho / (cant - 2); // avanzo las abcisas
            valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
            y = maxy - (valor - minv) * (alto / escala); // calculo el siguiente punto
            lienzo.lineTo(x, y); // dibujo una línea entre ambos puntos
            lienzo.fillRect(x - 2, y - 2, 4, 4); // dibujo el nuevo punto
        }
        lienzo.stroke();

    }
}

dibujar5();

function dibujar6() {
        
    var lienzo=retornarLienzo("tb6");
    if (lienzo) {
  
      // Defino límites en píxeles
      var minx = 55;
      var maxx = 500;
      var miny = 20;
      var maxy = 200;
  
      // Dimensiones para el gráfico
      var ancho = maxx - minx;
      var alto = maxy - miny;
  
      // Obtener valores mínimo y máximo
      var minv = "nulo";
      var maxv = 0;
  
      var valor = 0;
  
      // Recorrer la tabla para obtener los valores mínimo y máximo
      var tabla = document.getElementById("tabla6");
      for (var i=1, fila; fila=tabla.rows[i]; i++) {
          valor = parseFloat(fila.cells[1].innerHTML);
          if (minv == "nulo" || minv > valor) {
              minv = valor;
          }
          if (maxv < valor) {
              maxv = valor;
          }
      }
  
      // Escala
      /*
          Se utiliza para adaptar los valores de la tabla
          en las dimensiones del lienzo 
      */
      var escala = maxv - minv;
      
      // Cantidad de filas
      var cant = i;
  
      // Dibujar abcisas
      lienzo.beginPath();
      lienzo.font = '16px Calibri';
      lienzo.lineWidth = 1;
      lienzo.fillStyle = 'white';
      x = minx;
      for (var i=1, row; row=tabla.rows[i]; i++) {    
          lienzo.fillText(row.cells[0].innerHTML, x, maxy+40);
          x += ancho/(cant-2); // avanzo las abcisas
      }
      lienzo.stroke();
  
      // Dibujar ordenadas
      lienzo.beginPath();
      lienzo.font = '16px Calibri';
      lienzo.lineWidth = 1;
      lienzo.fillStyle = 'white';
      for (var i=1, row; row=tabla.rows[i]; i++) { 
          valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
          y = maxy - (valor-minv) * (alto/escala); // calculo el siguiente punto   
          lienzo.fillText(row.cells[1].innerHTML, minx-20, y);
      }
      lienzo.stroke();
      lienzo.beginPath();
      lienzo.lineWidth = 1;
      lienzo.setLineDash([5,2]);
      lienzo.strokeStyle="#fff";
      for (var i=1, row; row=tabla.rows[i]; i++) { 
          valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
          y = maxy - (valor-minv) * (alto/escala); // calculo el siguiente punto   
          lienzo.moveTo(minx,y);
          lienzo.lineTo(maxx,y);
      }
      lienzo.stroke();
  
      // Dibujar recuadro
      lienzo.beginPath();
      lienzo.strokeStyle="#3a727f";
      lienzo.setLineDash([0,0]);
      lienzo.lineWidth=1;
      lienzo.strokeRect(minx,miny-20,maxx-minx,maxy-miny+40);
  
      // Dibujar líneas
      lienzo.strokeStyle="#fff";
  
      // Calculo el primer valor
      valor = parseFloat(tabla.rows[1].cells[1].innerHTML);
      var x = minx;
      var y = maxy - (valor-minv) * (alto/escala);
      // Dibujo el primer valor (punto)
      lienzo.fillRect(x-2,y-2,4,4);
      lienzo.moveTo(x,y);
  
      // Desde el segundo hasta el último valor
      for (var i=2, row; row=tabla.rows[i]; i++) {
          x += ancho/(cant-2); // avanzo las abcisas
          valor = parseFloat(row.cells[1].innerHTML); // obtengo el siguiente valor
          y = maxy - (valor-minv) * (alto/escala); // calculo el siguiente punto
          lienzo.lineTo(x,y); // dibujo una línea entre ambos puntos
          lienzo.fillRect(x-2,y-2,4,4); // dibujo el nuevo punto
      }
      lienzo.stroke();
  
    }
  }
  
  dibujar6();