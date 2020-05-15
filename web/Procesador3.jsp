<%-- 
    Document   : Procesador
    Created on : 16-ene-2018, 6:54:45
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.*" %>
<%@page import="org.json.simple.*"%>

<%!Controlador control = new Controlador();%>

<%
    switch (Integer.parseInt(request.getParameter("ev"))) {
        case 1: { //Comprar 
            try {
                String prod = request.getParameter("prod");
                String prec = request.getParameter("prec");
                String cant = request.getParameter("cant");
                
                Tipo mc = new Tipo(0, (String) request.getParameter("tipo"));
                out.print(mc.CrearTipo());
            } catch (Exception e) {
                out.print(control.Sql);
            }
            break;
        }
        case 2: { //Lenar Tabla Tipo
            String tipo = request.getParameter("tipo");
            int cont = 0;
            control.Sql = "Select * from tipoproducto where tippro like'%" + tipo + "%'";

            out.print("<div class='widget widget-table action-table'><div class='widget-header'><h3>Lista de Tipos de Producto</h3></div>"
                    + "<div class='widget-content'><table class='table table-striped table-bordered' id='tabla1'><thead><tr>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>N°</th>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>Tipo de Producto</th>"
                    + "<th style='width:11%; padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>"
                    + "Gestionar</th></tr></thead><tbody>");
            control.Base.st = control.Base.cnx.createStatement();
            control.Base.rs = control.Base.st.executeQuery(control.Sql);
            while (control.Base.rs.next()) {
                cont++;
                String mca = "'" + control.Base.rs.getString(1) + "','" + control.Base.rs.getString(2) + "'";

                out.println("<tr>"
                        + "<td style='text-align:center; font-size:14px;'>" + cont + "</td>"
                        + "<td style='text-align:center; font-size:14px;'>" + control.Base.rs.getString(2)+"</td>"
                        + "<td class='td-actions'><a href='javascript:;' class='btn btn-small' "
                        + " onclick='editU(" + control.Base.rs.getString(1) + ")'> <img src='Imagenes/Edit.png' "
                        + "width='18px'></a><a href='javascript:;' class='btn btn-danger btn-small' "
                        + "onclick=\"Eliminar('" + control.Base.rs.getString(1) + "','" + control.Base.rs.getString(2) + "')\";><img src='Imagenes/cancel.png'"
                        + " width='18px'></a></td>"
                        + "</tr>");
            }
            out.println("</tbody></table></div></div>");
            break;
        }
        case 3: {  //Editar Tipo
            try {
                Tipo mc = new Tipo(Integer.parseInt(request.getParameter("idtipo")), (String) request.getParameter("tipo"));
                out.print(mc.EditarTipo());
            } catch (Exception e) {
                out.print(control.Sql);
            }
            break;
        }
        case 4: {  //Eliminar Tipo
            try {
                Tipo mc = new Tipo(Integer.parseInt(request.getParameter("idtipo")), (String) request.getParameter("tipo"));
                out.print(mc.EliminarTipo());
            } catch (Exception e) {
                out.print(control.Sql);
            }
            break;
        }
        case 5: { //Lenar modal para editar
            out.print(control.DevolverRegistroDto("select * from tipoproducto where idtipoproducto='"
                    + request.getParameter("cd") + "'", 2));
            break;
        }
    }
%>