/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import Entidades.TAsignatura;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.util.ArrayList;

/**
 *
 * @author Nuria
 */
public class MongoDB {
    
    protected static MongoClient mongoCliente;
    protected static DB db;
    
 public MongoDB(){
     this.mongoCliente=null;
     this.db=null;
 }
 
 public  static void AbrirBD(){
     try {
         
         MongoDB.mongoCliente = new MongoClient( "localhost" , 27017 );         
         db = mongoCliente.getDB( "datos" );
         
     } catch (Exception e) {
         System.out.println("Class "+e.getMessage());
     }
 }
 
 public static String InsertarAsignatura(TAsignatura tasignatura){
     try {
        AbrirBD();
        DBCollection coll = db.getCollection("tbasigantura");
        BasicDBObject doc;
        Integer totalHoras=Integer.parseInt(tasignatura.getHoraslaboratorio().toString()) + Integer.parseInt(tasignatura.getHoraspractica().toString())+ Integer.parseInt(tasignatura.getHorasteorica().toString());
        doc = new BasicDBObject("idasignatura", tasignatura.getIdasignatura()).
        append("nombre", tasignatura.getNombre()).
        append("credito",tasignatura.getCredito()).
        append("horasteorica", tasignatura.getHorasteorica()).
        append("horaspractica", tasignatura.getHoraspractica()).
        append("horaslaboratorio", tasignatura.getHoraslaboratorio()).
        append("totalhoras", totalHoras).
        append("ciclo", tasignatura.getCiclo()).
        append("estado", tasignatura.getEstado());
        coll.insert(doc);
        return "OK";
     } catch (Exception e) {
         
         System.out.println("Error al insertar "+e.getMessage());
         return null;
     }
 }
 
 public static ArrayList<TAsignatura> MostrarAsignaturas(){
     
     ArrayList<TAsignatura> listaASignatura= new ArrayList<TAsignatura>();
     TAsignatura oAsignatura; 
     AbrirBD();
     DBCollection colll = db.getCollection("tbasigantura");
      DBCursor cursor = colll.find();

        while (cursor.hasNext()) { 
            oAsignatura= new TAsignatura(); 
            DBObject tobj = cursor.next();
            oAsignatura.setIdasignatura((String) tobj.get("idasignatura"));
            oAsignatura.setNombre(tobj.get("nombre").toString());
            oAsignatura.setCredito((Integer) tobj.get("credito"));
            oAsignatura.setHorasteorica((Integer) tobj.get("horasteorica"));
            oAsignatura.setHoraspractica((Integer) tobj.get("horaspractica"));
            oAsignatura.setHoraslaboratorio((Integer) tobj.get("horaslaboratorio"));
            oAsignatura.setTotalhoras((Integer) tobj.get("totalhoras"));
            oAsignatura.setCiclo((String) tobj.get("ciclo"));
            oAsignatura.setEstado((Integer) tobj.get("estado"));
            listaASignatura.add(oAsignatura);
        }
     return listaASignatura;
 }
 
//public static void main( String args[] ){
//     
//       ArrayList<TAsignatura> tAsignatura=MongoDB.MostrarAsignaturas();
//        for(int cont=0;cont<tAsignatura.size();cont++)
//                {                                
//                    System.out.println(tAsignatura.get(cont).getIdasignatura());
//           }
//        }
}
