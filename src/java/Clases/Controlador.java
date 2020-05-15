/**** To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 ****/

package Clases;

import com.toedter.calendar.*;import java.sql.ResultSet;
import javax.swing.*;import javax.swing.table.*;
import javax.xml.crypto.Data;import java.util.*;import java.text.*;
import javax.servlet.jsp.JspWriter;
import javax.swing.text.*;
/******************************** @author User ********************************/
public class Controlador {
 /**********************************ATRIBUTOS******************************************/   
 public String[] Data=new String[30];public String Sql="";public int Fila=0;public boolean bandera=false;
 public static String dtogeneral="";public IMPRIMIR impresor=new IMPRIMIR();
 public Conexion Base=new Conexion();public static int cta=0;
 public static String dateando="";
 /**********************************ATRIBUTOS*******************************************/   
 
 /***************************************METODOS****************************************/    
 public void AccesoAlSistema(){     
 }
 public void CrearRegistro(String cst){
  try{Base.st=Base.cnx.createStatement();Base.st.executeUpdate(cst);}catch(Exception e){}
 }
 public void EjecutarConsulta(String cst){
  try{Base.st=Base.cnx.createStatement();Base.st.executeUpdate(cst);}   catch(Exception e){}
 }
 public String Ejecuta_Devuelve_Dato(String cst,int colm){
  String rst="";
  try{
   Base.st=Base.cnx.createStatement();
   Base.rs=Base.st.executeQuery(cst);
   Base.rs.next();rst=Base.rs.getString(colm);
  }   
  catch(Exception e){}
  return rst;
 }
 public String Fecha() {
        String fec = "";
        try {Base.st = Base.cnx.createStatement();Base.rs = Base.st.executeQuery("select curdate();");
            if (Base.rs.next()) {fec = Base.rs.getString(1);}
        } catch (Exception e) {}return fec;
    }

    public String Hora() {
        String hra = "";
        try {Base.st = Base.cnx.createStatement();Base.rs = Base.st.executeQuery("select curtime()");
            if (Base.rs.next()) {hra = Base.rs.getString(1);}
        } catch (Exception e) {}return hra;
    }
 public void hideTableColumn(JTable table, int... indexs) {
  for (int j : indexs) {
   table.getColumnModel().getColumn(j).setMinWidth(0);
   table.getColumnModel().getColumn(j).setPreferredWidth(0);
   table.getColumnModel().getColumn(j).setWidth(0);
   table.getColumnModel().getColumn(j).setMaxWidth(-1);
   }
  }
 public void LimpiarModelo(DefaultTableModel mdl){
  while(mdl.getRowCount()>0)
   mdl.removeRow(0);     
 }
 public void llenarComboweb(String cns,String nmcb,JspWriter o,int cln){
     try{ Base.st=Base.cnx.createStatement();Base.rs=Base.st.executeQuery(cns);
      o.println("<select class='mdb-select md-form' name='"+nmcb+"' id='"+nmcb+"'>");
         while (Base.rs.next()) {
          o.println("<option value='"+Base.rs.getString(cln-1)+"'>"+Base.rs.getString(cln)+"</option>");       
         }
      o.println("</select>");      
      o.println("<script>document.getElementById('"+nmcb+"').selectedIndex=-1;</script>");
     }  
     catch(Exception e){}
    }
 public void LlenarCombo(JComboBox cbo,String cst,int cln){
  cbo.removeAllItems();
  try{
   Base.st=Base.cnx.createStatement();Base.rs=Base.st.executeQuery(cst);
   while(Base.rs.next()){
    cbo.addItem(Base.rs.getString(cln));
   }    
   cbo.setSelectedIndex(-1);
  }
  catch(Exception e){}  
 } 
 public void LlenarJTable(String cst,DefaultTableModel mdl,int cntcln){
  LimpiarModelo(mdl);
  try{
   Base.st=Base.cnx.createStatement();Base.rs=Base.st.executeQuery(cst);
   while(Base.rs.next()){
    for(int c=1;c<=cntcln;c++)
     Data[c-1]=Base.rs.getString(c);    
    mdl.addRow(Data);
   }
  }   
  catch(Exception e){}
 }
 public void BarraPrincipal(JspWriter ot){
     try {
      ot.print("<div class='navbar navbar-fixed-top'><div class='navbar-inner' style='height: auto;'>"
      + "<div class='container'><a class='btn btn-navbar' data-toggle='collapse' data-target="
      + "'.nav-collapse'><span class='icon-bar'></span><span class='icon-bar'></span><span class"
      + "='icon-bar'></span></a>"
      + "<a class='brand' href='MenuPrincipal.jsp' style='padding: 0px;'>"
        + "<img src='Imagenes/Computer.png' alt='Computadora' style='width: 32px;'> Sistema de Ventas"
      + "</a><br>"
      + "<div class='nav-collapse'>"
              + "<ul class='nav pull-right'><li class='dropdown'>"
      + "<a href='#' class='dropdown-toggle' data-toggle='dropdown'><img src='Imagenes/user_add.png'>"
      + "Usuario: "+Controlador.dateando+"<b class='caret'></b></a><ul class='dropdown-menu'><li><a "
      + "href='Miperfil.jsp'>Perfil</a></li><li><a href='#' onclick='window.parent.close();'>Cerrando"
      + "</a></li></ul></li></ul></div></div></div></div>");         
     } catch (Exception e) { }   
 }
 public ResultSet DevolverRegistro(String sq) {
        try {
            Base.st = Base.cnx.createStatement();
            Base.rs = Base.st.executeQuery(sq);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Base.rs;
    }
 public void BarradeMenu(JspWriter ot){
   try{
     ot.print("<div class='subnavbar'><div class='subnavbar-inner'><div class='container'>"
     + "<ul class='main-nav'>"
        + "<li><a href='MenuPrincipal.jsp'><br><img src='Imagenes/Info.png'>"
        + "<span>Inicio</span></a></li><li class='dropdown active'><a href='javascript:;'target"
        + "='_blank' class='dropdown-toggle' data-toggle='dropdown'><br><img src='Imagenes/Box.png'>"
        + "<span>Tablas Base</span></a><ul class='dropdown-menu' style='background-color: #a6e1ec'>"
        + "<li style='color: red'><a href='Marcas.jsp'> Marcas</a></li><li><a href='TipoProductos.jsp'>Tipo "
        + "Producto</a></li><li><a href='Productos.jsp'>Producto</a></li></ul></li>"
        
        +"<li class='dropdown active'><a href='javascript:;'target"
        + "='_blank' class='dropdown-toggle' data-toggle='dropdown'><br><img src='Imagenes/Clientes.png'>"
        + "<span>Procesos</span></a><ul class='dropdown-menu' style='background-color: #a6e1ec'>"
        + "<li style='color: red'><a href='IngresoProductos.jsp'> Ingreso Productos</a></li><li><a href='#'>Venta "
        + "de Producto</a></li><li><a href='#'>Anular Comprobantes</a></li></ul></li>" 
                          
        + "<li class='dropdown active'><a href='javascript:;' class='dropdown-toggle' "
        + "data-toggle='dropdown'><br><img src='Imagenes/Print.png'><span>Los Reportes</span>"
        + "</a><ul class='dropdown-menu' style='background-color: #a6e1ec'><li style='color: "
        + "red'><a href='ReporMarcas.jsp' target=_blank> Reporte de Marcas</a></li><li><a href='#'>Reporte"
        + " Tipo Producto</a></li><li><a href='ReporProductos.jsp' target=_blank>Reporte Producto</a></li></ul></li>"
      + "</ul>"
     + "</div></div></div>");
   }
   catch(Exception e){}
 }
 
 public Date Cadena_a_Fecha(String f){  
  Date d=null;SimpleDateFormat df=new SimpleDateFormat("yy-mm-dd");
  try{
   d=df.parse(f);
  }
  catch(Exception e){   }     
  return d;
 }
 public void EditarRegistro(String sql) {
   try {Base.st = Base.cnx.createStatement();Base.st.executeUpdate(sql);} 
   catch (Exception e) {e.printStackTrace();}
 }
 public void LlenarJTableposfec(String cst,DefaultTableModel mdl,int cntcln,int pf){
  LimpiarModelo(mdl);
  try{
   Base.st=Base.cnx.createStatement();Base.rs=Base.st.executeQuery(cst);
   while(Base.rs.next()){
    for(int c=1;c<=cntcln;c++){
     if(c-1==pf)     
      Data[c-1]=Formato_DMA(Cadena_a_Fecha(Base.rs.getString(c)));            
     else
      Data[c-1]=Base.rs.getString(c);          
    }     
    mdl.addRow(Data);
   }
  }   
  catch(Exception e){}
 }
 public void Marcar(JTextField tx){
  tx.setSelectionStart(0);tx.setSelectionEnd(tx.getText().length());
  tx.grabFocus();
 }
 public void setWidthTableColumn(JTable table, int width, int... indexs) {
  for (int j : indexs) {
   table.getColumnModel().getColumn(j).setWidth(width);
   table.getColumnModel().getColumn(j).setPreferredWidth(width);
  }
 }
 public void Proconparametro(String llproc,int[] dts,int clnrec){
  /*try{
   Base.pr=Base.cnx.prepareStatement(llproc);   
   for (int j=0;j<dts.length;j++) {
    Base.pr.setInt(j+1, dts[j]);    
   }
   Base.rt= Base.pr.executeQuery();
   while(Base.rt.next()){
    dtogeneral=Base.rt.getString(clnrec);
   }
  }   
  catch(Exception e){}*/
 }
 public void Proconparametrocdn(String llproc,String[] dts,int clnrec){
  /*try{
   Base.pr=Base.conec.prepareStatement(llproc);   
   for (int j=0;j<dts.length;j++) {
    Base.pr.setString(j+1, dts[j]);    
   }
   Base.rt= Base.pr.executeQuery();
   while(Base.rt.next()){
    dtogeneral=Base.rt.getString(clnrec);
   }
  }   
  catch(Exception e){}*/
 }
 public boolean UsuariAutorizado(String us){
   boolean b=true;
   Sql="select * from usuario where nomusr='"+us+"'";
   
   return  b;
 }
 public boolean VerificaConsulta(String cst){  
  try{
   Base.st=Base.cnx.createStatement();
   Base.rs= Base.st.executeQuery(cst);
   bandera=Base.rs.next();
  }
  catch(Exception e){}
  return bandera;
 }
 public void Volvertxt(JTextField tx){
  if(tx.getText().trim().length()==0)
    tx.grabFocus();
 }
 public String Formato_Amd(java.util.Date v1) {
  Date fecha1 = v1;
  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
  String fecha = df.format(fecha1);
  return fecha;
 }
 public String Formato_DMA(java.util.Date v1) {
  Date fecha1 = v1;
  SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
  String fecha = df.format(fecha1);
  return fecha;
}
 public void PonerFechaenDateChooser(JDateChooser fecha, String fec) {
  ((JTextComponent) fecha.getDateEditor().getUiComponent()).setText(fec);
 }
 
 public void LlenaMarca(JspWriter ot, String cst){
     try {
         int cont = 0;
         ot.print("<div class='widget widget-table action-table'><div class='widget-header'><h3>Lista de Marcas</h3></div>"
                 + "<div class='widget-content'><table class='table table-striped table-bordered' id='tabla1'><thead><tr>"
                 + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>N°</th>"
                 + "<th style='padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>Marca</th>"
                 + "<th style='width:11%; padding:4px; text-align:center; font-size:14px; border-top: 1px solid #dddddd;'>"
                 + "Gestionar</th></tr></thead><tbody>");
         Base.st = Base.cnx.createStatement();
         Base.rs = Base.st.executeQuery(cst);
         while (Base.rs.next()) {
             cont++;
             ot.println("<tr><td style='text-align:center; font-size:14px;'>" + cont + "</td>"
                     + "<td style='text-align:center; font-size:14px;'>" + Base.rs.getString(2)
                     + "</td><td class='td-actions'><a href='javascript:;' class='btn btn-small' onclick='editU("
                     + Base.rs.getString(1) + ") <i class='btn-icon-only icon-cog'> </i></a></td></tr>");
         }
         ot.println("</tbody></table></div></div>");
     } catch (Exception e) {
     }
 }
 
 public void MostrarTablaHTML(JspWriter ot){
        try{ Sql="select * from marca"; Base.st=Base.cnx.createStatement();    
               Base.rs=Base.st.executeQuery(Sql);ot.print("<div class='table-responsive'>"
               + "<table id='tbmrc' style='position: absolute;"+ " left: 608px;top:160px; border: solid; 1px'>"       
                + "<thead style='background-color: royalblue;color: white;font-weight: bold'><th width=80>Id</th><th width=260>"
               + "Marca</th></thead><tbody style='background-color: yellow;color: blue;font-weight: bold'>");
               while(Base.rs.next()){
                 ot.print("<tr data-valor='"+Base.rs.getString(1)+"' class='click1' onclick=function(){Seleccion(this)><td>"
                   +Base.rs.getString(1)+"</td><td>"+Base.rs.getString(2)+"</td></tr>");   
               }
               ot.print("</tbody></table></div>");
        }  
        catch(Exception e){}
      }
 public String DevolverRegistroDto(String sq, int pos) {
        String rst = "";
        try {Base.st = Base.cnx.createStatement();Base.rs = Base.st.executeQuery(sq);
            if (Base.rs.next()) {rst = Base.rs.getString(pos);}
        } catch (Exception e) {e.printStackTrace();}
        return rst;
    }
 /**********************************METODOS*************************************/   
}
