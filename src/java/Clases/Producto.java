/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class Producto {
  public int idprod,idmrc,idtpoprd,stmin,stmax;public String desc;public double prec;  
  public Controlador cntrl=new Controlador();    
  
  
  public Producto(int idprd,int idtpopd,int idmr,String dscpd,double prc,int stmn,int stmx){
   this.idprod=idprd;this.idmrc=idmr;this.idtpoprd=idtpopd;  
   this.desc=dscpd;this.prec=prc;this.stmin=stmn;this.stmax=stmx;
  }
  public String CrearProducto(){
   String rs = "";   
   try {       
    cntrl.Sql="insert into producto(nomprod, idmarca, idtipoproducto, prec, stkmin, stkmax)"
    + " values('"+desc+"',"+idmrc+","+idtpoprd+","+prec+","+stmin+","+stmax+")";               
    cntrl.CrearRegistro(cntrl.Sql);rs="correcto";   
   } catch (Exception e) {}  
   return rs;
  }
  public String EditarProducto(){
   String rs = "";   
   try {       
    cntrl.Sql="select * from producto where nomprod='"+desc+"' and idmarca="+idmrc
    +" and idtipoproducto="+idtpoprd+" and idproducto<>"+idprod;    
    if(cntrl.VerificaConsulta(cntrl.Sql)){
     rs="El producto ya existe";   
    }
    else{
     cntrl.Sql="update producto set nomprod='"+desc+"',idmarca="+idmrc+","
     + "idtipoproducto="+idtpoprd+",prec="+prec+",stkmin="+stmin+",stkmax="
     +stmax+" where idproducto="+idprod;
     cntrl.EditarRegistro(cntrl.Sql);
     rs="Editado";       
    }    
   } catch (Exception e) {}  
   return rs;
  }
  public String[] SeleccionarProducto(){
       String Dt[]=new String [10];         
        try {            
         cntrl.Sql="select * from producto where idproducto="+idprod;   
         cntrl.Base.st= cntrl.Base.cnx.createStatement();
         cntrl.Base.rs= cntrl.Base.st.executeQuery(cntrl.Sql);
         while(cntrl.Base.rs.next()){
          for(int i=1;i<=7;i++){
           Dt[i-1]=cntrl.Base.rs.getString(i);
          }    
         }
        } catch (Exception e) {}
        return Dt;
    }
  
//  public String[] SeleccionarProductoIngrs(){
//       String Dt[]=new String [10];         
//        try {            
//         cntrl.Sql="select * from producto where idproducto="+idprod;   
//         cntrl.Base.st= cntrl.Base.cnx.createStatement();
//         cntrl.Base.rs= cntrl.Base.st.executeQuery(cntrl.Sql);
//         while(cntrl.Base.rs.next()){
//          for(int i=1;i<=7;i++){
//           Dt[i-1]=cntrl.Base.rs.getString(i);
//          }    
//         }
//        } catch (Exception e) {}
//        return Dt;
//    }
}
