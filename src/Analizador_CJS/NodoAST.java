/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador_CJS;

import Analizadores.NodoA;
import java.util.ArrayList;

/**
 *
 * @author Cardona
 */
public class NodoAST {
    
    private String nombre;
    private String tipo;
    private ArrayList<NodoAST> Lhijo;
    
    public NodoAST(String tipo, String nombre){
        this.nombre = nombre;
        this.tipo = tipo;
        this.Lhijo = new ArrayList<>();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public ArrayList<NodoAST> getLhijo() {
        return Lhijo;
    }

    public void setLhijo(ArrayList<NodoAST> Lhijo) {
        this.Lhijo = Lhijo;
    }
}
