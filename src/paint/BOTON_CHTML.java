/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paint;

import javax.swing.JButton;
import javax.swing.JPanel;

/**
 *
 * @author Cardona
 */
public class BOTON_CHTML extends Tag{
    private JButton btn;
    
    public BOTON_CHTML(String txt, String color){
        this.btn = new JButton(txt);
        JPanel aux = new JPanel();
        aux.add(this.btn);
        super.setColor(color);
        super.setPanel(aux);
        
    }
}
