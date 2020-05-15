<%-- 
    Document   : Marcas
    Created on : 29-jul-2019, 16:52:04
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.*;" %>
<%!Controlador control = new Controlador();%>
<!DOCTYPE html>
<html lang="es">
    <head>     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de marcas</title>
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
        <% control.BarraPrincipal(out); 
        control.BarradeMenu(out); %>
            
        <!--<div class="main" style="margin-bottom:10px;"> -->
        <div class="main-inner">
            <div class="container">
                <div class="row all-icons">
                    <div class="widget">
                        <div class="widget-header">
                            <!--<i class="icon-signal"></i>-->
                            <img src="Imagenes/Shield.png" alt="Marcas" width="2%" title="Las Marcas">
                            <h3 style="color:#449d44;font-weight: bold ">Las Marcas</h3>
                        </div>
                        <div class="widget-content" style="min-height:220px;">
                            <div class="control-group" style="margin-top:5px;">
                                <div class="controls">Buscar: 
                                    <input type="text" class="span4" value="" id="busmrc" placeholder="Buscar..." style="margin-left:10px;">
                                </div> 
                            </div> 
                            <a href="#myModal" role="button" class="btn btn-danger" data-toggle="modal" 
                               style="margin-bottom:20px;" id="btnmodal">
                                Nueva Marca 
                            </a>
                            <div id="msj"></div><br>
                            <div id="data1">                                  
                            </div>                                    
                        </div>                                
                    </div>                            
                </div>                        
            </div>                    
        </div>                
        <!--</div>-->

        <!--*****************************************FORMULARIO MODAL**************************-->
        <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header" style="background-color:#85929E">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color:red; background-color: blue">
                    X
                </button>
                <h3 id="myModalLabel" style="color: #922B21; text-align: center;">Registrar Marca</h3>
            </div>
            <div class="modal-body">
                <div class="field">
                    <table>
                        <tr>
                            <td style="color: blue"><b>Marca :</b></td>
                            <td><input type="text" id="txtmrc" name="txtmrc" value="" placeholder="" class="span5" maxlength="90"/>
                                <input type="hidden" id="idmrc" value="0">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-warning" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                <button class="btn btn-primary" id="btnGuardar" data-dismiss="modal" >Guardar</button>
                
                <button class="btn btn-primary" id="btnEditar" data-dismiss="modal">Guardar Cambios</button>
            </div>
        </div>
        <!--*****************************************FORMULARIO MODAL**************************-->





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
          var bus = $("#busmrc").val();$("#btnEditar").hide();Mostrar("","");
          $("#busmrc").keyup(function (e) {              
           Mostrar("",$(this).val());
          });      
          
          $("#btnGuardar").click(function () {
           mr = $("#txtmrc").val();
           if(mr.trim().length===0){
            swal("Aviso","Falta ingresar la Marca","info");    
            $('#txtmrc').focus();
           }
           else{
            $.ajax({url: "Procesador.jsp", type: 'POST',
            data: "ev=3" + "&mrc=" + mr,
            success: function (msg) {
             if (msg.trim() === "Se creo la marca correctamente") {
              Mostrar("","");swal("Aviso!", "Lo Grabo", "success");                                                                                                                                
             }
             else {swal("Aviso!", msg.trim(), "success");}
              $('#txtmrc').val("");  
             }, error: function (xml, msg) {}                                                        
            });    
           }
          });
        
        $('#btnEditar').click(function(){
         if($('#txtmrc').val().trim().length>0){
          swal("Aviso","Vamos e editar: "+$('#idmrc').val(),"info");      
          $.ajax({
           url: "Procesador.jsp",type: 'POST',
           data: "ev=5"+"&idmr="+$('#idmrc').val()+"&mrc="+$('#txtmrc').val(),
           success: function (data) {
            if(data.trim()==="Editado"){Mostrar("","");
             $("#btnGuardar").show();$("#btnEditar").hide();$("#txtmrc").val("");
             $("#txtmrc").focus();$("#myModalLabel").text("Nueva Marca:");   
             swal("Editado","Edición Correcta","Info");
            }
            else{swal("Editado","No se puede Editar Correcta","Info");}
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
   function EliminarMarca(id,mr){              
     swal({title:"Confirmar",text:"Se eliminara la marca "+mr,
      type:"warning",showCancelButton:true,confirmButtonColor: "#DD6B55",
      confirmButtonText: "Eliminar",
      closeOnConfirm: false},function(){
      $.ajax({
           url: "Procesador.jsp",type: 'POST',
           data: "ev=6"+"&idmr="+id+"&mrc="+mr,
           success: function (data) {
            if(data.trim()==="Eliminado"){
             Mostrar("","");
             swal("Se Elimino correctamente","Info");
            }
            else{swal("Elinado",data.trim(),"Info");}
           },
           error:function(xml,msg){}
          });
     });  
    }           
    
    function Mostrar(id,dt){
      var id="";
     $.ajax({url: "Procesador.jsp", type: 'POST',
      data: "ev=2" + "&idmr=" + id + "&mrc="+dt,
      success: function (msg) {
       $("#data1").html(msg);
       ordtabla('tabla1');
       $(".dataTables_filter").hide();
      },
      error: function (xml, msg) {
       swal("Aviso",msg.trim(),"info")   
      }
     });  
    }  
    function editU(cod){$('#idmrc').val(cod);  
       $.ajax({url: "Procesador.jsp",type: 'POST',data: "ev=4" + "&cd="+cod,
           success: function (msg) {
            $("#txtmrc").val(msg.trim()); 
            $("#btnGuardar").hide();$("#btnEditar").show();$("#txtmrc").focus();
            $("#myModalLabel").text("Editar la Marca:");$('#myModal').modal('show');                                                                        
           }, error: function (xml, msg) {}                                                                    
         });                                            
    }
    
  </script>
    </body>
</html>
