<%-- 
    Document   : afficherContact
    Created on : 9 oct. 2020, 19:21:35
    Author     : alexa
--%>

<%@page import="dauphine.miage.tp3.beans.Personne"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Afficher Contact</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <%@include file="../header.jsp" %>
            <div class="p-3 border bg-light">
                <% Personne personne = (Personne) session.getAttribute("personne"); %>
                <p>
                    le nom est <%= personne.getName() %> 
                </p>
                <p>
                    le middle est <%= personne.getMiddle() %> 
                </p>

                <p>
                    le lastName est <%= personne.getLastName() %> 
                </p>

                <p>
                    l'uttilisateur est de sexe  <%= personne.getGender() %> 
                </p>
                <p>
                    le numéro de téléphone est <%= personne.getPhone() %>  
                </p>
                <p>
                    l'adresse e-mail est <%=  personne.getEmail() %> 
                </p>
            </div>
        </div>
    </body>
</html>
