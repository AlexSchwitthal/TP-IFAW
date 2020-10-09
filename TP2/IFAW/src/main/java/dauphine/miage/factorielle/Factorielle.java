/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dauphine.miage.factorielle;

/**
 *
 * @author alexa
 */
public class Factorielle {
    
    public static String calculFactorielle(int valeur) {
        String s = "";
        int total = 1;
        for(int i = 1; i <= valeur; i++) {
            s += total + " * " + i + " = ";
            total = total * i;
            s += total + "!";
        }
        return s; 
    }
}
