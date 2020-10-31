/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dauphine.miage.tp3.servlet;

import dauphine.miage.tp3.beans.Personne;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alexa
 */
@WebServlet(name = "ContactServlet", urlPatterns = {"/GestionContact"})
public class ContactServlet extends HttpServlet {

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
        
        Personne personne = new Personne();
        
        try {
            HttpSession session = request.getSession(true);	
        
            personne.setName(checkNull(request.getParameter("name")));
            personne.setMiddle(checkNull(request.getParameter("middle")));
            personne.setLastName(checkNull(request.getParameter("lastName")));
            if (request.getParameter("gender") != null) {
                if (request.getParameter("gender").equals("male")) {
                    personne.setGender("masculin");
                } 
                else {
                    personne.setGender("feminin");
                }
            }
            personne.setPhone(checkNull(request.getParameter("phone")));
            personne.setEmail(checkNull(request.getParameter("email")));
            if(request.getParameter("contact") != null) {
                personne.setContact(true);
            }
            else {
                personne.setContact(false);
            }
           
            session.setAttribute("personne", personne);
            RequestDispatcher rd = request.getRequestDispatcher("/Confirm");
            rd.forward(request, response); 
        }
        catch(IllegalArgumentException e) {
            request.setAttribute("warning", e);
            this.getServletContext().getRequestDispatcher("/erreur.jsp").forward(request, response);
        }        
    }
    
    private String checkNull(String value) {
        if(value == null) {
            return "";
        }
        else {
            return value;
        }
    }
}
