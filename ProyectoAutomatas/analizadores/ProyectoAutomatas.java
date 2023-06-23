package analizadores;
import java.util.logging.Logger;

public class ProyectoAutomatas {

    public static Logger log = Logger.getLogger(ProyectoAutomatas.class.getName());
  
    public static void main(String[] args) {
       
        try{
            parser p = new parser (new Yylex(new java.io.FileInputStream("entrada.txt")));
            p.parse();
        }
        catch(Exception e)
        {            
            e.printStackTrace();
       
        }
    }
}