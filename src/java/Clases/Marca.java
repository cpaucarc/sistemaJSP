/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.ResultSet;

/**
 *
 * @author User
 */
public class Marca {

    public int idmrc;
    public String mrc;
    public Controlador cntrl = new Controlador();

    public Marca(int id, String mr) {
        this.idmrc = id;
        this.mrc = mr;
    }

    public String CrearMarca() {
        String rs = "";
        try {
            if (cntrl.VerificaConsulta("Select * from marca where nommrc='" + mrc + "'")) {
                rs = "La Marca: " + mrc + " Ya Existe";
            } else {
                cntrl.CrearRegistro("insert into marca(nommrc) values('" + mrc + "')");
                rs = "Se creo la marca correctamente";
            }
        } catch (Exception e) {
        }
        return rs;
    }

    public String EditarMarca() {
        String r = "";
        try {
            if (cntrl.VerificaConsulta("select * from marca where nommrc'" + mrc
                    + "' and idmarca<>'" + idmrc + "'")) {
                r = "La Marca: " + mrc + " Se puede Repetir";
            } else {
                cntrl.EditarRegistro("update marca set nommrc='" + mrc + "' where idmarca='" + idmrc + "'");
                r = "Editado";
            }
        } catch (Exception e) {
        }
        return r;
    }

    public String EliminarMarca() {
        String rs = "";
        try {
            cntrl.Sql = "select * from producto where idmarca='" + idmrc + "'";
            if (cntrl.VerificaConsulta(cntrl.Sql)) {
                rs = "No se puede eliminar la Marca: " + mrc + " Primero Elimina sus Productos";
            } else {
                cntrl.CrearRegistro("delete from marca where idmarca='" + idmrc + "'");
                rs = "Eliminado";
            }
        } catch (Exception e) {
        }
        return rs;
    }

    public String MostrarMarca() {
        String rst = "";
        int cont = 0;
        try {
            cntrl.Sql = "Select * from marca where nommrc like'%" + this.mrc + "%'";
            rst = "<div class='widget widget-table action-table'><div class='widget-header'>"
                    + "<h3>Lista de Marcas</h3></div><div class='widget-content'><table class='table"
                    + " table-striped table-bordered' id='tabla1'><thead><tr><th style='padding:4px; "
                    + "text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>N°</th>"
                    + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid"
                    + " #dddddd;'>Marca</th><th style='width:11%; padding:4px; text-align:center; "
                    + "font-size:14px; border-top: 1px solid #dddddd;'>Gestionar</th></tr></thead><tbody>";
            cntrl.Base.st = cntrl.Base.cnx.createStatement();
            cntrl.Base.rs = cntrl.Base.st.executeQuery(cntrl.Sql);

            while (cntrl.Base.rs.next()) {
                cont++;
                rst = rst + "<tr><td style='text-align:center; font-size:14px;'>" + cont + "</td>"
                        + "<td style='text-align:center; font-size:14px;'>" + cntrl.Base.rs.getString(2)
                        + "</td><td class='td-actions'><a href='javascript:;' class='btn btn-small' onclick='editU("
                        + cntrl.Base.rs.getString(1) + ")'><img src='Imagenes/Edit.png' width='18px'></a><a href="
                        + "'javascript:;' class='btn btn-danger btn-small' onclick='EliminarMarca("
                        + cntrl.Base.rs.getString(1) + "," + cntrl.Base.rs.getString(2) + ")'><img src='Imagenes/cancel.png'"
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
        return cntrl.DevolverRegistro("select * from marca");
    }
}
