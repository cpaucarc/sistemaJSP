
package Clases;

public class Ventas {
    
    String precio;
    String cant;
    String prod;
    String idcomp;
    public Controlador cntrl = new Controlador();

    public Ventas(String prod, String precio, String cant, String idcomp) {
        this.precio = precio;
        this.cant = cant;
        this.prod = prod;
        this.idcomp = idcomp;
    }
    
    
    public void comprar(){
        try {
            cntrl.CrearRegistro("insert into detalleventa values(null," + cant + "," + precio 
                    + ", (select idproducto from producto where nomprod = '" + prod + "'), "+idcomp+")");
        } catch (Exception e) {
        }
    }
    
    
    
    
    
}
