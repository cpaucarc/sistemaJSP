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
        </style>
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    </head>
    <body>
        <% control.BarraPrincipal(out); control.BarradeMenu(out); %>            
        <!--<div class="main" style="margin-bottom:10px;"> -->
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
                            <a href="#myModal" role="button" class="btn btn-danger" data-toggle="modal" style="margin-bottom:20px;" id="btnmodal">
                                Nuevo Producto </a>
                            <!--<div id="msj"></div><br> -->
                            <div id="data1">                                  
                            </div>                                    
                        </div>                                
                    </div>                            
                </div>                        
            </div>                    
        </div>                
        <!--</div>-->


        <!--*****************************************FORMULARIO MODAL DE PRODUCTOS**************************-->
        <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header" style="background-color:#85929E">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" 
                 style="color:red; background-color: blue" id="Cierre">
                    X
                </button>
                <h3 id="myModalLabel" style="color: #922B21;">Mentenimiento de Productos</h3>
            </div>
            <div class="modal-body" style="background-color: #E0FFFF">
                <div class="field">
                    <table style="background-color: #E0FFFF">
                        <tr>
                            <td style="color: blue"><b>Producto :</b></td>
                            <td><input type="text" id="txtprd" name="txtprd" value="" placeholder="" class="span5" maxlength="90"/>
                                <input type="hidden" id="idprd" value="0">
                            </td>
                        </tr>
                        <tr>
                            <td style="color: blue"><b>Tipo Producto :</b></td>
                            <td>
                                 <%
                                  control.llenarComboweb("select * from tipoproducto",
                                  "cbtprd",out,2);
                                 %>                                                                    
                            </td>
                        </tr>
                        <tr>
                            <td style="color: blue"><b>Marca :</b></td>
                            <td>
                             <select class='mdb-select md-form' name='"+nmcb+"' id='cbmrc'></select>
                             <a href="#myModal1" role="button" class="btn btn-danger" data-toggle="modal" 
                              style="margin-bottom:5px;" id="btnmodal">
                                 <img src="Imagenes/Add.png" width="50%"> 
                             </a>
                              
                            </td>
                        </tr>
                        <tr>
                            <td style="color: blue"><b>Precio :</b></td>
                            <td><input type="text" id="txtprc" name="txtprc" value="" placeholder="" class="span3" maxlength="90"/>                            
                            </td>
                        </tr>
                        <tr>
                          <td style="color: blue"><b>St_Minimo :</b></td>
                          <td><input type="text" id="txtstkmin" name="txtstkmin" value="" placeholder="" class="span3" maxlength="3"/>                            
                          </td>                          
                        </tr>
                        <tr>
                        <td style="color: blue"><b>St_Máximo:</b></td>
                          <td><input type="text" id="txtstkmax" name="txtstkmax" value="" placeholder="" class="span3" maxlength="3"/>                            
                          </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-warning" id="btnCerrar" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                <button class="btn btn-primary" id="btnGuardar" data-dismiss="modal" >Guardar</button>
                <button class="btn btn-primary" id="btnEditar" data-dismiss="modal">Guardar Cambios</button>
            </div>
        </div>
        <!--*****************************************FORMULARIO MODAL DE PRODUCTOS**************************-->
        
        <!--*****************************************FORMULARIO MODAL DE MARCAS**************************-->
        <div id="myModal1" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header" style="background-color:#85929E">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color:red; background-color: blue">
                    X
                </button>
                <h3 id="myModalLabel" style="color: #922B21;">Marca</h3>
            </div>
            <div class="modal-body">
                <div class="field">
                    <table>
                        <tr>
                            <td style="color: blue"><b>Marca :</b></td>
                            <td><input type="text" id="txtmrc1" name="txtmrc1" value="" placeholder="" class="span5" maxlength="90"/>
                                <input type="hidden" id="idmrc1" value="0">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-warning" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                <button class="btn btn-primary" id="btnGuardar1" data-dismiss="modal" >Guardar</button>                
            </div>
        </div>
        <!--*****************************************FORMULARIO MODAL DE MARCAS**************************-->
        
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
      var bus = $("#busprod").val();$("#btnEditar").hide();Mostrar("","");
      LlenarMarcas();
      $("#busprod").keyup(function (e) {Mostrar("",$(this).val());});        
      $("#btnGuardar1").click(function () {
           mr = $("#txtmrc1").val();
           $.ajax({url: "Procesador.jsp", type: 'POST',
            data: "ev=3" + "&mrc=" + mr,
            success: function (msg) {
             if (msg.trim() === "correcto") {            
              LlenarMarcas();$('#txtmrc1').val("");
              $('#idmrc1').val("");
             }
             else {swal("Aviso!", msg.trim(), "success");}
             $('#txtmrc').val("");  
            }, error: function (xml, msg) {}                                                        
           });
          });
      $("#btnGuardar").click(function () {
           des=$("#txtprd").val();idtppr=parseInt($("#cbtprd").val());   
           idmr = parseInt($("#cbmrc").val());pre =parseFloat($("#txtprc").val());
           stmi = parseInt($("#txtstkmin").val());stma = parseInt($("#txtstkmax").val());           
           $.ajax({url: "Procesador.jsp", type: 'POST',
            data: "ev=8" + "&id=0" + "&idtppr="+idtppr+"&idmr="+idmr+"&des="+des+
                  "&pre="+pre+"&stmi="+stmi+"&stma="+stma,
            success: function (msg) {
             if (msg.trim() === "correcto") {$('#txtprd').val("");                            
              $("#txtprc").val("");$("#txtstkmin").val("");$("#txtstkmax").val("");   
              $("#cbtprd option[value=-1]").attr("selected",true);
              $("#cbmrc option[value=-1]").attr("selected",true);              
              Mostrar("","");swal("Aviso!", "Lo Grabo", "success");                                                                                                                                
             }
             else {swal("Aviso!", msg.trim(), "success");}
            }, error: function (xml, msg) {}                                                        
           });
          });        
      $('#btnCerrar').click(function(){
          if($('#txtprd').val().trim().length>0)  
           limipiarSeleccion();            
        });  
      $('#Cierre').click(function(){
          if($('#txtprd').val().trim().length>0)  
           limipiarSeleccion();            
        });
      $('#btnEditar').click(function(){            
         if($("#txtstkmax").val().trim().length>0){     
          idpd=$('#idprd').val();prd=$('#txtprd').val();idtpoprd=$('#cbtprd').val();   
          idmrc=$('#cbmrc').val();pre=$('#txtprc').val();stmn=$('#txtstkmin').val();
          stmx=$('#txtstkmax').val();
          $.ajax({
           url: "Procesador.jsp",type: 'POST',data: "ev=10"+"&idpd="+idpd+"&prd="
           +prd+"&idtpoprd="+idtpoprd+"&idmrc="+idmrc+"&pre="+pre+"&stmn="+stmn
           +"&stmx="+stmx,
           success: function (data) {
            if(data.trim()==="Editado"){                           
              swal("Editado","info");  
             limipiarSeleccion();                
            }
            else{swal(data.trim());}            
           },
           error:function(xml,msg){}
          });
         }
         else{
          swal("Aviso","Faltan datos","info");    
          $('#txtmrc').focus();
         }
         $('#txtmrc').val("");$('#btnEditar').hide();$("#myModal").hide(); 
        });
      ordtabla('tabla1');
    });
       
    function soloNumeros(e) {
        var key = window.Event ? e.which : e.keyCode
        return ((key >= 48 && key <= 57) || (key == 8) || (key == 35) || (key == 34) || (key == 46));
       }
    function limipiarSeleccion(){
     $("#btnGuardar").show();$("#btnEditar").hide();
     $("#txtprd").val("");$("#txtprd").val("");
     $("#txtprc").val("");$("#txtstkmin").val("");$("#txtstkmax").val("");                       
     DesmarcarCombos();$("#myModalLabel").text("Nuevo Producto:");Mostrar("","");    
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
    function EliminarProducto(id,mr){              
       swal({title:"Confirmar",text:"Se eliminara la marca "+mr,
       type:"warning",showCancelButton:true,confirmButtonColor: "#DD6B55",
       confirmButtonText: "Eliminar",
       closeOnConfirm: false},function(){
       $.ajax({
        url: "Procesador.jsp",type: 'POST',
        data: "ev=6"+"&idmr="+id+"&mrc="+mr,
        success: function (data) {
         if(data.trim()==="Eliminado"){
           Mostrar("","");swal("Se Elimino correctamente","Info");
         }
         else{swal("Editado",data.trim(),"Info");}
        },
        error:function(xml,msg){}
       });
     });  
    }           
    function Mostrar(id,dt){
      var id="";
      $.ajax({url: "Procesador.jsp", type: 'POST',
       data: "ev=7" + "&idpr=" + id + "&prd="+dt,
       success: function (msg) {
        $("#data1").html(msg);ordtabla('tabla1');
        $(".dataTables_filter").hide();
       },
       error: function (xml, msg) {
        swal("Aviso",msg.trim(),"info")   
       }
      });  
    }
    function DesmarcarCombos(){
     document.getElementById('cbtprd').selectedIndex=-1;
     document.getElementById('cbmrc').selectedIndex=-1;   
    }
    function SeleccionarProducto(id){        
     $('#idprd').val(id);LlenarMarcas();     
     $.ajax({url: "Procesador.jsp",type: 'POST',data: "ev=9" + "&idpr="+id,
         dataType: 'json',
          success: function (data) {
            $("#txtpr").val(data.idpr);             
            $("#btnGuardar").hide();$("#btnEditar").show();$("#txtprd").val(data.nompr);           
            $("#cbtprd option[value="+ parseInt(data.idtpp) +"]").attr("selected",true);
            $("#cbmrc option[value="+ parseInt(data.idmr) +"]").attr("selected",true);     
            
            $("#txtprc").val(data.prc);$("#txtstkmin").val(data.stmi);
            $("#txtstkmax").val(data.stma);             
            $("#myModalLabel").text("Editar al Producto:");$('#myModal').modal('show');                                                                        
           }, error: function (xml, msg) {}                                                                    
         });
    }
    function LlenarMarcas(){    
     $("#cbmrc").empty();     
     $.ajax({
      url: "Procesador.jsp",type: 'POST',data: "ev=11",dataType: 'json',
      success: function (datos) {              
       for(f=0;datos.length;f++){
        $('#cbmrc').append($('<option>',{value: datos[f].idmr,text : datos[f].mrc}));        
       }              
      },
      error: function (xml,msg) {swal(msg.trim());}      
     });            
   }
  </script>
    </body>
</html>
