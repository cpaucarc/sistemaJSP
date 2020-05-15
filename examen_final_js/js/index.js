// Variables

var add = document.getElementById('add');
var edit = document.getElementById('edit');
var delet = document.getElementById('delete');

var dni = document.getElementById('dni');
var nombre = document.getElementById('nombre');
var apellido = document.getElementById('apellido');
var genero = document.getElementById('genero');

var curso = document.getElementById('curso');
var costo = document.getElementById('costo');

var tabla = document.getElementById('body');

var precios = [120, 130, 100, 150, 150]

// Eventos



add.addEventListener('click', () => {
    nuevaFila()
})

curso.addEventListener('change', () => {
    costo.value = obtenerPrecio();
})


function nuevaFila() {
    fila = document.createElement('tr')

    td1 = document.createElement('td')
    td1.appendChild(document.createTextNode(dni.value))

    td2 = document.createElement('td')
    td2.appendChild(document.createTextNode(nombre.value))

    td3 = document.createElement('td')
    td3.appendChild(document.createTextNode(apellido.value))

    td4 = document.createElement('td')
    td4.appendChild(document.createTextNode(genero.options[genero.selectedIndex].text))

    td5 = document.createElement('td')
    td5.appendChild(document.createTextNode(curso.options[curso.selectedIndex].text))

    td6 = document.createElement('td')
    td6.appendChild(document.createTextNode(costo.value))

    fila.appendChild(td1)
    fila.appendChild(td2)
    fila.appendChild(td3)
    fila.appendChild(td4)
    fila.appendChild(td5)
    fila.appendChild(td6)
    tabla.appendChild(fila)
}

function obtenerPrecio() {
    valor = curso.options[curso.selectedIndex].value
    return precios[valor]
}