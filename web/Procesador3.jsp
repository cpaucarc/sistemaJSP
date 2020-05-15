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
        case 1: { //Comprobante 
            try {
                String tipo = request.getParameter("tipo");
                String mod = request.getParameter("mod");
                String ident = request.getParameter("ident");

                String idc = control.crearComprobante(tipo, mod, ident);
                control._idc = idc;
                out.print(idc);
            } catch (Exception e) {
                out.print(control.Sql);
            }
            break;
        }
        case 2: { //Comprar
            String prod = request.getParameter("prod");
            String precio = request.getParameter("precio");
            String cant = request.getParameter("cant");
            String idcomp = request.getParameter("idcomp");
            Ventas venta = new Ventas(prod, precio, cant, idcomp);
            venta.comprar();
            out.print("Ok");
            break;
        }
        case 3: { //Obtener Cliente
            String dni = request.getParameter("ident");
            out.print(control.obtenerCliente(dni));
            break;
        }       
        
        case 4: { //Obtener Cliente
            String prod = "";
            control.Sql = "select idproducto, nomprod from producto order by nomprod;";
            control.Base.st = control.Base.cnx.createStatement();
            control.Base.rs = control.Base.st.executeQuery(control.Sql);
            while (control.Base.rs.next()) {
                prod += "<option value='"+control.Base.rs.getString(2) +"'></option>";
            }
            out.println(prod);
            break;
        }
    }
%>