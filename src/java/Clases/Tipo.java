package Clases;

import java.sql.ResultSet;

public class Tipo {
    
    public int idtipo;
    public String tipo;
    public Controlador control = new Controlador();

    public Tipo(int idtipo, String tipo) {
        this.idtipo = idtipo;
        this.tipo = tipo;
    }
    
    
    public String CrearTipo() {
        String rs = "";
        try {
            if (control.VerificaConsulta("select * from tipoproducto where tippro = '" + tipo + "'")) {
                rs = "El tipo de producto '" + tipo + "' ya existe";
            } else {
                control.CrearRegistro("insert into tipoproducto(tippro) values('" + tipo + "')");
                rs = "Se creo el tipo de producto correctamente";
            }
        } catch (Exception e) {
        }
        return rs;
    }

    public String EditarTipo() {
        String r = "";
        try {
            if (control.VerificaConsulta("select * from tipoproducto where tippro = '" + tipo + "'")) {
                r = "El tipo de producto '" + tipo + "' no se puede repetir";
            } else {
                control.EditarRegistro("update tipoproducto set tippro='" + tipo + "' where idtipoproducto='" + idtipo + "'");
                r = "Editado";
            }
        } catch (Exception e) {
        }
        return r;
    }

    public String EliminarTipo() {
        String rs = "";
        try {
            control.Sql = "select * from producto where idtipoproducto='" + idtipo + "'";
            if (control.VerificaConsulta(control.Sql)) {
                rs = "No se puede eliminar el tipo de producto: " + tipo + ", Primero Elimina sus Productos";
            } else {
                control.CrearRegistro("delete from tipoproducto where idtipoproducto='" + idtipo + "'");
                rs = "Eliminado";
            }
        } catch (Exception e) {
        }
        return rs;
    }

    public String MostrarTipo() {
        String rst = "";
        int cont = 0;
        try {
            control.Sql = "Select * from tipoproducto where tippro like'%" + this.tipo + "%'";
            
            rst = "<div class='widget widget-table action-table'><div class='widget-header'>"
                    + "<h3>Lista de Tipos de Productos</h3>"
                    + "</div>"
                    + "<div class='widget-content'><table class='table"
                    + " table-striped table-bordered' id='tabla1'><thead><tr>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>N°</th>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>Tipo de Producto</th>"
                    + "<th style='width:11%; padding:4px; text-align:center; "
                    + "font-size:14px; border-top: 1px solid #dddddd;'>Gestionar</th></tr></thead><tbody>";
            control.Base.st = control.Base.cnx.createStatement();
            control.Base.rs = control.Base.st.executeQuery(control.Sql);

            while (control.Base.rs.next()) {
                cont++;
                rst = rst + "<tr>"
                        + "<td style='text-align:center; font-size:14px;'>" + cont + "</td>"
                        + "<td style='text-align:center; font-size:14px;'>" + control.Base.rs.getString(2)+ "</td>"
                        + "<td class='td-actions'><a href='javascript:;' class='btn btn-small' onclick='editU("
                        + control.Base.rs.getString(1) + ")'><img src='Imagenes/Edit.png' width='18px'></a><a href="
                        + "'javascript:;' class='btn btn-danger btn-small' onclick='Eliminar("
                        + control.Base.rs.getString(1) + "," + control.Base.rs.getString(2) + ")'><img src='Imagenes/cancel.png'"
                        + " width='18px'></a></td></tr>";
            }
            rst = rst + "</tbody></table></div></div>";

            /*<a href='javascript:;' class='btn btn-danger btn-small' "
          + "onclick='EliminarMarca("+control.Base.rs.getString(1)+","+control.Base.rs.getString(2)
          +")'><img src='Imagenes/cancel.png' width='18px'></a></td></tr>");           
        }
        out.println("</tbody></table></div></div>");*/
        } catch (Exception e) {
        }
        return rst.trim();
    }

    public ResultSet DevolverMarcas() {
        return control.DevolverRegistro("select * from marca");
    }
    
    
}
