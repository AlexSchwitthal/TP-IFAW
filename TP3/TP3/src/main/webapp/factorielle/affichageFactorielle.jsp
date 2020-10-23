<%-- 
    Document   : affichageFactorielle
    Created on : 9 oct. 2020, 20:27:43
    Author     : alexa
--%>

<%@page import="dauphine.miage.tp3.factorielle.Factorielle"%>
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
            <div class="p-3 border bg-light">
                <p> resultat factorielle de <%= request.getAttribute("factorielle")%> : </p>
                <%
                    String[] lines = (String[]) request.getAttribute("lignes");
                    for (int i = 0; i < lines.length; i++) {
                        %> <p> <%= lines[i] %> </p> <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
