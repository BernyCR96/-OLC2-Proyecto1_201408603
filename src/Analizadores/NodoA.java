/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizadores;

import java.util.ArrayList;

/**
 *
 * @author Cardona
 */
public class NodoA {
    
     private String nombre;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ArrayList<NodoA> getListaDehojas() {
        return listaDehojas;
    }

    public void setListaDehojas(ArrayList<NodoA> listaDehojas) {
        this.listaDehojas = listaDehojas;
    }
    private ArrayList<NodoA> listaDehojas;

    public NodoA(String nombre) {
        this.nombre = nombre;
        this.listaDehojas = new ArrayList<>();
    }
    
    
}
