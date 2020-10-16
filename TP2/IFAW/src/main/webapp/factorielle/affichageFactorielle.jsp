<%-- 
    Document   : affichageFactorielle
    Created on : 9 oct. 2020, 20:27:43
    Author     : alexa
--%>

<%@page import="dauphine.miage.factorielle.Factorielle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Affichage Factorielle</title>
    </head>
    <body>
        <%@include file="../login/loginCheck.jsp" %>
        <div class="container">
            <%@include file="../header.jsp" %>
            <p> resultat factorielle de <%= request.getParameter("factorielle")%> : </p>
            <%
            try {
                String result = Factorielle.calculFactorielle(Integer.valueOf(request.getParameter("factorielle")));
                String[] lines = result.split("!");
                for (int i = 0; i < lines.length; i++) {
                    %> <p> <%= lines[i] %> </p> <%
                }
            }
            catch(IllegalArgumentException e) {
                session.setAttribute("warning", "la valeur de factorielle saisie doit être un chiffre supérieur à 0 !");
                response.sendRedirect("erreur");
            }
            %>
        </div>
    </body>
</html>
