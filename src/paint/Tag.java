/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paint;

import javax.swing.BoxLayout;
import javax.swing.JPanel;

/**
 *
 * @author Cardona
 */
public class Tag {
    private JPanel panel;
    private String color="";
    private String nombre="";
    
    
    public Tag(){
        panel = new JPanel();
        
    }

    public void  addTag(Tag tag){
        panel.add(tag.getPanel());
    }
    
    public void autoredimension (){
        this.panel.setLayout(new BoxLayout(this.panel,BoxLayout.X_AXIS));
    }
    public void setLayout(String tipo){
        if ("derecha".equals(tipo)) {
            this.panel.setAlignmentX(JPanel.LEFT_ALIGNMENT);
        }
    }
    
    public JPanel getPanel() {
        return panel;
    }

    public void setPanel(JPanel panel) {
        this.panel = panel;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
