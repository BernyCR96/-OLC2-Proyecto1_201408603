package Analizadores_CCSS;

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
        String path="src/Analizadores_CCSS/lexicoCCSS.jflex";
        
        generarLexer(path);
    }    
    public static void generarLexer(String path)
    {
        
        File file=new File(path);
        jflex.Main.generate(file);
    } 
    
}
