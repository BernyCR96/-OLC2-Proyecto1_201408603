/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package olc1.proyecto1_201408603;

/**
 *
 * @author Cardona
 */
public class Singleton {
    private static Singleton unicaInstancia;
    String mensaje="";
    private Singleton(){
        //cualquier cosa
    }
    
    public static Singleton obtenerInstancia(){
        if(unicaInstancia==null){
            unicaInstancia=new Singleton();
        }
        return unicaInstancia;
    }
}
