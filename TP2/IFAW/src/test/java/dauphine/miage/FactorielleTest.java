/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dauphine.miage;

import dauphine.miage.factorielle.Factorielle;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author alexa
 */
public class FactorielleTest {
    
    public FactorielleTest() {
        resultatFactorielleTest();
    }
    
    @Test
    public void resultatFactorielleTest() {
        String result = Factorielle.calculFactorielle(1);
        assertEquals("1 * 1 = 1!", result);
        
        result = Factorielle.calculFactorielle(2);
        assertEquals("1 * 1 = 1!1 * 2 = 2!", result);
        
         result = Factorielle.calculFactorielle(3);
        assertEquals("1 * 1 = 1!1 * 2 = 2!2 * 3 = 6!", result);
    }
}
