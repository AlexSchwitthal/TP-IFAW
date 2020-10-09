<%-- 
    Document   : affichageFactorielle
    Created on : 9 oct. 2020, 20:27:43
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
        <%@include file="header.jsp" %>
        <% 
            int factorielle = Integer.valueOf(request.getParameter("factorielle"));
            for(int i = 0; i < factorielle; i++) {
                //calculFactorielle(i);
            }
        %>
        
    </body>
</html>
