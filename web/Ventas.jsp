<%-- Document   : Marcas
     Created on : 29-jul-2019, 16:52:04
     Author     : User --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.*;" %>
<%!Controlador control = new Controlador();%>
<!DOCTYPE html>
<html lang="es">
    <head>     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Productos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">  
        <meta name="apple-mobile-web-app-capable" content="yes">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">  
        <link href="css/font-awesome.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet"> 
        <link href="css/pages/dashboard.css" rel="stylesheet">
        <link rel="stylesheet" href="dist/sweetalert.css">
        <link rel="shortcut icon" type="image/x-icon" href="Imagenes/Company.png" />
        <link rel="stylesheet" type="text/css" href="media/css/dataTables.bootstrap.css">        
        <style type="text/css" class="init"></style>  

        <style> 
            body{color: #333333;font-family: Calibri,Candara,Segoe,Segoe UI,Optima,Arial,sans-serif;font-size: 14px;}
            .subnavbar {color: #333333;font-family: Century Gothic, sans-serif;}
            .navbar {color: #333333;font-family: Century Gothic, sans-serif;}
            .bloque{width:34em;display: inline-block;margin-left:10px;}
            @media all and (max-width: 800px){
                .bloque{display: block !important;  /* Cuando el ancho sea inferior a 800px el elemento será un bloque */
                        width: 50% !important;
                }
            }
            .card{
                display: inline-block;
                margin: 5px;
            }
            .venta{
                width: 40%;
            }
        </style>
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    </head>
    <body>
        <% control.BarraPrincipal(out);
            control.BarradeMenu(out);%>            
        <!--<div class="main" style="margin-bottom:10px;"> -->
        <div class="main-inner">
            <div class="container">
                <div class="row all-icons">
                    <div class="widget">
                        <div class="widget-header">
                            <img src="Imagenes/producto.png" alt="Productos" width="6%">
                            <h3 style="color:#449d44;font-weight: bold ">Ventas</h3>
                        </div>
                        <div class="widget-content cards" style="min-height:220px;">
                            <div class="card">
                                <div class="card-body">
                                    <label> Cliente</label>
                                    <input type="number" id="ident"/>
                                    <label>Nombre cliente</label>
                                    <input type="text" id="cliente"/>
                                </div>
                            </div>
                            
                            <div class="card">
                                <div class="card-body">
                                    <label> Comprobante</label>
                                    <select id="comp">
                                        <option value="0">Factura</option>
                                        <option value="1">Boleta</option>
                                        <option value="2">Recibo</option>
                                        <option value="3">Guia de Remision</option>
                                    </select>
                                    <label> Modalidad</label>
                                    <select id="mod">
                                        <option value="0">Credito</option>
                                        <option value="1">Contado</option>
                                    </select>
                                </div>
                            </div>

                            <div class="card venta">
                                <div class="card-body">
                                    <label> Producto</label>
                                    <input type="search" name="productos" list="lista" size="40" id="prod">
                                    <datalist id="lista">
                                    </datalist>
                                    <label>Cantidad</label>
                                    <input type="number" id="cant"/>
                                    <label>Precio</label>
                                    <input type="number" id="prec"/>
                                </div>
                            </div>

                            <div class="cardf">
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio</th>
                                        <th>Importe</th>
                                        </thead>
                                        <tbody id="body">

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div>
                                <button class="btn btn-primary" id="comprar">Comprar</button>
                            </div>
                        </div>                                
                    </div>                            
                </div>                        
            </div>                    
        </div>                
        <!--</div>-->


        <!-- Le javascript ================================================== --> 
        <!-- Placed at the end of the document so the pages load faster --> 
        <script src="js/jquery-1.7.2.min.js"></script>        
        <script src="js/excanvas.min.js"></script> 
        <script src="js/chart.min.js" type="text/javascript"></script><script src="js/bootstrap.js"></script>
        <script language="javascript" type="text/javascript" src="js/full-calendar/fullcalendar.min.js"></script> 
        <script src="js/base.js"></script> <script src="dist/sweetalert-dev.js"></script>
        <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" language="javascript" src="js/funcionesComunes.js"></script>

        <script>
            $(document).ready(function () {
                var productos = [];

                $("#prec").keypress(function (e) {
                    if (e.which === 13) {
                        nuevoProducto();
                        llenarTabla();
                    }
                });

                $("#comprar").click(() => {

                });

                function nuevoProducto() {
                    productos.push({
                        producto: $("#prod").val(),
                        cantidad: $("#cant").val(),
                        precio: $("#prec").val()
                    });
                }
                function crearFila(producto) {
                    fila = document.createElement('tr')

                    td1 = document.createElement('td')
                    td1.appendChild(document.createTextNode(producto.producto));

                    td2 = document.createElement('td')
                    td2.appendChild(document.createTextNode(producto.cantidad));

                    td3 = document.createElement('td')
                    td3.appendChild(document.createTextNode(producto.precio));

                    td4 = document.createElement('td')
                    td4.appendChild(document.createTextNode(producto.cantidad * producto.precio));

                    fila.appendChild(td1);
                    fila.appendChild(td2);
                    fila.appendChild(td3);
                    fila.appendChild(td4);

                    document.getElementById('body').appendChild(fila)

                }
                function  llenarTabla() {
                    $("#body").empty();
                    productos.forEach(prod => {
                        crearFila(prod);
                    });
                }

function comprarProducto(){
    
}

                var bus = $("#busprod").val();
                $("#btnEditar").hide();
                Mostrar("", "");
                LlenarMarcas();
                $("#busprod").keyup(function (e) {
                    Mostrar("", $(this).val());
                });
                $("#btnGuardar1").click(function () {
                    mr = $("#txtmrc1").val();
                    $.ajax({url: "Procesador.jsp", type: 'POST',
                        data: "ev=3" + "&mrc=" + mr,
                        success: function (msg) {
                            if (msg.trim() === "correcto") {
                                LlenarMarcas();
                                $('#txtmrc1').val("");
                                $('#idmrc1').val("");
                            } else {
                                swal("Aviso!", msg.trim(), "success");
                            }
                            $('#txtmrc').val("");
                        }, error: function (xml, msg) {}
                    });
                });
                $("#btnGuardar").click(function () {
                    des = $("#txtprd").val();
                    idtppr = parseInt($("#cbtprd").val());
                    idmr = parseInt($("#cbmrc").val());
                    pre = parseFloat($("#txtprc").val());
                    stmi = parseInt($("#txtstkmin").val());
                    stma = parseInt($("#txtstkmax").val());
                    $.ajax({url: "Procesador.jsp", type: 'POST',
                        data: "ev=8" + "&id=0" + "&idtppr=" + idtppr + "&idmr=" + idmr + "&des=" + des +
                                "&pre=" + pre + "&stmi=" + stmi + "&stma=" + stma,
                        success: function (msg) {
                            if (msg.trim() === "correcto") {
                                $('#txtprd').val("");
                                $("#txtprc").val("");
                                $("#txtstkmin").val("");
                                $("#txtstkmax").val("");
                                $("#cbtprd option[value=-1]").attr("selected", true);
                                $("#cbmrc option[value=-1]").attr("selected", true);
                                Mostrar("", "");
                                swal("Aviso!", "Lo Grabo", "success");
                            } else {
                                swal("Aviso!", msg.trim(), "success");
                            }
                        }, error: function (xml, msg) {}
                    });
                });
                $('#btnCerrar').click(function () {
                    if ($('#txtprd').val().trim().length > 0)
                        limipiarSeleccion();
                });
                $('#Cierre').click(function () {
                    if ($('#txtprd').val().trim().length > 0)
                        limipiarSeleccion();
                });
                $('#btnEditar').click(function () {
                    if ($("#txtstkmax").val().trim().length > 0) {
                        idpd = $('#idprd').val();
                        prd = $('#txtprd').val();
                        idtpoprd = $('#cbtprd').val();
                        idmrc = $('#cbmrc').val();
                        pre = $('#txtprc').val();
                        stmn = $('#txtstkmin').val();
                        stmx = $('#txtstkmax').val();
                        $.ajax({
                            url: "Procesador.jsp", type: 'POST', data: "ev=10" + "&idpd=" + idpd + "&prd="
                                    + prd + "&idtpoprd=" + idtpoprd + "&idmrc=" + idmrc + "&pre=" + pre + "&stmn=" + stmn
                                    + "&stmx=" + stmx,
                            success: function (data) {
                                if (data.trim() === "Editado") {
                                    swal("Editado", "info");
                                    limipiarSeleccion();
                                } else {
                                    swal(data.trim());
                                }
                            },
                            error: function (xml, msg) {}
                        });
                    } else {
                        swal("Aviso", "Faltan datos", "info");
                        $('#txtmrc').focus();
                    }
                    $('#txtmrc').val("");
                    $('#btnEditar').hide();
                    $("#myModal").hide();
                });
                ordtabla('tabla1');
            });

            function limipiarSeleccion() {
                $("#btnGuardar").show();
                $("#btnEditar").hide();
                $("#txtprd").val("");
                $("#txtprd").val("");
                $("#txtprc").val("");
                $("#txtstkmin").val("");
                $("#txtstkmax").val("");
                DesmarcarCombos();
                $("#myModalLabel").text("Nuevo Producto:");
                Mostrar("", "");
            }
            function EliminarProducto(id, mr) {
                swal({title: "Confirmar", text: "Se eliminara el producto " + mr,
                    type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Eliminar",
                    closeOnConfirm: false}, function () {
                    $.ajax({
                        url: "Procesador.jsp", type: 'POST',
                        data: "ev=16" + "&id=" + id + "&des=" + mr,
                        success: function (data) {
                            if (data.trim() === "Eliminado") {
                                Mostrar("", "");
                                swal("Se Elimino correctamente", "Info");
                            } else {
                                swal("Error", data.trim(), "Info");
                            }
                        },
                        error: function (xml, msg) {}
                    });
                });
            }
            function Mostrar(id, dt) {
                var id = "";
                $.ajax({url: "Procesador.jsp", type: 'POST',
                    data: "ev=7" + "&idpr=" + id + "&prd=" + dt,
                    success: function (msg) {
                        $("#data1").html(msg);
                        ordtabla('tabla1');
                        $(".dataTables_filter").hide();
                    },
                    error: function (xml, msg) {
                        swal("Aviso", msg.trim(), "info")
                    }
                });
            }
            function DesmarcarCombos() {
                desmarcarCombo('cbtprd');
                desmarcarCombo('cbmrc');
            }
            function SeleccionarProducto(id) {
                $('#idprd').val(id);
                LlenarMarcas();
                $.ajax({url: "Procesador.jsp", type: 'POST', data: "ev=9" + "&idpr=" + id,
                    dataType: 'json',
                    success: function (data) {
                        $("#txtpr").val(data.idpr);
                        $("#btnGuardar").hide();
                        $("#btnEditar").show();
                        $("#txtprd").val(data.nompr);
                        $("#cbtprd option[value=" + parseInt(data.idtpp) + "]").attr("selected", true);
                        $("#cbmrc option[value=" + parseInt(data.idmr) + "]").attr("selected", true);

                        $("#txtprc").val(data.prc);
                        $("#txtstkmin").val(data.stmi);
                        $("#txtstkmax").val(data.stma);
                        $("#myModalLabel").text("Editar al Producto:");
                        $('#myModal').modal('show');
                    }, error: function (xml, msg) {}
                });
            }
            function LlenarMarcas() {
                $("#cbmrc").empty();
                $.ajax({
                    url: "Procesador.jsp", type: 'POST', data: "ev=11", dataType: 'json',
                    success: function (datos) {
                        datos.forEach(dato => {
                            $('#cbmrc').append($('<option>', {value: dato.idmr, text: dato.mrc}));
                        })
//                        for (f = 0; datos.length; f++) {
//                            $('#cbmrc').append($('<option>', {value: datos[f].idmr, text: datos[f].mrc}));
//                        }
                    },
                    error: function (xml, msg) {
                        swal(msg.trim());
                    }
                });
            }
        </script>
    </body>
</html>
