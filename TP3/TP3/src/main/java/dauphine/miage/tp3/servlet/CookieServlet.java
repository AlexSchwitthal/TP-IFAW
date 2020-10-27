/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dauphine.miage.tp3.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alexa
 */
@WebServlet(name = "CookieServlet", urlPatterns = {"/"})
public class CookieServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);	
        if(session.getAttribute("personne") != null) {
            session.removeAttribute("personne");
        }
        Cookie[] cookies = request.getCookies();
        String valeurId = "abcd";
        boolean exist = false;
        if ( cookies != null ) {
            for ( Cookie cookie : cookies ) {
                if(cookie.getName().equals("JSESSIONID")) {
                    valeurId = cookie.getValue();
                }
                else if (cookie.getName().equals(("id")) ) {
                    exist = true;
                }
                // incrémentation du nombre de connexion
                else if (cookie.getName().equals("nbConnexion")) {
                    int valeurNbConnexion = Integer.parseInt(cookie.getValue());
                    valeurNbConnexion++;
                    cookie.setValue(Integer.toString(valeurNbConnexion));
                    response.addCookie(cookie);
                }
            }
        }
        
        // création du cookie et initialisation du nombre de connexion à 1
        if(!exist) {
            Cookie id = new Cookie("id", valeurId);
            response.addCookie(id);
            
            Cookie nbConnexion = new Cookie("nbConnexion", "1");
            response.addCookie(nbConnexion);
        }
        
        response.sendRedirect("contact");
    }
}
