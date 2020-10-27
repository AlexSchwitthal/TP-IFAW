/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dauphine.miage.tp3.servlet;

import dauphine.miage.tp3.beans.Personne;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ConfirmServlet", urlPatterns = {"/Confirm"})
public class ConfirmServlet extends HttpServlet {

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
        
        HttpSession session = request.getSession(true);	
        Personne personne = (Personne) session.getAttribute("personne");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Confirmation</title>");            
        out.println("</head>");
        out.println("<body>");
        out.println("<p>");
            if(personne.getGender().equals("masculin")) {
                out.print("M.");
            }
            else {
                out.print("Mme.");
            }
            out.print(personne.getName() + " " + personne.getMiddle() + " " + personne.getLastName());
        out.println("</p>");
        out.println("Veuillez vérifier les infos vous concernants :<br>");
        out.println("Sexe = " + personne.getGender() + "<br>");
        out.println("N° de téléphone = " + personne.getPhone() + "<br>");
        out.println("E-mail = " + personne.getEmail() + "<br>");
        out.println("<input type=\"button\" onclick=\"location.href='afficherContact';\" value=\"Confirmer\" />");
        out.println("<input type=\"button\" onclick=\"location.href='contact';\" value=\"Corriger\" />");
        out.println("</body>");
        out.println("</html>");
    }
}
