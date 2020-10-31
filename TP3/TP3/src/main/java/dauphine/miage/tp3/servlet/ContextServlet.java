/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dauphine.miage.tp3.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alexa
 */
@WebServlet(name = "ContextServlet", urlPatterns = {"/context"})
public class ContextServlet extends HttpServlet {

    static int id = 1;
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
        ServletContext ctx = getServletContext();
        Enumeration<String> attrNames = ctx.getAttributeNames();
        while (attrNames.hasMoreElements()) {
            String attrName = attrNames.nextElement();
            if(!(attrName.contains("."))) {
                out.println(attrName);
            }
        }
    }
    
    public int getNbUsers(HttpServletRequest request, HttpServletResponse response) {
        int nbUsers = 0;
        ServletContext ctx = getServletContext();
        Enumeration<String> attrNames = ctx.getAttributeNames();
        while (attrNames.hasMoreElements()) {
            String attrName = attrNames.nextElement();
            if(!(attrName.contains("."))) {
                nbUsers++;
            }
        }
        return nbUsers;
    }
}
