<%-- 
    Document   : factorielle
    Created on : 9 oct. 2020, 20:15:15
    Author     : alexa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Factorielle</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../header.jsp" %>
            <form method="post"  action="AffichageFactorielle">
                <div class="form-group">
                    <div>
                        <label for="factorielle">Factorielle :</label>
                        <input type="number" id="factorielle" name="factorielle" class="form-control" min="1" max="15" required>
                        <br />
                    </div>
                    <div>
                        <input type="submit" value="Soumettre" class="btn btn-primary">
                    </div>
                </div>
            </form>
        </div>

    </body>
</html>
