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
        <title>Afficher Contact</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="../login/loginCheck.jsp" %>
        <div class="container">
            <%@include file="../header.jsp" %>
            <div class="p-3 border bg-light">
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
            </div>
        </div>
    </body>
</html>
