package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class PruebaTabla_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Pruebas con Tablas</title>\n");
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
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("     <table border=\"1\" cellspacing=\"0\" cellpadding=\"5\" id=\"tbl\">\n");
      out.write("      <thead>\n");
      out.write("       <tr><td>Nombre 1</td><td>Nombre 2</td><td>Apellido 1</td><td>Mantenimiento</td></tr>\n");
      out.write("      </thead>\n");
      out.write("      <tr>\n");
      out.write("       <td class=\"numero\">Kevin</td><td>Joseph</td><td>Ramos</td>\n");
      out.write("       <td class=\"boton\">coger valores de la fila</td>\n");
      out.write("      </tr>\n");
      out.write("      <tr>\n");
      out.write("        <td class=\"numero\">Viviana</td><td>Belen</td><td>Rojas</td>\n");
      out.write("        <td class=\"boton\">coger valores de la fila</td>\n");
      out.write("      </tr>\n");
      out.write("      <tr>\n");
      out.write("       <td class=\"numero\">Junior</td><td>Gerardo</td><td>Nosé</td>\n");
      out.write("       <td class=\"boton\">coger valores de la fila</td>\n");
      out.write("      </tr>\n");
      out.write("     </table>  <br>\n");
      out.write("     <form action=\"\">\n");
      out.write("       <label for=\"\">Nombre</label>\n");
      out.write("       <input type=\"button\" value=\"ok\" id=\"ok\" class=\"boton2\">\n");
      out.write("     </form>\n");
      out.write("        \n");
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
      out.write("         $(document).ready(function() {\n");
      out.write("          $(\"#ok\").click(function() {\n");
      out.write("           var valores = \"\";\n");
      out.write("           $(\".numero\").parent(\"tr\").find(\"td\").each(function() {\n");
      out.write("            if($(this).html() != \"coger valores de la fila\"){\n");
      out.write("             valores += $(this).html() + \" \";\n");
      out.write("             }\n");
      out.write("           });        \n");
      out.write("           valores = valores + \"\\n\";alert(valores);\n");
      out.write("          });\n");
      out.write("          $(\".boton\").click(function() {\n");
      out.write("           var valores = \"\";\n");
      out.write("           // Obtenemos todos los valores contenidos en los <td> de la fila// seleccionada\n");
      out.write("           $(this).parents(\"tr\").find(\".numero\").each(function() {\n");
      out.write("            valores += $(this).html() + \"\\n\";\n");
      out.write("           });\n");
      out.write("           console.log(valores);\n");
      out.write("           alert(valores);\n");
      out.write("          });\n");
      out.write("       });\n");
      out.write("  </script>\n");
      out.write("        \n");
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
