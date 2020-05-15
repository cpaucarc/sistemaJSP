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
        case 0: {
            Controlador.dateando = request.getParameter("u");
            out.print(control.DevolverRegistroDto("select FncAcceso('" + request.getParameter("u")
                    + "','" + request.getParameter("psw") + "')", 1));

            /*control.Sql="select * from usuario where usr='"+request.getParameter("u")
       +"' and psw=md5('"+request.getParameter("psw")+"')";                
       if(control.VerificaConsulta(control.Sql)){         
        Controlador.dateando=usu;out.print("1");          
       }
       else{  out.print("0");}*/
            break;
        }
        case 2: {
            String mrc = request.getParameter("mrc");
            int cont = 0;
            control.Sql = "Select * from marca where nommrc like'%" + mrc + "%'";

            out.print("<div class='widget widget-table action-table'><div class='widget-header'><h3>Lista de Marcas</h3></div>"
                    + "<div class='widget-content'><table class='table table-striped table-bordered' id='tabla1'><thead><tr>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>N°</th>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>Marca</th>"
                    + "<th style='width:11%; padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>"
                    + "Gestionar</th></tr></thead><tbody>");
            control.Base.st = control.Base.cnx.createStatement();
            control.Base.rs = control.Base.st.executeQuery(control.Sql);
            while (control.Base.rs.next()) {
                cont++;
                String mca = "'" + control.Base.rs.getString(1) + "','" + control.Base.rs.getString(2) + "'";
                out.println("<tr><td style='text-align:center; font-size:14px;'>" + cont + "</td>"
                        + "<td style='text-align:center; font-size:14px;'>" + control.Base.rs.getString(2)
                        + "</td><td class='td-actions'><a href='javascript:;' class='btn btn-small' "
                        + " onclick='editU(" + control.Base.rs.getString(1) + ")'> <img src='Imagenes/Edit.png' "
                        + "width='18px'></a><a href='javascript:;' class='btn btn-danger btn-small' onclick="
                        + "EliminarMarca(" + mca.trim() + ");><img src='Imagenes/cancel.png'"
                        + " width='18px'></a></td></tr>");
            }
            out.println("</tbody></table></div></div>");
            break;
        }
        case 3: {
            try {
                Marca mc = new Marca(0, (String) request.getParameter("mrc"));
                out.print(mc.CrearMarca());
            } catch (Exception e) {
                out.print(control.Sql);
            }
            break;
        }
        case 4: {
            out.print(control.DevolverRegistroDto("Select * from marca where idmarca='"
                    + request.getParameter("cd") + "'", 2));
            break;
        }
        case 5: {  //Editar Marca
            try {
                Marca mc = new Marca(Integer.parseInt(request.getParameter("idmr")),
                        (String) request.getParameter("mrc"));
                out.print(mc.EditarMarca());
            } catch (Exception e) {
                out.print(control.Sql);
            }
            break;
        }
        case 6: {  //Eliminar Marca
            try {
                Marca mc = new Marca(Integer.parseInt(request.getParameter("idmr")),
                        (String) request.getParameter("mrc"));
                out.print(mc.EliminarMarca());
            } catch (Exception e) {
                out.print(control.Sql);
            }
            break;
        }
        case 7: {
            /**
             * ***********Mostrar Productos************
             */
            String pr = request.getParameter("prd");
            int cont = 0;
            control.Sql = "select p.idproducto,concat(tp.tippro,' ',p.nomprod,' ',m.nommrc) Producto,"
                    + "p.prec,p.stkmin,p.stkmax "
                    + "from producto p inner join marca m on m.idmarca=p.idmarca inner join "
                    + "tipoproducto tp on tp.idtipoproducto=p.idtipoproducto where concat(tp.tippro,"
                    + "' ',p.nomprod,' ',m.nommrc) like'%" + pr + "%' order by tp.tippro;";
            out.print("<div class='widget widget-table action-table'><div class='widget-header'><h3>Lista de Marcas</h3></div>"
                    + "<div class='widget-content'><table class='table table-striped table-bordered' id='tabla1'><thead><tr>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>N°</th>"
                    + "<th style='width:50%;padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>Producto</th>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>Precio</th>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>Stock_Min</th>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>Stock_Max</th>"
                    + "<th style='width:11%; padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>"
                    + "Gestionar</th></tr></thead><tbody>");
            control.Base.st = control.Base.cnx.createStatement();
            control.Base.rs = control.Base.st.executeQuery(control.Sql);
            while (control.Base.rs.next()) {
                cont++;
                String prod = "'" + control.Base.rs.getString(1) + "','" + control.Base.rs.getString(2) + "'";
                out.println("<tr><td style='text-align:center; font-size:14px;'>" + cont + "</td>"
                        + "<td style='text-align:left; font-size:14px;'>" + control.Base.rs.getString(2)
                        + "</td><td style='text-align:center; font-size:14px;'>" + control.Base.rs.getString(3)
                        + "</td><td style='text-align:center; font-size:14px;'>" + control.Base.rs.getString(4)
                        + "</td><td style='text-align:center; font-size:14px;'>" + control.Base.rs.getString(5)
                        + "</td><td class='td-actions'><a href='javascript:;' class='btn btn-small' "
                        + " onclick='SeleccionarProducto(" + control.Base.rs.getString(1) + ")'> <img src='Imagenes/Edit.png' "
                        + "width='18px'></a><a href='javascript:;' class='btn btn-danger btn-small' onclick="
                        + "EliminarProdcuto(" + prod.trim() + ");><img src='Imagenes/cancel.png'"
                        + " width='18px'></a></td></tr>");
            }
            out.println("</tbody></table></div></div>");
            break;
        }
        case 8: {
            /**
             * **************CREAR PRODUCTO*************
             */
            try {
                Producto mc = new Producto(Integer.parseInt(request.getParameter("id")),
                        Integer.parseInt(request.getParameter("idtppr")),
                        Integer.parseInt(request.getParameter("idmr")), request.getParameter("des"),
                        Double.parseDouble(request.getParameter("pre")),
                        Integer.parseInt(request.getParameter("stmi")),
                        Integer.parseInt(request.getParameter("stma")));
                out.print(mc.CrearProducto());
            } catch (Exception e) {
                out.print(control.Sql);
            }
            break;
        }
        case 9: { //Seleccionar Producto        
            Producto prod = new Producto(Integer.parseInt(request.getParameter("idpr")),
                    0, 0, "", 0.0, 0, 0);
            String rst[] = prod.SeleccionarProducto();
            JSONObject json = new JSONObject();
            json.put("idpr", rst[0]);
            json.put("nompr", rst[1]);
            json.put("idmr", rst[2]);
            json.put("idtpp", rst[3]);
            json.put("prc", rst[4]);
            json.put("stmi", rst[5]);
            json.put("stma", rst[6]);
            out.print(json);
            out.flush();
            break;
        }
        case 10: { //Editar Producto                
            Producto prod = new Producto(Integer.parseInt(request.getParameter("idpd")),
                    Integer.parseInt(request.getParameter("idtpoprd")), Integer.parseInt(
                    request.getParameter("idmrc")), request.getParameter("prd"),
                    Double.parseDouble(request.getParameter("pre")), Integer.parseInt(
                    request.getParameter("stmn")), Integer.parseInt(request.getParameter("stmx")));

            out.print(prod.EditarProducto());
            break;
        }
        case 11: { //Devolver Marcas 
            Marca marca = new Marca(0, "");
            JSONObject objson = null;
            JSONArray arra = new JSONArray();
            control.Base.rs = marca.DevolverMarcas();
            while (control.Base.rs.next()) {
                objson = new JSONObject();
                objson.put("idmr", (String) control.Base.rs.getString(1));
                objson.put("mrc", (String) control.Base.rs.getString(2));
                arra.add(objson);
            }
            out.println(arra.toString());
            break;
        }

        case 12: {
            /**
             * ***********Mostrar Productos************
             */
            String pr = request.getParameter("prd");
            int cont = 0;
            control.Sql = "select p.idproducto,concat(tp.tippro,' ',p.nomprod,' ',m.nommrc) Producto,"
                    + "p.prec "
                    + "from producto p inner join marca m on m.idmarca=p.idmarca inner join "
                    + "tipoproducto tp on tp.idtipoproducto=p.idtipoproducto where concat(tp.tippro,"
                    + "' ',p.nomprod,' ',m.nommrc) like'%" + pr + "%' order by tp.tippro;";

            out.print("<div class='widget widget-table action-table'><div class='widget-header'><h3>Lista de Marcas</h3></div>"
                    + "<div class='widget-content'><table class='table table-striped table-bordered' id='tabla1'><thead><tr>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>N°</th>"
                    + "<th style='width:50%;padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>Producto</th>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>Precio</th>"
                    + "<th style='width:11%; padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>"
                    + "Gestionar</th></tr></thead><tbody>");

            control.Base.st = control.Base.cnx.createStatement();
            control.Base.rs = control.Base.st.executeQuery(control.Sql);
            while (control.Base.rs.next()) {
                cont++;
                String mca = "'" + control.Base.rs.getString(1) + "','" + control.Base.rs.getString(2) + "'";
                out.println("<tr><td class='c1' style='text-align:center; font-size:14px;'>" + cont + "</td>"
                        + "<td class='c2' style='text-align:left; font-size:14px;'>" + control.Base.rs.getString(2)
                        + "</td><td class='c3' style='text-align:center; font-size:14px;'>" + control.Base.rs.getString(3)
                        + "</td><td class='td-actions'><a href='javascript:;' class='btn btn-small' "
                        + "onclick=SeleccionarProducto(" + control.Base.rs.getString(1) + ")><img src='Imagenes/Edit.png' "
                        + "width='18px'></a></td></tr>");
                /*class='btn btn-danger btn-small' onclick="
          + "EliminarMarca("+mca.trim()+");><img src='Imagenes/cancel.png'"*/

            }
            out.println("</tbody></table></div></div>");
            break;
        }
        case 13: {
            out.print(control.DevolverRegistroDto("select * from proveedor "
                    + "where rucprv='" + request.getParameter("rc") + "'", 2));
        }
        case 14: {
            control.Sql = "select p.idproducto,concat(tp.tippro,' ',p.nomprod,' ',m.nommrc) Producto,"
                    + "p.prec from producto p inner join marca m on m.idmarca=p.idmarca inner join "
                    + "tipoproducto tp on tp.idtipoproducto=p.idtipoproducto where p.idproducto='"
                    + request.getParameter("idpr") + "'";

            control.Base.rs = control.DevolverRegistro(control.Sql);
            JSONObject json = new JSONObject();
            //json.put("idpr",rst[0]);json.put("nompr",rst[1]);json.put("idmr",rst[2]);
            //json.put("idtpp",rst[3]);json.put("prc",rst[4]);json.put("stmi",rst[5]);
            //json.put("stma",rst[6]);
            out.print(json);
            out.flush();
            break;
        }
        case 15: {  //Seleccionar producto ingresar
            control.Sql = "select p.idproducto,concat(tp.tippro,' ',p.nomprod,' ',m.nommrc) Producto,"
                    + "p.prec from producto p inner join marca m on m.idmarca=p.idmarca inner join "
                    + "tipoproducto tp on tp.idtipoproducto=p.idtipoproducto where p.idproducto='"
                    + request.getParameter("idpr") + "' order by tp.tippro;";
            try {
                control.Base.rs = control.DevolverRegistro(control.Sql);
                if (control.Base.rs.next()) {
                    JSONObject json = new JSONObject();
                    json.put("idpr", control.Base.rs.getString(1));
                    json.put("nompr", control.Base.rs.getString(2));
                    json.put("prc", control.Base.rs.getString(3));
                    out.print(json);
                    out.flush();
                }
            } catch (Exception e) {
            }
            break;
        }

    }
%> 


