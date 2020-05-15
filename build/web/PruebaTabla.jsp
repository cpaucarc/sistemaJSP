<%-- 
    Document   : PruebaTabla
    Created on : 06-ago-2019, 18:33:14
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pruebas con Tablas</title>
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
          table,th,td {solid black;}
        </style>
    </head>
    <body>
        <br>
        <div class="container">
         <table   id="tbl" class="table table-bordered table-striped">
             <thead style="font-weight: bold; ">
                <tr class="success"><td>Nombre 1</td><td>Nombre 2</td>
                    <td>Apellido 1</td><td style="width:2%"><center>
                        <img src="Imagenes/Box.png" style="text-align: center">
                    </center></td>
                </tr>
            </thead>
            <%
             for(int f=1;f<=50;f++){   
              out.print("<tr class='table-primary'><td class='c1'>Kevin: "+f+"</td><td class='c2'>Joseph : "+f+"</td><td class='c3'>Ramos</td>");
              out.print("<td class='boton'><img src='Imagenes/Accept.png' width='50%'></td></tr>");          
             }
            %>           
          </table>   
        </div>       <br>        
        
        <table>
           <tr>
            <th id="column1">Month</th>
            <th id="column2">Savings</th>
           </tr>
           <tr>
            <td>January</td>
            <td>$100</td>
           </tr>
           <tr>
            <td>February</td>
            <td>$80</td>
          </tr>
        </table>

</body>

     <form action="">
       <label for="">Nombre</label>
       <input type="text" id="txn"><br>
       <input type="text" id="txr"><br>
       <input type="button" value="ok" id="ok" class="boton2">
     </form>
        
        <!-- Le javascript ================================================== --> 
        <!-- Placed at the end of the document so the pages load faster --> 
        <script src="js/jquery-1.7.2.min.js"></script>        
        <script src="js/excanvas.min.js"></script> 
        <script src="js/chart.min.js" type="text/javascript"></script><script src="js/bootstrap.js"></script>
        <script language="javascript" type="text/javascript" src="js/full-calendar/fullcalendar.min.js"></script> 
        <script src="js/base.js"></script> <script src="dist/sweetalert-dev.js"></script>
        <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>

        
        <script>    
            var $column1 = $("#column1").text();
            console.log("column1: " + $column1);
            var $column2 = $("#column2").text();
            console.log("column2: " + $column2);
        </script>
        <script>
         $(document).ready(function() {         
          
          $(".boton").click(function() {
           var valores = "";           
           $(this).parents("tr").find(".c1").each(function() {
            valores += $(this).html();
           });
           valores=valores+" ";
           $(this).parents("tr").find(".c2").each(function() {
            valores += $(this).html();
           });
           $('#txn').val(valores);$('#txr').focus();           
          });
       });
      </script>      
    </body>
</html>
