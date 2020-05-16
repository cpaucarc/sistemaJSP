<%-- 
    Document   : ReporMarcas
    Created on : 01-ago-2019, 12:09:29
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>

<%@page import="net.sf.jasperreports.engine.*, net.sf.jasperreports.view.JasperViewer,net.sf.jasperreports.*,
        net.sf.jasperreports.engine.util.JRLoader" %>
<%@page import="Clases.*,java.util.*,java.io.*" %>

<%!  Controlador control=new Controlador(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de Marcas    </title>
        <link rel="shortcut icon" type="image/x-icon" href="/Imagenes/Accept.png"/>                
    </head>
    <body>
        
          <%            
            try {  Map parameters = new HashMap();
                    File reportFile = new File(application.getRealPath("/Reportes//todos_comprob.jasper"));
                    parameters.put("", "");
                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),
                            parameters,
                            control.Base.cnx);
                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    ServletOutputStream ouputStream = response.getOutputStream();
                    ouputStream.write(bytes, 0, bytes.length);
                    ouputStream.flush();
                    ouputStream.close();
                } catch (Exception e) {
                    out.println("Se ha producido un errror!!");
                }
            
            %>
    </body>
</html>
