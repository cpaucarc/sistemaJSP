<%-- 
    Document   : Acceso
    Created on : 27-jul-2019, 17:22:02
    Author     : User
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acceso al Sistema</title>
        <link rel="shortcut icon" type="image/x-icon" href="Imagenes/Accept.png"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        
        
        <style type="text/css">
            body {
                color: #fff;
                background: deepskyblue;
            }
            .form-control {
                min-height: 41px;
                background: #fff;
                box-shadow: none !important;
                border-color: #e3e3e3;
            }
            .form-control:focus {
                border-color: #70c5c0;
            }
            .form-control, .btn {        
                border-radius: 2px;
            }
            .login-form {
                width: 350px;
                margin: 0 auto;
                padding: 100px 0 30px;		
            }
            .login-form form {
                color: #7a7a7a;
                border-radius: 2px;
                margin-bottom: 15px;
                font-size: 13px;
                background: #e1ecec;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;	
                position: relative;	
            }
            .login-form h2 {
                font-size: 22px;
                margin: 35px 0 25px;
            }
            .login-form .avatar {
                position: absolute;
                margin: 0 auto;
                left: 0;
                right: 0;
                top: -50px;
                width: 95px;
                height: 95px;
                border-radius: 50%;
                z-index: 9;
                background: #70c5c0;
                padding: 15px;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
            }
            .login-form .avatar img {
                width: 100%;
            }	
            .login-form input[type="checkbox"] {
                margin-top: 2px;
            }
            .login-form .btn {        
                font-size: 16px;
                font-weight: bold;
                background: #70c5c0;
                border: none;
                margin-bottom: 20px;
            }
            .login-form .btn:hover, .login-form .btn:focus {
                background: #50b8b3;
                outline: none !important;
            }    
            .login-form a {
                color: #fff;
                text-decoration: underline;
            }
            .login-form a:hover {
                text-decoration: none;
            }
            .login-form form a {
                color: #7a7a7a;
                text-decoration: none;
            }
            .login-form form a:hover {
                text-decoration: underline;
            }
        </style>

        <script>
            $(document).ready(function (e) {
                $("#user").focus();var veces = 0;
                
                $("#bto1").click(function (e) {
                    if ($("#user").val().trim().length > 0) {
                        if ($("#pw").val().trim().length > 0) {
                            $.ajax({url: "Procesador.jsp", type: 'POST',
                                data: "ev=0" + "&u=" + $("#user").val() + "&psw=" + $("#pw").val() + "",
                                success: function (msg) {
                                    if (msg.trim() === "1") {                                                                            
                                       window.parent.close(); 
                                       window.open("MenuPrincipal.jsp");                                       
                                    }
                                    else {
                                        veces++;
                                        if (veces === 3) {
                                            veces = 0;alert("Cumplio sus oportunidades, Se Cerrara el Sistema");
                                            window.parent.close();
                                        }
                                        else {
                                            if (veces === 1)
                                                alert("Credenciles incorrectas \n Llevas una Oportunidad");
                                            else
                                                alert("Credenciles incorrectas \n Llevas " + veces + " Oportunidades");
                                            $("#user").select();
                                        }
                                    }
                                }, error: function (xml, msg) {
                                }
                            });
                        }
                        else {
                            alert("Falta Ingresar el Password");
                            $("#pw").focus();
                        }
                    }
                    else {
                        alert("Falta Ingresar al usuario");
                        $("#user").focus();
                    }
                    e.preventDefault();
                });
                
            });
        </script>
    </head>
    <body>
        <div class="login-form">    
            <form action="">
                <div class="avatar">
                    <img src="Imagenes/Computer.png" alt="Acceso">
                </div>
                <h2 class="text-center">Acceso Al Sistema</h2>   
                <div class="form-group">
                    <input type="text" class="form-control" id="user" name="username" placeholder="Username" required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="pw" name="password" placeholder="Password" required="required">
                </div>        
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block" id="bto1" name="bt1">Aceptar</button>
                </div>
                <!--<div class="clearfix">
                    <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
                     <a href="#" class="pull-right">Forgot Password?</a>
                </div> -->
            </form>    
            <!--<p class="text-center small">Don't have an account? <a href="#">Sign up here!</a></p>  -->
        </div>       
    </body>
</html>                            
