/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dauphine.miage.tp3.servlet;

import dauphine.miage.tp3.beans.Factorielle;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alexa
 */
@WebServlet(name = "FactorielleServlet", urlPatterns = {"/AffichageFactorielle"})
public class FactorielleServlet extends HttpServlet {

    
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
        PrintWriter out = response.getWriter();
        out.println("erreur !");
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
        PrintWriter out = response.getWriter();
        out.println("work !");
        try {
            String result = Factorielle.calculFactorielle(Integer.valueOf(request.getParameter("factorielle")));
            String[] lines = result.split("!");
            request.setAttribute("lignes", lines);
            request.setAttribute("factorielle", request.getParameter("factorielle"));
            this.getServletContext().getRequestDispatcher("factorielle/affichageFactorielle.jsp").forward(request, response);
        }
        catch(IllegalArgumentException e) {
            request.setAttribute("warning", "la valeur de factorielle saisie doit être un chiffre supérieur à 0 !");
            this.getServletContext().getRequestDispatcher("/erreur.jsp").forward(request, response);
        }        
    }
}
