package Analizador_CJS;

import java.io.File;

/**
 *
 * @author Joaquin
 */
public class GLexico 
{
    
    public static void main(String[] args) 
    {
        //String path="src\\Analizadores\\lexico.jflex";
        String path="src/Analizador_CJS/lexicocjs.jflex";
        
        generarLexer(path);
    }    
    public static void generarLexer(String path)
    {
        
        File file=new File(path);
        jflex.Main.generate(file);
    } 
    
}
