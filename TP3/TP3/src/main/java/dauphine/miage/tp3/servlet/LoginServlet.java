/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dauphine.miage.tp3.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        request.setAttribute("warning", "vous ne pouvez pas accéder à cette page !");
        this.getServletContext().getRequestDispatcher("/erreur.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(true);
        try {
            // vérifie que l'on est bien passé par le formulaire de connexion
            if (session.getAttribute("login") == null && request.getParameter("login") == null) {
                session.setAttribute("erreurAcces", "Vous ne pouvez pas accéder à la page demandé, vous devez d'abord vous connecté");
                response.sendRedirect("login");
            }
            Date dateCourante = new Date();
            DateFormat formatFR = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);

            if (session.getAttribute("dateCreation") == null) {
                session.setAttribute("dateCreation", formatFR.format(dateCourante));
            }
            if (session.getAttribute("login") == null) {
                session.setAttribute("login", request.getParameter("login"));
            }
            session.setAttribute("dateVisite", formatFR.format(dateCourante));
            session.setMaxInactiveInterval(3600);
            
            updateCookies(request, response, session);
            getServletContext().setAttribute(session.getId(), session.getId());
            
            response.sendRedirect("affichage");
            //this.getServletContext().getRequestDispatcher("/affichage").forward(request, response);

        } 
        catch (Exception e) {
            session.setAttribute("warning", "une erreur est survenue !");
            response.sendRedirect("erreur");
        }
    }

    private void updateCookies(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        // --- CREATION DES COOKIES
        Cookie[] cookies = request.getCookies();
        boolean exist = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(("id"))) {
                    exist = true;
                } // incrémentation du nombre de connexion
                else if (cookie.getName().equals("nbConnexion")) {
                    int valeurNbConnexion = Integer.parseInt(cookie.getValue());
                    valeurNbConnexion++;
                    cookie.setValue(Integer.toString(valeurNbConnexion));
                    response.addCookie(cookie);
                }
            }
        }

        // création du cookie et initialisation du nombre de connexion à 1
        if (!exist) {
            Cookie id = new Cookie("id", session.getId());
            response.addCookie(id);

            Cookie nbConnexion = new Cookie("nbConnexion", "1");
            response.addCookie(nbConnexion);
        }
    }
}
