<%-- 
    Document   : afficherContact
    Created on : 9 oct. 2020, 19:21:35
    Author     : alexa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="header.jsp" %>

        <p>
            le nom est <%= request.getParameter("name")%> 
        </p>
        <p>
            le middle est <%= request.getParameter("middle")%> 
        </p>

        <p>
            le lastName est <%= request.getParameter("lastName")%> 
        </p>

        <p>
            le sexe de l'utilisateur est <%
                if (request.getParameter("gender") != null) {
                    if (request.getParameter("gender").equals("male")) {
                        out.println("masculin");
                    } else {
                        out.println("féminin");
                    }
                }
            %> 
        </p>
        <p>
            le numéro de téléphone est <%= request.getParameter("phone")%> 
        </p>
        <p>
            l'adresse e-mail est <%= request.getParameter("email")%> 
        </p>
    </body>
</html>
