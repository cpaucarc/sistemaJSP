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
import java.io.FileInputStream;
import java.sql.*;import java.util.PropertyResourceBundle;
import java.util.logging.*;import javax.swing.JOptionPane;
public class ConexionFichero {  
 public  static PreparedStatement pr=null;
 public  CallableStatement cl=null;
 public static Connection conec = null;     
 public ResultSet rt = null;public static Statement st=null; 
 public static String user, password, host, db, usu;
 private static ConexionFichero instance = null; 
 
 static {
  String properties = "Iniciar.properties";PropertyResourceBundle file;
  try {
   file = new PropertyResourceBundle(new FileInputStream(properties));
   user = file.getString("user");password = file.getString("password");
   host = file.getString("host");db = file.getString("database");
  }
  catch (Exception e) {}
 }
 public static ConexionFichero getInstance() {
  if (instance == null) {
   instance = new ConexionFichero();Conectar();
  }
  try {
   if (conec.isClosed()) 
     Conectar();   
  } 
  catch (SQLException ex) {
    Logger.getLogger(ConexionFichero.class.getName()).log(Level.SEVERE, null, ex);
  }
  return instance;
 }
 public static void Conectar() {
  try {String url = "jdbc:mysql://" + host + "/" + db;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conec = DriverManager.getConnection(url, user, password);
  } 
  catch (Exception e) {
   e.printStackTrace();
   JOptionPane.showMessageDialog(null, "Ha ocurrido un error al realizar la conexión"
   + " al servidor de base de datos.\nVerifique los parámetros de conexión.\n\nDetalle"
   + " de error:\n\n" + e + "", "Error de conexión", JOptionPane.ERROR_MESSAGE);
   System.exit(0);
  }
 }      
}
