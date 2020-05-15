<%-- 
    Document   : IngresoProductos
    Created on : 06-ago-2019, 20:23:34
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.*;" %>
<%!Controlador control = new Controlador();%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso de Productos</title>
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
            .cltxtos{font-weight: bold;color: blue;}
        </style>

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    </head>
    <body>
        <% control.BarraPrincipal(out);
            control.BarradeMenu(out);%>
        <div class="container">
            <fieldset style="background-color: #DDD">
                <legend style="text-align: center;color: blue; font-weight: bold">
                    Datos del proveedor
                </legend>                 
                <table>
                    <tr class="control-group">
                        <td style="position: relative;color: blueviolet;font-weight: bold;
                            font-family: Vegur, 'PT Sans', Verdana, sans-serif;width: 40px">Buscar:</td>
                        <td style="position: relative;width: 50px"><input type="text" class="span2" 
                                                                          id="rucprov" maxlength="11"       placeholder="Ingresa el Ruc"></td>
                        <td style="width: 240px"><h4 id="elprv" style="position: relative;left: 20px"></h4></td>  
                        <td style="position: relative ; width: 110px" id="tpocbt">Tipo Comprobante</td>
                        <td style="width: 50px">
                            <select id="cbcomp" style="width: 90px">
                                <option value="0">Boleta</option>
                                <option value="1">Factura</option>
                            </select>
                        </td>
                        <td style="width: 275px" id="num">Numero <input type="text" class="span1" id="txnum"></td>
                    </tr> 
                </table>   
            </fieldset>                                          
        </div>


        <div class="main-inner">
            <div class="container">
                <div class="row all-icons">
                    <div class="widget">
                        <div class="widget-header">
                            <img src="Imagenes/producto.png" alt="Productos" width="6%">
                            <h3 style="color:#449d44;font-weight: bold ">Los Productos</h3>
                        </div>
                        <div class="widget-content" style="min-height:220px;">
                            <div class="control-group" style="margin-top:5px;">
                                <div class="controls">Buscar: 
                                    <input type="text" class="span4" value="" id="busprod" placeholder="Buscar..." style="margin-left:10px;">
                                </div> 
                            </div>                             
                            <div id="data1">                                  
                            </div>
                            <div class="container">                                
                                <table class="table" style="background-color: #ddf">
                                    <tr><td><label class="cltxtos">Producto</label><input id="tx1" type="text" class="span4 "></td>
                                        <td><label class="cltxtos">Precio</label><input id="tx2" type="text" class="span2"></td>
                                        <td><label class="cltxtos">Cantidad</label><input id="tx3" type="text" class="span2">    </td>
                                    </tr>  
                                </table>                                   
                            </div>                            
                            <div id="data2">                                  
                            </div>
                        </div>                                
                    </div>                            
                </div>                        
            </div> 

            <div class="container my-2">
                <div class="card">
                    <div class="card-body">
                        <table class="table">
                            <thead>
                            <th>Producto</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            </thead>
                            <tbody id="body"></tbody>
                        </table>

                        <button class="btn btn-primary" id="guardar">Guardar</button>
                    </div>
                </div>
            </div>                   
        </div>
        <br>
        <br>



        <!-- Le javascript ================================================== --> 
        <!-- Placed at the end of the document so the pages load faster --> 
        <script src="js/jquery-1.7.2.min.js"></script>        
        <script src="js/excanvas.min.js"></script> 
        <script src="js/chart.min.js" type="text/javascript"></script><script src="js/bootstrap.js"></script>
        <script language="javascript" type="text/javascript" src="js/full-calendar/fullcalendar.min.js"></script> 
        <script src="js/base.js"></script> <script src="dist/sweetalert-dev.js"></script>
        <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>

        <script>
            $(document).ready(function () {
                Mostrar("", "");
                OculAparecer(0);
                document.getElementById('cbcomp').selectedIndex = -1;
                $("#cbcomp").change(function () {
                    $("#txnum").focus();
                });

                $('#rucprov').on('input', function () {
                    if ($('#rucprov').val().length === 11) {
                        ruc = $('#rucprov').val();
                        $.ajax({
                            url: "Procesador.jsp", type: 'POST', data: "ev=13" + "&rc=" + ruc,
                            success: function (msg) {
                                $('#elprv').text(msg.trim());
                                if (msg.trim().length > 0) {
                                    OculAparecer(1);
                                    document.getElementById('cbcomp').selectedIndex = -1;
                                }
                            },
                            error: function (xml, msg) {}
                        });
                    } else {
                        OculAparecer(0);
                        $('#elprv').text("");
                    }
                });

                $("#tx3").keypress(function (e) {
                    if (e.which == 13) {
//             swal('Aviso','Presionaste '.concat($("#tx3").val().toString()),'success');
                        agregarTabla();
                        limpiar();
                    }
                });



                $("#guardar").click(() => {
                    if( $("#rucprov").val().length !== 11 ){
                        swal('Aviso','Falta los datos del proveedor','error');
                        $("#rucprov").focus();
                    }else{                        
                        swal('Aviso','Los datos se guardaron correctamente ','success');
                        $("#body").empty();
                        limpiar();
                    }
                    
                });



            });


            function agregarTabla() {
                fila = document.createElement('tr');

                td1 = document.createElement('td');
                td1.appendChild(document.createTextNode($('#tx1').val()));

                td2 = document.createElement('td');
                td2.appendChild(document.createTextNode($('#tx2').val()));

                td3 = document.createElement('td');
                td3.appendChild(document.createTextNode($('#tx3').val()));

                fila.appendChild(td1);
                fila.appendChild(td2);
                fila.appendChild(td3);

                document.getElementById('body').appendChild(fila);
            }
            function limpiar(){
                $('#tx1').val('');
                $('#tx2').val('');
                $('#tx3').val('');
            }

            function Mostrar(id, dt) {
                var id = "";
                $.ajax({
                    url: "Procesador.jsp", type: 'POST', data: "ev=12" + "&idpr=" + id + "&prd=" + dt,
                    success: function (msg) {
                        $("#data1").html(msg);
                        //$("#data2").html(msg);
                        ordtabla('tabla1');
                        $(".dataTables_filter").hide();
                    },
                    error: function (xml, msg) {
                        swal("Aviso", msg.trim(), "info");
                    }
                });
            }
            function SeleccionarProducto(id) {
                //$('#idprd').val(id);LlenarMarcas();                   
                $.ajax({url: "Procesador.jsp", type: 'POST', data: "ev=15" + "&idpr=" + id,
                    dataType: 'json',
                    success: function (data) {
                        $("#tx1").val(data.nompr);
                        $("#tx2").val(data.prc);
                        $("#tx3").focus();
                    }, error: function (xml, msg) {}
                });
            }
            /*function SeleccionarProd(idp){
             swal("Aviso","El Identificador Es: "+idp,"success");   
             $.ajax({
             url: "Procesador.jsp",type: 'POST',data: "ev=14"+" id="+idp,
             success: function (data) {
             
             }
             error: function (xml,msg) {}
             });
             }*/
            function OculAparecer(bdr) {
                if (bdr === 1) {
                    $('#tpocbt').show();
                    $('#cbcomp').show();
                    $("#num").show();
                } else {
                    $('#tpocbt').hide();
                    $('#cbcomp').hide();
                    $("#num").hide();
                }
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
        </script>

    </body>
</html>
