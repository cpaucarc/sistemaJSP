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
                margin-left: 75px;
                margin-bottom: 10px;
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
                                    <label>Precio (Precione enter para añadir a tabla)</label>
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
                llenarProductos();
                $("#ident").keyup(() => {
                    if ($("#ident").val().length === 11 || $("#ident").val().length === 8) {
                        buscarCliente();
                    } else {
                        $("#cliente").val('');
                    }
                });
                $("#prec").keypress(function (e) {
                    if (e.which === 13) {
                        nuevoProducto();
                        llenarTabla();
                    }
                });
                $("#comprar").click(() => {
                    comprarProducto();
                });

                function llenarProductos() {
                    $.ajax({
                        url: "Procesador3.jsp",
                        type: 'POST',
                        data: "ev=4",
                        success: function (msg) {
                            $('#lista').html(msg);
                        },
                        error: function (xml, msg) {}
                    });
                }

                function nuevoProducto() {
                    productos.push({
                        producto: $("#prod").val(),
                        cantidad: $("#cant").val(),
                        precio: $("#prec").val()
                    });
                    limpiar();
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

                function comprarProducto() {

                    let ident = $("#ident").val();
                    let comp = $("#comp").children("option:selected").text();
                    let mod = $("#mod").children("option:selected").text();

                    $.ajax({url: "Procesador3.jsp", type: 'POST',
                        data: "ev=1" + "&tipo=" + comp + "&mod=" + mod + "&ident=" + ident,
                        success: function (msg) {
                            productos.forEach(prod => {
                                $.ajax({url: "Procesador3.jsp", type: 'POST',
                                    data: "ev=2" + "&prod=" + prod.producto + "&precio=" + prod.precio
                                            + "&cant=" + prod.cantidad + "&idcomp=" + msg,
                                    success: function (msg) {
                                        console.log(msg);
                                    }, error: function (xml, msg) {}
                                });
                            });

                            window.open("comprobante.jsp");

                            limpiar();
                            $("#body").empty();

                        }, error: function (xml, msg) {}
                    });

                }

                function  limpiar() {
                    $("#prod").val('');
                    $("#prod").focus();
                    $("#cant").val('');
                    $("#prec").val('');
                }
                function crearComprobante() {
                    let ident = $("#ident").val();
                    let comp = $("#comp").children("option:selected").text();
                    let mod = $("#mod").children("option:selected").text();
                    let idComp;
                    $.ajax({url: "Procesador3.jsp", type: 'POST',
                        data: "ev=1" + "&tipo=" + comp + "&mod=" + mod + "&ident=" + ident,
                        success: function (msg) {
                            return msg;
                        }, error: function (xml, msg) {}
                    });
                    return idComp;
                }

                function buscarCliente() {
                    let dni = $("#ident").val();
                    $.ajax({url: "Procesador3.jsp", type: 'POST',
                        data: "ev=3" + "&ident=" + dni,
                        success: function (msg) {
                            $('#cliente').val(msg);
                        }, error: function (xml, msg) {}
                    });
                }




            });









        </script>
    </body>
</html>
