<%-- 
    Document   : erreur
    Created on : 9 oct. 2020, 23:11:23
    Author     : alexa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../header.jsp" %>
            <div class="alert alert-danger" role="alert">
                l'erreur suivante est survenue : <%= session.getAttribute("warning") %>
            </div>
        </div>
    </body>
</html>
