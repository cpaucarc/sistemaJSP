package Clases;
/***** @author Usuario *********/
import java.net.URL;import java.util.*;
import javax.print.DocFlavor;import javax.swing.*;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.view.JasperViewer;
import net.sf.jasperreports.*;
import net.sf.jasperreports.engine.util.JRLoader;
public class IMPRIMIR {
 public String rta1 = "";public String rta = "";public int ctdpgns = 0;
 //InfoGeneral info= new InfoGeneral();
    ConexionFichero cconn= new ConexionFichero();
 private static final String REPORTS_PATH = System.getProperty("user.dir") + "/src/Reportes/";
 
 public void ImprimirsinParametros(String Titu,String NRpt) {
  try {
       Map parame = new HashMap();
       rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt
       +".jasper";parame.put("","");      
       JasperPrint prt = JasperFillManager.fillReport(rta,parame,cconn.conec);
       int n = prt.getPages().size();                 
       if (n > 0) {
        if(JOptionPane.showConfirmDialog(null,"Deseas Previsualizar primero","Confirmar"
         ,0)==0){
         JasperViewer JsperView = new JasperViewer(prt, false);  
         JsperView.setTitle(Titu);
         JsperView.setExtendedState(6);
         JsperView.show();
        }   
        else       
         net.sf.jasperreports.engine.JasperPrintManager.printReport(prt, false);                      
       } 
       else 
       JOptionPane.showMessageDialog(null, "No hay datos");      
      } 
      catch (Exception E) {}      
 }
 
 public void Imprimircon1Parametro(String Titu,String NRpt,String prm1,
         String vlrprm1) {
  try {
       Map parame = new HashMap();
       rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt
       +".jasper";parame.put(prm1,vlrprm1);      
       JasperPrint prt = JasperFillManager.fillReport(rta,parame,cconn.conec);
       int n = prt.getPages().size();                 
       if (n > 0) {
        if(JOptionPane.showConfirmDialog(null,"Deseas Previsualizar primero","Confirmar"
         ,0)==0){
         JasperViewer JsperView = new JasperViewer(prt, false);  
         JsperView.setTitle(Titu);
         JsperView.setExtendedState(6);
         JsperView.show();
        }   
        else       
         net.sf.jasperreports.engine.JasperPrintManager.printReport(prt, false);                      
       } 
       else 
       JOptionPane.showMessageDialog(null, "No hay datos");      
      } 
      catch (Exception E) {}      
 }
 public void Imprimircon3Parametros(String Titu,String NRpt,String prm1,
         String vlrprm1,String prm2,String vlrprm2,String prm3,
         String vlrprm3) {
  try {
       Map parame = new HashMap();
       rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt
       +".jasper";parame.put(prm1,vlrprm1);      
       parame.put(prm2,vlrprm2);      
       parame.put(prm3,vlrprm3);      
       JasperPrint prt = JasperFillManager.fillReport(rta,parame,cconn.conec);
       int n = prt.getPages().size();                 
       if (n > 0) {
        if(JOptionPane.showConfirmDialog(null,"Deseas Previsualizar primero","Confirmar"
         ,0)==0){
         JasperViewer JsperView = new JasperViewer(prt, false);  
         JsperView.setTitle(Titu);
         JsperView.setExtendedState(6);
         JsperView.show();
        }   
        else       
         net.sf.jasperreports.engine.JasperPrintManager.printReport(prt, false);                      
       } 
       else 
       JOptionPane.showMessageDialog(null, "No hay datos");      
      } 
      catch (Exception E) {}      
 }
 
 public void ImpresionFacturaProductos(String para1, String vlrpar1, String para2, String vlrpar2,
 String para3, String vlrpar3, String para4, String vlrpar4, String para5, String vlrpar5, String para6,
 String vlrpar6, String para7, String vlrpar7, String para8, String vlrpar8, String para9, String vlrpar9,
 String para10, String vlrpar10, String para11, String vlrpar11, String para12, String vlrpar12, String NRpt,
 String vlm1,String vlm2) {        
  try {
   Map parame = new HashMap();
   rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt 
   + ".jasper";parame.put("SUBREPORT_DIR", REPORTS_PATH);parame.put(para1, vlrpar1);
   parame.put(para2, vlrpar2);parame.put(para3, vlrpar3);
   parame.put(para4, vlrpar4);parame.put(para5, vlrpar5);
   parame.put(para6, vlrpar6);parame.put(para7, vlrpar7);
   parame.put(para8, vlrpar8);parame.put(para9, vlrpar9);
   parame.put(para10, vlrpar10);parame.put(para11, vlrpar11);
   parame.put(para12, vlrpar12);
   parame.put("lmt1", vlm1);parame.put("lmt2", vlm2);
   JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
   int n = prt.getPages().size();
   if (n > 0) {
    JasperViewer JsperView = new JasperViewer(prt, false);
    JsperView.setTitle("Comprobantes de venta");
    JsperView.setExtendedState(6);JsperView.show();
   }
   else {
    JOptionPane.showMessageDialog(null, "No hay datos para mostrar", "Report", JOptionPane.INFORMATION_MESSAGE);
   }
  }
  catch (Exception E) {
   JOptionPane.showMessageDialog(null, E.getMessage());
   E.printStackTrace();
  }
 }
 public void ImpresionBoletaProductos(String para1, String vlrpar1, String para2, String vlrpar2,
 String para3, String vlrpar3, String para4, String vlrpar4, String para5, String vlrpar5, String para6,
 String vlrpar6, String para7, String vlrpar7, String NRpt, String para8, String vlrpar8) {
  try {
   Map parame = new HashMap();
   rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt 
   + ".jasper";parame.put(para1, vlrpar1);parame.put(para2, vlrpar2);
   parame.put(para3, vlrpar3);parame.put(para4, vlrpar4);
   parame.put(para5, vlrpar5);parame.put(para6, vlrpar6);
   parame.put(para7, vlrpar7);parame.put(para8, vlrpar8);
   //System.out.println(para8+" var - val"+vlrpar8);
   JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
   int n = prt.getPages().size();
   if (n > 0) {
    JasperViewer JsperView = new JasperViewer(prt, false);
    JsperView.setTitle("Reporte de Boleta");
    JsperView.setExtendedState(6);JsperView.show();
   }
   else {
    JOptionPane.showMessageDialog(null, "No hay datos");
   }
  }
  catch (Exception E) {
   JOptionPane.showMessageDialog(null, E);
   E.printStackTrace();
  }
 }
 public void Imprimircon4Parametros(String Titu,String NRpt,String prm1,String prm2,
  String prm3,String prm4,String vlr1,String vlr2,String vlr3,String vlr4) {
  try {
       Map parame = new HashMap();
       rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt
       +".jasper";parame.put(prm1, vlr1);parame.put(prm2, vlr2);
       parame.put(prm3, vlr3);parame.put(prm4, vlr4);
       
       JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
       int n = prt.getPages().size();                 
       if (n > 0) {
        if(JOptionPane.showConfirmDialog(null,"Deseas Previsualizar primero","Confirmar"
         ,0)==0){
         JasperViewer JsperView = new JasperViewer(prt, false);  
         JsperView.setTitle(Titu);JsperView.setExtendedState(6);JsperView.show();
        }   
        else       
         net.sf.jasperreports.engine.JasperPrintManager.printReport(prt, false);                      
       } 
       else 
       JOptionPane.showMessageDialog(null, "No hay datos");      
      } 
      catch (Exception E) {}      
 }
 public void Imprimircon5Parametros(String Titu,String NRpt,String prm1,String prm2,
  String prm3,String prm4,String prm5,String vlr1,String vlr2,String vlr3,String vlr4
  ,String vlr5) {
  try {
       Map parame = new HashMap();
       rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt
       +".jasper";parame.put(prm1, vlr1);parame.put(prm2, vlr2);
       parame.put(prm3, vlr3);parame.put(prm4, vlr4);parame.put(prm5, vlr5);       
       JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
       int n = prt.getPages().size();                 
       if (n > 0) {
        if(JOptionPane.showConfirmDialog(null,"Deseas Previsualizar primero","Confirmar"
         ,0)==0){
         JasperViewer JsperView = new JasperViewer(prt, false);  
         JsperView.setTitle(Titu);JsperView.setExtendedState(6);JsperView.show();
        }   
        else       
         net.sf.jasperreports.engine.JasperPrintManager.printReport(prt, false);                      
       } 
       else 
       JOptionPane.showMessageDialog(null, "No hay datos");      
      } 
      catch (Exception E) {}      
 }
 public void ImprimirCotizacion(String Titu,String NRpt,String prm1,String prm2,
 String vlr1,String vlr2,String igv,String mto) {
  try {
      Map parame = new HashMap();rta = System.getProperties().getProperty("user.dir") 
      + "/src/Reportes/" + NRpt + ".jasper";parame.put(prm1, vlr1);parame.put(prm2, vlr2);
      parame.put("igv", igv);parame.put("subtotal", mto);
      JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
      int n = prt.getPages().size();
      if (n > 0) {
       JasperViewer JsperView = new JasperViewer(prt, false);
       JsperView.setTitle(Titu);JsperView.setExtendedState(6);JsperView.show();
      }
      else 
       JOptionPane.showMessageDialog(null, "No hay datos");      
     }
     catch (Exception E) {JOptionPane.showMessageDialog(null, E);}
    }
    
    public void ImprimirCotizacion(String Titu,String NRpt,String prm1,String prm2,String vlr1,String vlr2) {
     try {
      Map parame = new HashMap();rta = System.getProperties().getProperty("user.dir") 
      + "/src/Reportes/" + NRpt + ".jasper";parame.put(prm1, vlr1);parame.put(prm2, vlr2);
      JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
      int n = prt.getPages().size();
      if (n > 0) {
       JasperViewer JsperView = new JasperViewer(prt, false);
       JsperView.setTitle(Titu);JsperView.setExtendedState(6);JsperView.show();
      }
      else {
       JOptionPane.showMessageDialog(null, "No hay datos");
      }
     }
     catch (Exception E) {}
    }
    public void Impresion(String prmcd, String prmnom, String NRpt) {
        try {
            Map parame = new HashMap();
            rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt + ".jasper";
            parame.put("FAC", prmcd);
            parame.put("NMFAC", prmnom);
            JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
            int n = prt.getPages().size();
            if (n > 0) {
                JasperViewer JsperView = new JasperViewer(prt, false);
                JsperView.setTitle("Reporte de Facultades");
                JsperView.setExtendedState(6);
                JsperView.show();
            } else {
                JOptionPane.showMessageDialog(null, "No hay datos");
            }
        } catch (Exception E) {
        }
    }

    public void ImpresionDetalleAlojamiento(String pr1, String pr2, String pr3, String pr4, String pr5, String NRpt) {
        try {
            Map parame = new HashMap();
            rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt + ".jasper";
            parame.put("p_alojamiento", pr1);
            parame.put("p_dias", pr2);
            parame.put("p_precio", pr3);
            parame.put("p_totalalojamiento", pr4);
            parame.put("total_pagar", pr5);
            JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
            int n = prt.getPages().size();
            if (n > 0) {
                JasperViewer JsperView = new JasperViewer(prt, false);
                JsperView.setTitle("Reporte de Facultades");
                JsperView.setExtendedState(6);
                JsperView.show();
            } else {
                JOptionPane.showMessageDialog(null, "No hay datos");
            }
        } catch (Exception E) {
        }
    }
    public void imprimir(String nombrerep,String titulo,Map m){
        try {
        rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + nombrerep+".jasper";
        JasperPrint prt = JasperFillManager.fillReport(rta, m, cconn.conec);
            int n = prt.getPages().size();
            if (n > 0) {
                JasperViewer JsperView = new JasperViewer(prt, false);
                JsperView.setTitle(titulo);
                JsperView.setExtendedState(6);
                JsperView.show();
            } else {
                JOptionPane.showMessageDialog(null, "No hay datos");
            }
        } catch (Exception E) {
            E.printStackTrace();
        }
    }
public void Impresionprueba(String Nomrep, String Titulo, String prm,String vlrparm, String prm1,String vlrparm1) {
        try {
            Map parame = new HashMap();
            rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + Nomrep+".jasper";
            parame.put(prm,vlrparm); parame.put(prm1,vlrparm1);
            JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
            int n = prt.getPages().size();
            if (n > 0) {
                JasperViewer JsperView = new JasperViewer(prt, false);
                JsperView.setTitle(Titulo);
                JsperView.setExtendedState(6);
                JsperView.show();
            } else {
                JOptionPane.showMessageDialog(null, "No hay datos");
            }
        } catch (Exception E) {
            E.printStackTrace();
        }
    }
    
    public void ImprInveInixSede(String Nomrep, String Titulo, String Sede) {
        try {
            Map parame = new HashMap();
            rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + Nomrep;
            parame.put("Sede", Sede);
            JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
            int n = prt.getPages().size();
            if (n > 0) {
                JasperViewer JsperView = new JasperViewer(prt, false);
                JsperView.setTitle(Titulo);
                JsperView.setExtendedState(6);
                JsperView.show();
            } else {
                JOptionPane.showMessageDialog(null, "No hay datos");
            }
        } catch (Exception E) {
            E.printStackTrace();
        }
    }
    public void ImprGeneral(String Nomrep, String Titulo) {
     try {
      Map parame = new HashMap();
      rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + Nomrep+".jasper";
      parame.put("", "");
      JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
      int n = prt.getPages().size();
      if (n > 0) {
       JasperViewer JsperView = new JasperViewer(prt, false);
       JsperView.setTitle(Titulo);
       JsperView.setExtendedState(6);
       JsperView.show();
      } 
      else {
       JOptionPane.showMessageDialog(null, "No hay datos");
      }
     }
     catch (Exception E) { }
    }
    public void ImprVtasxVendedor(String Nomrep, String Titulo,String parm1,String parm2,
     String parm3,String parm4,String parm5,String parm6,String parm7,String parm8,String parm9,
     String vlrparm1,String vlrparm2,String vlrparm3,String vlrparm4,String vlrparm5,
     String vlrparm6,String vlrparm7,String vlrparm8,String vlrparm9) 
     {
      try {
       Map parame = new HashMap();
       rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + Nomrep
       +".jasper";parame.put(parm1, vlrparm1);parame.put(parm2, vlrparm2);
       parame.put(parm3, vlrparm3);parame.put(parm4, vlrparm4);
       parame.put(parm5, vlrparm5);parame.put(parm6, vlrparm6);           
       parame.put(parm7, vlrparm7);parame.put(parm8, vlrparm8);           
       parame.put(parm9, vlrparm9);
       JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
       int n = prt.getPages().size();                 
       if (n > 0) {
        if(JOptionPane.showConfirmDialog(null,"Deseas Previsualizar primero","Confirmar"
         ,0)==0){
         JasperViewer JsperView = new JasperViewer(prt, false);  
         JsperView.setTitle(Titulo);JsperView.setExtendedState(6);JsperView.show();
        }   
        else       
         net.sf.jasperreports.engine.JasperPrintManager.printReport(prt, false);                      
       } 
       else 
       JOptionPane.showMessageDialog(null, "No hay datos");      
      } 
      catch (Exception E) {}
    }
    public void ImprGeneralCaja(String Nomrep, String Titulo,String parm1,String parm2,
     String parm3,String parm4,String parm5,String parm6,String vlrparm1,String vlrparm2,
     String vlrparm3,String vlrparm4,String vlrparm5,String vlrparm6) {
     try {
      Map parame = new HashMap();
      rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + Nomrep
      +".jasper";parame.put(parm1, vlrparm1);parame.put(parm2, vlrparm2);
      parame.put(parm3, vlrparm3);parame.put(parm4, vlrparm4);
      parame.put(parm5, vlrparm5);parame.put(parm6, vlrparm6);           
      JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
      int n = prt.getPages().size();                 
      if (n > 0) {
       if(JOptionPane.showConfirmDialog(null,"Deseas Previsualizar primero","Confirmar"
        ,0)==0){
        JasperViewer JsperView = new JasperViewer(prt, false);  
        JsperView.setTitle(Titulo);JsperView.setExtendedState(6);JsperView.show();
       }   
       else       
        net.sf.jasperreports.engine.JasperPrintManager.printReport(prt, false);                      
      } 
      else 
       JOptionPane.showMessageDialog(null, "No hay datos");      
     } 
     catch (Exception E) {}
    }
    public void ImprConFechas(String inicio, String fin, String NRpt, String mnt) {
        try {
            Map parame = new HashMap();
            rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt;
            parame.put("Desde", inicio);
            parame.put("Hasta", fin);
            parame.put("Monto", mnt);
            JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
            int n = prt.getPages().size();
            if (n > 0) {
                JasperViewer JsperView = new JasperViewer(prt, false);
                JsperView.setTitle("Reporte Montos de venta por Vendedor");
                JsperView.setExtendedState(6);
                JsperView.show();
            } else {
                JOptionPane.showMessageDialog(null, "No hay datos");
            }
        } catch (Exception E) {
        }
    }
    public void ImprReqxUsuarios(String inicio, String fin, String Usua, String nomUsu, String NRpt) {
        try {
            Map parame = new HashMap();
            rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt;
            parame.put("Desde", inicio);
            parame.put("Hasta", fin);
            parame.put("Usuario", Usua);
            parame.put("nombre", nomUsu);
            JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
            int n = prt.getPages().size();
            if (n > 0) {
                JasperViewer JsperView = new JasperViewer(prt, false);
                JsperView.setTitle("Reporte de Requisitorias por Usuarios");
                JsperView.setExtendedState(6);
                JsperView.show();
            } else {
                JOptionPane.showMessageDialog(null, "No hay datos");
            }
        } catch (Exception E) {
        }
    }
    public void ImprRepReqPositivas(String pinicio, String pfinal, String NRpt, String d, String h) {
        try {
            Map parame = new HashMap();
            rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt;
            parame.put("fdesde", pinicio);
            parame.put("fhasta", pfinal);
            parame.put("des", d);
            parame.put("has", h);
            JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
            int n = prt.getPages().size();
            if (n > 0) {
                JasperViewer JsperView = new JasperViewer(prt, false);
                JsperView.setTitle("Reporte Total de Requisitorias");
                JsperView.setExtendedState(6);
                JsperView.show();
            } else {
                JOptionPane.showMessageDialog(null, "No hay datos");
            }
        } catch (Exception E) {
        }
    }
    public void Impresiones1(String Titulo, String NRpt, String sed) {
     try {
      Map parame = new HashMap();
      rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt + ".jasper";
      parame.put("SUBREPORT_DIR", REPORTS_PATH);parame.put("sede", sed);            
      JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
      int n = prt.getPages().size();
      if (n > 0) {
       JasperViewer JsperView = new JasperViewer(prt, false);
       JsperView.setTitle(Titulo);JsperView.setExtendedState(6);
       JsperView.show();
      }
      else 
       JOptionPane.showMessageDialog(null, "No hay datos");            
     }
     catch (Exception E) {}
    }

    public void Impresiones(String Titulo, String NRpt) {
        try {
            Map parame = new HashMap();
            rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt + ".jasper";
            parame.put("", "");
            JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
            int n = prt.getPages().size();
            if (n > 0) {
                JasperViewer JsperView = new JasperViewer(prt, false);
                JsperView.setTitle(Titulo);
                JsperView.setExtendedState(6);
                JsperView.show();
            } else {
                JOptionPane.showMessageDialog(null, "No hay datos");
            }
        } catch (Exception E) {
        }
    }

    public void ImpresionesDistribucion(String Titulo, String NRpt, String par1, String vlrprm1,
            String par2, String vlrprm2) {
        try {
            Map parame = new HashMap();
            rta = System.getProperties().getProperty("user.dir") + "/src/Reportes/" + NRpt + ".jasper";
            parame.put(par1, vlrprm1);
            parame.put(par2, vlrprm2);
            JasperPrint prt = JasperFillManager.fillReport(rta, parame, cconn.conec);
            int n = prt.getPages().size();
            if (n > 0) {
                JasperViewer JsperView = new JasperViewer(prt, false);
                JsperView.setTitle(Titulo);
                JsperView.setExtendedState(6);
                JsperView.show();
            } else {
                JOptionPane.showMessageDialog(null, "No hay datos");
            }
        } catch (Exception E) {
        }
    }


  

  

}
