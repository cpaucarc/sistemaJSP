// Variables

var add = document.getElementById('add');
var edit = document.getElementById('edit');
var delet = document.getElementById('delete');
var limpiar = document.getElementById('limpiar');

var dni = document.getElementById('dni');
var nombre = document.getElementById('nombre');
var apellido = document.getElementById('apellido');
var genero = document.getElementById('genero');

var curso = document.getElementById('curso');
var costo = document.getElementById('costo');

var buscar = document.getElementById('buscar');
var tabla = document.getElementById('body');

var precios = [120, 130, 100, 150, 150]
var alumnos = []
var editarPosicion;
// Eventos

window.onload = () => {
    curso.focus()
    limpiarFormulario()
}

add.addEventListener('click', () => {
    if (formularioLleno()) {
        if (editarPosicion < 0) {
            if (!buscarDatoEnArreglo(dni.value, 0)) {
                nuevoAlumno()
                llenarTabla(alumnos)
                limpiarFormulario()
            } else {
                swal('Advertencia', `El numero de DNI ${dni.value} ya esta registrado`, 'warning');
            }
        } else {
            swal('Estamos editando', `Para crear un nuevo registro haga click en Limpiar`, 'warning');
        }
    }
})

edit.addEventListener('click', () => {
    if (formularioLleno()) {
        editarDato(editarPosicion)
        llenarTabla(alumnos)
        limpiarFormulario()
    }
})

delet.addEventListener('click', () => {
    if (editarPosicion !== -1) {
        eliminarDato(editarPosicion)
        llenarTabla(alumnos)
        limpiarFormulario()
    }
})

limpiar.addEventListener('click', () => {
    limpiarFormulario()
    llenarTabla(alumnos)
})


curso.addEventListener('change', () => {
    costo.value = obtenerPrecio();
    dni.focus()
})

buscar.addEventListener('keyup', () => {
    let valorBuscar = buscar.value
    if (valorBuscar.length > 0) {
        buscarRegistrosEnTabla(valorBuscar)
    } else {
        llenarTabla(alumnos)
    }
})

tabla.addEventListener('click', (e) => {
    filaSeleccionada = e.target.parentNode

    columnas = filaSeleccionada.querySelectorAll('td')
    dni.value = columnas[0].textContent
    nombre.value = columnas[1].textContent
    apellido.value = columnas[2].textContent
    seleccionarComboPorTexto(genero, columnas[3].textContent)
    seleccionarComboPorTexto(curso, columnas[4].textContent)
    costo.value = columnas[5].textContent

    editarPosicion = buscarPosicionEnArreglo(dni.value, 0)
})

// Funciones

function nuevoAlumno() {
    alumnos.push([
        dni.value,
        nombre.value,
        apellido.value,
        genero.options[genero.selectedIndex].text,
        curso.options[curso.selectedIndex].text,
        costo.value
    ])
}

function nuevaFila(alumno) {
    fila = document.createElement('tr')
    for (let i = 0; i < alumno.length; i++) {
        td = document.createElement('td')
        td.appendChild(document.createTextNode(alumno[i]))

        fila.appendChild(td)
    }
    tabla.appendChild(fila)
}

function llenarTabla(array) {
    tabla.innerHTML = ''
    array.forEach(alumno => {
        nuevaFila(alumno)
    });
}

function obtenerPrecio() {
    valor = curso.options[curso.selectedIndex].value
    return precios[valor]
}

function limpiarFormulario() {
    curso.selectedIndex = -1
    genero.selectedIndex = -1
    costo.value = ''
    dni.value = ''
    nombre.value = ''
    apellido.value = ''
    curso.focus()
    editarPosicion = -1
}

function buscarDatoEnArreglo(dato, columna) {
    flag = false
    alumnos.forEach(alumno => {
        if (alumno[columna] === dato) {
            flag = true
        }
    });
    return flag
}

function buscarPosicionEnArreglo(dato, columna) {
    index = -1
    alumnos.forEach((alumno, i) => {
        if (alumno[columna] === dato)
            index = i
    })
    return index
}

function buscarRegistrosEnTabla(filtro) {
    let filtrado = alumnos.filter(function(alumno) {
        if ((alumno[0].indexOf(filtro) > -1) || (alumno[1].indexOf(filtro) > -1) || (alumno[2].indexOf(filtro) > -1))
            return alumno
    })

    llenarTabla(filtrado)
}

function seleccionarComboPorTexto(combo, texto) {
    for (let i = 0; i < combo.options.length; i++) {
        if (combo.options[i].text === texto)
            combo.options[i].selected = true
    }
}

function editarDato(index) {
    alumnos[index][0] = dni.value,
        alumnos[index][1] = nombre.value,
        alumnos[index][2] = apellido.value,
        alumnos[index][3] = genero.options[genero.selectedIndex].text,
        alumnos[index][4] = curso.options[curso.selectedIndex].text,
        alumnos[index][5] = costo.value
}

function eliminarDato(index) {
    alumnos.splice(index, 1)
}

function formularioLleno() {
    if (curso.selectedIndex > -1) {
        if (dni.value.length === 8) {
            if (nombre.value.length > 0) {
                if (apellido.value.length > 0) {
                    if (genero.selectedIndex > -1) {
                        return true
                    } else {
                        genero.focus()
                        return false
                    }
                } else {
                    apellido.focus()
                    return false
                }
            } else {
                nombre.focus()
                return false
            }
        } else {
            dni.focus()
            return false
        }
    } else {
        curso.focus()
        return false
    }
}