<%-- 
    Document   : affichage
    Created on : 10 oct. 2020, 19:44:30
    Author     : alexa
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Date dateCourante = new Date();
                DateFormat formatFR = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
                if(session.getAttribute("dateCreation") == null) {
                    session.setAttribute("dateCreation", formatFR.format(dateCourante));
                }
                session.setAttribute("nom", request.getParameter("nom"));
                session.setAttribute("dateVisite", formatFR.format(dateCourante));  
                session.setMaxInactiveInterval(3600);
            }
            catch(Exception e) {
                session.setAttribute("warning", "une erreur est survenue !");
                response.sendRedirect("erreur");
            }
        %>
        <div class="container">
            <%@include file="../header.jsp" %>
                <h4>Nom : <%= session.getAttribute("nom") %></h4>
                <h4>Dernière date d'accès : <%= session.getAttribute("dateVisite") %></h4>
                <h4>Date de création de la session : <%= session.getAttribute("dateCreation") %></h4>
                <hr>
                <form action="login" method="post">
                    <input type="hidden" value="supprimer" name="supprimer" />
                    <input type="submit" value="Supprimer la session" class="btn btn-danger">
                </form>
        </div>
    </body>
</html>
