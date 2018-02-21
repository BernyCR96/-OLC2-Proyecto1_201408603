/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Analizadores.ALexico;
import Analizadores.NodoA;
import Analizadores.Sintactico;
import java.io.File;
import java.io.FileWriter;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.Symbol;
import javax.swing.JOptionPane;

/**
 *
 * @author cardona
 */
public class Compilador 
{
    
    public Compilador()
    {
        
    }
    
    /*------------------------------------------------------------------
    *** Metodo para ejecutar los analizadores, se puede de las sig. formas
    ***
    ***     Lexico analizador_lexico =  new Lexico(new StringReader(entrada));
    ***     Sintactico analizador_sintactico = new Sintactico(analizador_lexico);        
    ***     analizador_sintactico.parse();
    ***     
    ***     Reader reader = new StringReader(entrada);
    ***     Lexico analizador_lexico =  new Lexico(reader);
    ***     Sintactico analizador_sintactico = new Sintactico(analizador_lexico);
    ***     analizador_sintactico.parse();
    ***
    ------------------------------------------------------------------*/
    public String Analizar(String entrada)
    {
        try 
        {
            //crear el lexico
            ALexico lexico = new ALexico(new StringReader(entrada));
            /*Symbol s = (Symbol)lexico.next_token();
            
            while(s.sym != 0 ){
                System.out.println("Lexema: "+s.value+" Token: "+s.sym);
                
                s = (Symbol)lexico.next_token();
            }
            //crear el sintactico
            
            
            
            //ejecutar el analisis
            */
            Sintactico parser = new Sintactico(lexico);
           // parser.parse();
            
            NodoA nuevo = (NodoA) parser.parse().value;
            System.out.println("---------- el nombre es: "+ nuevo.getNombre());
            JOptionPane.showMessageDialog(null, "Analisis Completo","Ejemplo",1);
             cadena = "";
            cont = 0;
            graficarArbol(nuevo);
            CrearDot();
            
            
            
                       
            
        } 
        catch (Exception E) 
        {
          
        }        
        return null;
    }
    private static int cont;
    private static String cadena;
    
    /**
     *
     * @param e
     */
    private String graficarArbol(NodoA e){
       String id_padre = "Nodo" + cont;
        cont++;
        cadena += id_padre + "[label=\"" + e.getNombre() + "\"];\n";
        //System.out.println("cadena: " + cadena_dot);
        for (NodoA hijo : e.getListaDehojas()) {
            if (hijo != null) {
                String cad = id_padre + "->" + graficarArbol(hijo) + ";\n";
                cadena += cad;
            }

        }

        return id_padre;
        
    }
    
     private void CrearDot() {
        try {
            File archivo_dot = new File("arbol.txt");
            FileWriter escribir = new FileWriter(archivo_dot, false);
            escribir.write("digraph Grafo{\n " + cadena + "\n}\n");
            escribir.close();
            CrearImg("C:\\Users\\Cardona\\Desktop\\[OLC2]Proyecto1_201408603\\arbol.txt","C:\\Users\\Cardona\\Desktop\\[OLC2]Proyecto1_201408603\\grafo.png");
        } catch (Exception e) {
            System.err.println("Error al crear el DOT");
        } finally {

        }
    }
     
      private void CrearImg(String direccionDot, String direccionImg) {
        try {
            /*ProcessBuilder img;
            img = new ProcessBuilder("C:\\Program Files (x86)\\Graphviz2.38\\bin\\dot.exe", "-Tpng", "-o", direccionImg, direccionDot);
            img.redirectErrorStream(true);
            img.start();*/
            String[]  cmd = {"C:\\Program Files (x86)\\Graphviz2.38\\bin\\dot.exe","-Tpng",direccionDot,"-o",direccionImg};
            Runtime rt = Runtime.getRuntime();
            rt.exec(cmd);
        } catch (Exception e) {
            System.out.println(e.toString());;
        }
        
      }
    
}
