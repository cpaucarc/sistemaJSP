package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Clases.*;;

public final class IngresoProductos_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

Controlador control = new Controlador();
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("       <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Ingreso de Productos</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\">  \n");
      out.write("        <meta name=\"apple-mobile-web-app-capable\" content=\"yes\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/bootstrap-responsive.min.css\" rel=\"stylesheet\">  \n");
      out.write("        <link href=\"css/font-awesome.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\"> \n");
      out.write("        <link href=\"css/pages/dashboard.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"dist/sweetalert.css\">\n");
      out.write("        <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"Imagenes/Company.png\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"media/css/dataTables.bootstrap.css\">        \n");
      out.write("        <style type=\"text/css\" class=\"init\"></style>  \n");
      out.write("\n");
      out.write("        <style> \n");
      out.write("            body{color: #333333;font-family: Calibri,Candara,Segoe,Segoe UI,Optima,Arial,sans-serif;font-size: 14px;}\n");
      out.write("            .subnavbar {color: #333333;font-family: Century Gothic, sans-serif;}\n");
      out.write("            .navbar {color: #333333;font-family: Century Gothic, sans-serif;}\n");
      out.write("            .bloque{width:34em;display: inline-block;margin-left:10px;}\n");
      out.write("            @media all and (max-width: 800px){\n");
      out.write("                .bloque{display: block !important;  /* Cuando el ancho sea inferior a 800px el elemento será un bloque */\n");
      out.write("                        width: 50% !important;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        \n");
      out.write("        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->\n");
      out.write("        <!--[if lt IE 9]> <script src=\"http://html5shim.googlecode.com/svn/trunk/html5.js\"></script><![endif]-->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 control.BarraPrincipal(out); control.BarradeMenu(out); 
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("          <fieldset style=\"background-color: #DDD\">\n");
      out.write("           <legend style=\"text-align: center;color: blue; font-weight: bold\">\n");
      out.write("                    Datos del proveedor\n");
      out.write("           </legend>                 \n");
      out.write("              <table>\n");
      out.write("                <tr class=\"control-group\">\n");
      out.write("                 <td style=\"position: relative;color: blueviolet;font-weight: bold;\n");
      out.write("                    font-family: Vegur, 'PT Sans', Verdana, sans-serif; \n");
      out.write("                    width: 40px\">Buscar:</td>\n");
      out.write("                 <td style=\"position: relative;width: 50px\"><input type=\"text\" class=\"span2\" \n");
      out.write("                 id=\"rucprov\" maxlength=\"11\"       placeholder=\"Ingresa el Ruc\"></td>\n");
      out.write("                 <td style=\"width: 240px\"><h4 id=\"elprv\" style=\"position: relative;left: 20px\"></h4></td>  \n");
      out.write("                 <td style=\"position: relative ; width: 110px\" id=\"tpocbt\">Tipo Comprobante</td>\n");
      out.write("                 <td style=\"width: 50px\">\n");
      out.write("                  <select id=\"cbcomp\" style=\"width: 90px\">\n");
      out.write("                  <option value=\"0\">Boleta</option>\n");
      out.write("                  <option value=\"1\">Factura</option>\n");
      out.write("                  </select>\n");
      out.write("                 </td>\n");
      out.write("                 <td style=\"width: 275px\" id=\"num\">Numero <input type=\"text\" class=\"span1\" id=\"txnum\"></td>\n");
      out.write("               </tr> \n");
      out.write("              </table>   \n");
      out.write("         </fieldset>                                          \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <div class=\"main-inner\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row all-icons\">\n");
      out.write("                    <div class=\"widget\">\n");
      out.write("                        <div class=\"widget-header\">\n");
      out.write("                            <img src=\"Imagenes/producto.png\" alt=\"Productos\" width=\"6%\">\n");
      out.write("                            <h3 style=\"color:#449d44;font-weight: bold \">Los Productos</h3>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"widget-content\" style=\"min-height:220px;\">\n");
      out.write("                            <div class=\"control-group\" style=\"margin-top:5px;\">\n");
      out.write("                                <div class=\"controls\">Buscar: \n");
      out.write("                                    <input type=\"text\" class=\"span4\" value=\"\" id=\"busprod\" placeholder=\"Buscar...\" style=\"margin-left:10px;\">\n");
      out.write("                                </div> \n");
      out.write("                            </div>                             \n");
      out.write("                            <div id=\"data1\">                                  \n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"container\">                                \n");
      out.write("                                <table class=\"table\" style=\"background-color: #DDD\">\n");
      out.write("                                    <tr><td><label>Producto</label><input id=\"tx1\" type=\"text\" class=\"span4\"></td>\n");
      out.write("                                            <td><label>Precio</label><input id=\"tx2\" type=\"text\" class=\"span2\"></td>\n");
      out.write("                                            <td><label>Cantidad</label><input type=\"text\" class=\"span2\">    </td>\n");
      out.write("                                        </tr>  \n");
      out.write("                                    </table>                                   \n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                            <div id=\"data2\">                                  \n");
      out.write("                            </div>\n");
      out.write("                        </div>                                \n");
      out.write("                    </div>                            \n");
      out.write("                </div>                        \n");
      out.write("            </div>                    \n");
      out.write("        </div>                       \n");
      out.write("                \n");
      out.write("        <!-- Le javascript ================================================== --> \n");
      out.write("        <!-- Placed at the end of the document so the pages load faster --> \n");
      out.write("        <script src=\"js/jquery-1.7.2.min.js\"></script>        \n");
      out.write("        <script src=\"js/excanvas.min.js\"></script> \n");
      out.write("        <script src=\"js/chart.min.js\" type=\"text/javascript\"></script><script src=\"js/bootstrap.js\"></script>\n");
      out.write("        <script language=\"javascript\" type=\"text/javascript\" src=\"js/full-calendar/fullcalendar.min.js\"></script> \n");
      out.write("        <script src=\"js/base.js\"></script> <script src=\"dist/sweetalert-dev.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" language=\"javascript\" src=\"media/js/jquery.dataTables.js\"></script>\n");
      out.write("        \n");
      out.write("        <script>\n");
      out.write("         $(document).ready(function(){\n");
      out.write("          Mostrar(\"\",\"\");OculAparecer(0);          \n");
      out.write("          document.getElementById('cbcomp').selectedIndex=-1;   \n");
      out.write("          $(\"#cbcomp\").change(function(){\n");
      out.write("            $(\"#txnum\").focus();  \n");
      out.write("          });\n");
      out.write("          $('#rucprov').on('input', function() {\n");
      out.write("            if($('#rucprov').val().length===11){\n");
      out.write("             ruc=$('#rucprov').val();\n");
      out.write("             $.ajax({\n");
      out.write("              url: \"Procesador.jsp\",type: 'POST',data: \"ev=13\"+\"&rc=\"+ruc,\n");
      out.write("              success: function (msg) {$('#elprv').text(msg.trim());\n");
      out.write("               if(msg.trim().length>0){                \n");
      out.write("                OculAparecer(1);document.getElementById('cbcomp').selectedIndex=-1;     \n");
      out.write("               }                   \n");
      out.write("              },\n");
      out.write("              error: function (xml,msg) {}                    \n");
      out.write("             });             \n");
      out.write("            }\n");
      out.write("            else{OculAparecer(0);$('#elprv').text(\"\"); }                        \n");
      out.write("           });          \n");
      out.write("         });   \n");
      out.write("       \n");
      out.write("      function Mostrar(id,dt){\n");
      out.write("       var id=\"\";\n");
      out.write("       $.ajax({\n");
      out.write("        url: \"Procesador.jsp\", type: 'POST',data: \"ev=12\" + \"&idpr=\" + id + \"&prd=\"+dt,\n");
      out.write("        success: function (msg) {\n");
      out.write("         $(\"#data1\").html(msg);\n");
      out.write("         //$(\"#data2\").html(msg);\n");
      out.write("         ordtabla('tabla1');$(\".dataTables_filter\").hide();\n");
      out.write("        },\n");
      out.write("        error: function (xml, msg) {swal(\"Aviso\",msg.trim(),\"info\");}\n");
      out.write("       });  \n");
      out.write("      }        \n");
      out.write("      function OculAparecer(bdr){\n");
      out.write("       if(bdr===1){$('#tpocbt').show();$('#cbcomp').show();$(\"#num\").show();}   \n");
      out.write("       else{$('#tpocbt').hide();$('#cbcomp').hide();$(\"#num\").hide();}           \n");
      out.write("      } \n");
      out.write("      function ordtabla(tab) {\n");
      out.write("        $('#' + tab).dataTable({\n");
      out.write("         \"language\": {\"sProcessing\": \"Procesando...\", \"sLengthMenu\": \"Mostrar _MENU_ Registros\",\n");
      out.write("         \"sZeroRecords\": \"No se encontraron resultados\", \"sEmptyTable\": \"Ningún dato disponible en esta tabla\",\n");
      out.write("         \"sInfo\": \"Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros\",\n");
      out.write("         \"sInfoEmpty\": \"Mostrando registros del 0 al 0 de un total de 0 registros\",\n");
      out.write("         \"sInfoFiltered\": \"(filtrado de un total de _MAX_ registros)\",\n");
      out.write("         \"sInfoPostFix\": \"\", \"sSearch\": \"Buscar:\", \"sUrl\": \"\",\n");
      out.write("         \"sInfoThousands\": \",\", \"sLoadingRecords\": \"Cargando...\",\n");
      out.write("         \"oPaginate\": {\"sFirst\": \"Primero\", \"sLast\": \"Último\", \"sNext\": \"Siguiente\",\n");
      out.write("          \"sPrevious\": \"Anterior\"\n");
      out.write("         },\n");
      out.write("         \"oAria\": {\n");
      out.write("         \"sSortAscending\": \": Activar para ordenar la columna de manera ascendente\",\n");
      out.write("         \"sSortDescending\": \": Activar para ordenar la columna de manera descendente\"\n");
      out.write("         }\n");
      out.write("        }\n");
      out.write("        });\n");
      out.write("        $('#' + tab).DataTable();\n");
      out.write("       }\n");
      out.write("     </script>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
