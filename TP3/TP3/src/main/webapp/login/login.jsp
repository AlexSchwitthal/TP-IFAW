<%-- 
    Document   : login
    Created on : 10 oct. 2020, 19:29:55
    Author     : alexa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <%@include file="../header.jsp" %>
            <br>
            <% 
                if(request.getParameter("supprimer") != null) {
                    session.invalidate();
                    %>
                    <div class="alert alert-primary" role="alert">
                        La session a bien été supprimé !
                    </div>
                    <br>
                    <%
                }
                
                else {
                    if(session.getAttribute("erreurAcces") != null) {
                        %> 
                        <div class="alert alert-danger" role="alert">
                            <%= session.getAttribute("erreurAcces") %>
                        </div>
                        <%
                        session.removeAttribute("erreurAcces");
                    }

                    if(session.getAttribute("login") != null) {
                        response.sendRedirect("affichage");
                    }
                }
            %>
            <h1>Bonjour, veuillez rentrer vos identifiants</h1>
            <hr>
            <form method="post"  action="affichage">
                <div class="form-group">
                    <div>
                        <label for="login">Nom :</label>
                        <input type="text" id="login" name="login" class="form-control" maxlength="15" required>
                        <br />
                    </div>
                    <div>
                        <label for="mdp">Mot de passe :</label>
                        <input type="password" id="mdp" name="mdp" class="form-control" maxlength="15" required>
                        <br />
                    </div>
                    <hr>
                    <div>
                        <input type="submit" value="Valider" class="btn btn-primary">

                        <input type="reset" value="Effacer" class="btn btn-danger">
                    </div>
                </div>
            </form>
        </div>
        
    </body>
</html>
