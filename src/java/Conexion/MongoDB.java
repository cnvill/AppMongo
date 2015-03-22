/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import Entidades.TAsignatura;
import Entidades.TDetMatricula;
import Entidades.TEstudiante;
import Entidades.TMatricula;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.util.ArrayList;
import java.util.Date;

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
         db = mongoCliente.getDB( "mongotresmil" );
         
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
 
 public static ArrayList<TEstudiante> ListaEstudiantes(){
        ArrayList<TEstudiante> listaEstudiante= new ArrayList<TEstudiante>();
        try {
            
            AbrirBD();
            DBCollection colll = db.getCollection("testudiante");
            DBCursor cursor = colll.find();
            TEstudiante oEstudiante;
            while (cursor.hasNext()) { 
                oEstudiante = new TEstudiante(); 
                DBObject tobj = cursor.next();
                oEstudiante.setCodigo((String) tobj.get("codigo"));
                oEstudiante.setNombre(tobj.get("nombre").toString());
                oEstudiante.setApellidos((String) tobj.get("apellidos"));
                oEstudiante.setFechanacimiento((Date) tobj.get("fechanacimiento"));
                oEstudiante.setEstado((Integer) tobj.get("estado"));
                listaEstudiante.add(oEstudiante);
            }        
        }catch (Exception e) {
            e.getMessage();
        }
        return listaEstudiante;
    }
    
 
public static ArrayList<TEstudiante> BuscarEstudiante(String value){
        ArrayList<TEstudiante> listaEstudiante= new ArrayList<TEstudiante>();
        try {
            
            AbrirBD();
            DBCollection colll = db.getCollection("testudiante");
            BasicDBObject q = new BasicDBObject();
            q.put("nombre",  java.util.regex.Pattern.compile(value));
            DBCursor cursor=colll.find(q);
            TEstudiante oEstudiante;
            while (cursor.hasNext()) { 
                oEstudiante = new TEstudiante(); 
                DBObject tobj = cursor.next();                
                oEstudiante.setCodigo((String) tobj.get("codigo"));
                oEstudiante.setNombre(tobj.get("nombre").toString());
                oEstudiante.setApellidos((String) tobj.get("apellidos"));
                oEstudiante.setDni((String) tobj.get("dni"));
                oEstudiante.setFechanacimiento((Date) tobj.get("fechanacimiento"));
                oEstudiante.setEstado((Integer) tobj.get("estado"));
                listaEstudiante.add(oEstudiante);
            }        
        }catch (Exception e) {
            e.getMessage();
        }
        return listaEstudiante;
    }
    
 public static String EditarEstudiante(TEstudiante testudiante){
     try {
        AbrirBD();
        DBCollection coll = db.getCollection("testudiante");
        BasicDBObject qId = new BasicDBObject();
        qId.put("codigo",  testudiante.getCodigo().toString());
        BasicDBObject qUpdate = new BasicDBObject();
        qUpdate.put("codigo", testudiante.getCodigo());
        qUpdate.put("nombre", testudiante.getNombre());
        qUpdate.put("apellidos", testudiante.getApellidos());
        qUpdate.put("dni", testudiante.getDni());
        coll.update(qId, qUpdate);
        return "OK";
     } catch (Exception e) {
         
         System.out.println("Error al insertar "+e.getMessage());
         return null;
     }
 }
 
public static TEstudiante  GetEstudiante(String idEstudiante){
        TEstudiante oEstudiante= new TEstudiante();
            try {
                AbrirBD();                
                DBCollection coll = db.getCollection("testudiante");
                  BasicDBObject q = new BasicDBObject();
            q.put("codigo",  idEstudiante);
            DBCursor cursor=coll.find(q);
            
            while (cursor.hasNext()) {                 
                DBObject tobj = cursor.next();
                oEstudiante.setCodigo((String) tobj.get("codigo"));
                oEstudiante.setNombre(tobj.get("nombre").toString());
                oEstudiante.setApellidos((String) tobj.get("apellidos"));
                oEstudiante.setDni((String) tobj.get("dni"));
                oEstudiante.setFechanacimiento((Date) tobj.get("fechanacimiento"));
                oEstudiante.setEstado((Integer) tobj.get("estado"));
                
            }        
        } catch (Exception e) {         
                 System.out.println("Error al insertar "+e.getMessage());

        }
        return oEstudiante;
}

    public static String RegistrarEstudiante(TEstudiante oEstudiante){
        String Res="No";
        try {
             AbrirBD();
        DBCollection coll = db.getCollection("testudiante");
        BasicDBObject doc;        
        doc = new BasicDBObject("codigo", oEstudiante.getCodigo()).
        append("nombre", oEstudiante.getNombre()).
        append("apellidos",oEstudiante.getApellidos()).
        append("dni", oEstudiante.getDni()).
        append("fechanacimiento", oEstudiante.getFechanacimiento()).
        append("estado", oEstudiante.getEstado());
        coll.insert(doc);
        Res = "OK";
        } catch (Exception e) {
            Res="NO"+e.getMessage();
        }
        return Res;
    }
    
     public static String RegistrarDetMatricula(TDetMatricula oDetMatricula){
        String Res="No";
        try {
            AbrirBD();
            DBCollection coll = db.getCollection("tdetmatricula");
            BasicDBObject doc;        
            doc = new BasicDBObject("idmatricula", oDetMatricula.getIdmatricula()).
            append("idasignatura", oDetMatricula.getIdasignatura()).
            append("credito",oDetMatricula.getCredito()).
            append("estado", oDetMatricula.getEstado());
            coll.insert(doc);
        } catch (Exception e) {
            Res="NO"+e.getMessage();
        }
        return Res;
    }
    
    public ArrayList<TDetMatricula> ListaDetMatriculas(){
        ArrayList<TDetMatricula> detMatricula= new ArrayList<TDetMatricula>();
        try {
            AbrirBD();
            DBCollection colll = db.getCollection("tdetmatricula");
            DBCursor cursor = colll.find();
             TDetMatricula oDetMatricula;
            while (cursor.hasNext()) { 
                oDetMatricula = new TDetMatricula(); 
                DBObject tobj = cursor.next();
                oDetMatricula.setIdmatricula((Integer) tobj.get("idmatricula"));
                oDetMatricula.setIdasignatura(tobj.get("idasignatura").toString());
                oDetMatricula.setCredito((Integer) tobj.get("credito"));
                oDetMatricula.setEstado((Integer) tobj.get("estado"));
                detMatricula.add(oDetMatricula);
            }        
          
        } catch (Exception e) {
            detMatricula=null;
            System.out.print(""+e.getMessage());
        }
     return detMatricula;
    }
    
    public static String GenerarRegistroMatricula(){
        String respuesta="";
        try {
        ArrayList<TEstudiante> listaEstudiantes= MongoDB.ListaEstudiantes(); 
        ArrayList<TAsignatura> listaAsignaturas= MongoDB.MostrarAsignaturas();
        TMatricula oMatricula;
        TDetMatricula oDetMatricula;
        int nE=listaEstudiantes.size();
        int nA=listaAsignaturas.size();
        int idMatricula=0;
        respuesta =""+nE*nA;
            for (int i = 0; i < nE; i++) {
                oMatricula= new TMatricula();
                idMatricula=i;
                oMatricula.setIdmatricula(idMatricula);
                oMatricula.setEstado(1);
                oMatricula.setIdestudiante(listaEstudiantes.get(i).getIdestudiante());
                oMatricula.setSemestre("III");
                oMatricula.setTotalcreditos(i);
                InsertMatricula(oMatricula);
                for (int j = 0; j < nA; j++) {
                    oDetMatricula= new TDetMatricula();
                    oDetMatricula.setIdmatricula(idMatricula);
                    oDetMatricula.setIdasignatura(listaAsignaturas.get(j).getIdasignatura());
                    oDetMatricula.setEstado(1);
                    oDetMatricula.setCredito(listaAsignaturas.get(j).getCredito());
                    MongoDB.RegistrarDetMatricula(oDetMatricula);
                }
            }
        
        } catch (Exception e) {
            respuesta=respuesta+e.getMessage();
        }
        return respuesta;
    }
    
    public static String InsertMatricula(TMatricula oMatricula){
        String resp="";
        try {
            AbrirBD();
            DBCollection coll = db.getCollection("tmatricula");
            BasicDBObject doc;        
            doc = new BasicDBObject("semestre", oMatricula.getSemestre()).
            append("idmatricula", oMatricula.getIdmatricula()).
            append("idestudiante", oMatricula.getIdestudiante()).
            append("totalcredito",oMatricula.getTotalcreditos()).
            append("fechamtricula", Date.parse("dd/MM/yyyy") ).
            append("estado",oMatricula.getEstado());
            coll.insert(doc);
            resp="OK";
        } catch (Exception e) {
            resp=e.getMessage();
        }
        return resp;
    }
    
     public static ArrayList<TMatricula> ListaMatriculas(){
        ArrayList<TMatricula> listaMatricula= new ArrayList<TMatricula>();
        try {
            AbrirBD();
            DBCollection colll = db.getCollection("tmatricula");
            DBCursor cursor = colll.find();
             TMatricula oMatricula;
            while (cursor.hasNext()) { 
                oMatricula = new TMatricula(); 
                DBObject tobj = cursor.next();
                oMatricula.setIdmatricula((Integer) tobj.get("idmatricula"));
                oMatricula.setSemestre(tobj.get("semestre").toString());
                oMatricula.setIdestudiante((Integer) tobj.get("idestudiante"));
                oMatricula.setFechamatricula((Date) tobj.get("fechamtricula"));
                oMatricula.setEstado((Integer) tobj.get("estado"));
                listaMatricula.add(oMatricula);
            }        
          
        } catch (Exception e) {
            listaMatricula=null;
            System.out.print(""+e.getMessage());
        }
     return listaMatricula;
    }
     
    public static String  getMaxIdMatricula(){
      String resp="";
        try {            
            AbrirBD();
            DBCollection colll = db.getCollection("tmatricula");
            DBCursor cursor = colll.find();
            DBObject tobj = cursor.next();
            resp = (String) tobj.get("idmatricula");
        } catch (Exception e) {
            resp=e.getMessage();
        }
        return resp;
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
