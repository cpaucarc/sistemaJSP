<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcas</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">       
        <link rel="shortcut icon" type="image/x-icon" href="Imagenes/Accept.png"/>        
        
        <!--<link href="css/bootstrap.min.css" rel="stylesheet">
        -->
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">  
        <link href="css/font-awesome.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">        
        <link href="css/pages/dashboard.css" rel="stylesheet">
        <link rel="stylesheet" href="dist/sweetalert.css">                
        <link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css">       
        <style type="text/css" class="init"></style>
        
        
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 

        

        <style>
            body{
                color: #333333;font-family: Calibri,Candara,Segoe,Segoe UI,Optima,Arial,sans-serif;font-size: 14px;
            }
            .subnavbar {color: #333333;font-family: Century Gothic, sans-serif;}
            .navbar {color: #333333;font-family: Century Gothic, sans-serif;}
            .main-nav ul li {
                display: inline-block;
            }
        </style>
        
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
              <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
            <![endif]-->
    </head>
    <body>

        <div class="navbar navbar-fixed-top"> 
            <div class="navbar-inner" style="height: auto;">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>   
                        <span class="icon-bar"></span>   
                        <span class="icon-bar"></span>  
                    </a>  
                    <a class="brand" href="index.html" style="padding: 0px;">                        
                        <img src="Imagenes/Computer.png" alt="Computadora" style="width: 32px;"> Sistema de Ventas
                    </a><br>
                    <div class="nav-collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <span class="icon-apple"></span>
                                    Ususario: Silva <b class="caret"></b>  
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="Miperfil.jsp">Perfil</a>
                                    </li>  
                                    <li>
                                        <a href="Miperfil.jsp">Cerrar</a>
                                    </li>  
                                </ul>
                            </li>  
                        </ul>  
                    </div>
                </div>  
            </div>
        </div>  <!--Barra de titulo -->




        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
            Boton Modal
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="exampleModalLabel">Marca de Productos</h6>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" style="background-color: red">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="marca-name" class="col-form-label">Marca:</label>
                                <input type="text" class="form-control" id="marca-name">
                            </div>                            
                        </form>                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                        <button type="button" class="btn btn-primary" id="btnguardar" data-dismiss="modal">Guardar Cambios</button>
                    </div>
                </div>
            </div>
        </div>

        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                /*$('#btnguardar').click(function (e) {                     
                 $("#div1").html($('#marca-name').val());       
                 $("#div1").focus();
                 });*/
            });
        </script>

        <div id="div1">

        </div>
    </body>
</html>
