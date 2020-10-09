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
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <p> resultat factorielle de <%= request.getParameter("factorielle")%> : </p>
        <%
            String result = Factorielle.calculFactorielle(Integer.valueOf(request.getParameter("factorielle")));
            String[] lines = result.split("!");
            for(int i = 0; i < lines.length; i++) {
                %>
                <p>
                    <% out.println(lines[i]); %>
                </p>
                <%
            }
        %>
    </body>
</html>
