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
        <title>Affichage</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../header.jsp" %>
            <%            
                Date d = new Date();
                DateFormat fr = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
                session.setAttribute("dateVisite", fr.format(d));
            %>
            <div class="p-3 border bg-light">
                <h4>Nom : <%= session.getAttribute("login") %></h4>
                <h4>Dernière date d'accès : <%= session.getAttribute("dateVisite") %></h4>
                <h4>Date de création de la session : <%= session.getAttribute("dateCreation") %></h4>
            </div>
            <hr>
            <form action="LogoutServlet" method="post">
                <input type="hidden" value="supprimer" name="supprimer" />
                <input type="submit" value="Supprimer la session" class="btn btn-danger">
            </form>
        </div>
    </body>
</html>
