/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author User
 */

public class Proveedor {
 /*******************ATRIBUTOS**********************************/    
  int idproveedor; String nomprv="", rucprv,dirprv, tlfprv;  
  Controlador ctrl=new Controlador();
 /*************************ATRIBUTOS****************************/    
    
 /*********************METODOS***********************************/
  public Proveedor(int idprv,String nmpv, String rcpv,String drpv, String tfpv){
    this.idproveedor=idprv;this.nomprv=nmpv;this.rucprv=rcpv;
    this.dirprv=drpv;this.tlfprv=tfpv;
  }
  public String DevolverProveedorxruc(){
   return ctrl.DevolverRegistroDto("select * from proveedor where rucprv='"+rucprv+"'", 2);
  }
 /*********************METODOS***********************************/
}
