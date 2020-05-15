
function soloNumeros(e) {
    var key = window.Event ? e.which : e.keyCode
    return ((key >= 48 && key <= 57) || (key == 8) || (key == 35) || (key == 34) || (key == 46));
}
function ordtabla(tab) {
    $('#' + tab).dataTable({
        "language": {"sProcessing": "Procesando...", "sLengthMenu": "Mostrar _MENU_ Registros",
            "sZeroRecords": "No se encontraron resultados", "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "", "sSearch": "Buscar:", "sUrl": "",
            "sInfoThousands": ",", "sLoadingRecords": "Cargando...",
            "oPaginate": {"sFirst": "Primero", "sLast": "Último", "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
    $('#' + tab).DataTable();
}

function desmarcarCombo(idCombo){
    document.getElementById(idCombo).selectedIndex=-1;
}
