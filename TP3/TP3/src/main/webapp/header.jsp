<%@page import="dauphine.miage.tp3.beans.Personne"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<h1>TP3 : Servlet</h1> <br>
<%
    Date dateCourante = new Date();
    DateFormat formatFR = DateFormat.getDateInstance(DateFormat.SHORT);

    Cookie[] cookies = request.getCookies();
    if ( cookies != null ) {
        for ( Cookie cookie : cookies ) {
           if (cookie.getName().equals(("id")) ) {
                %> <h3> votre id est <%= cookie.getValue() %> ,<% 
            }
            // incrémentation du nombre de connexion
            else if (cookie.getName().equals("nbConnexion")) {
                if(cookie.getValue().equals("1")) {
                    %> il s'agit de votre première visite ! </h3> <%
                }
                else {
                    %> vous avez visité ce site <%= cookie.getValue() %> fois ! </h3> <%
                }       
            }
        }
    }
%>
<h3> la date du jour est : <%= formatFR.format(dateCourante) %> </h3>
 

<nav class="navbar navbar-expand navbar-dark bg-dark">
    <div class="collapse navbar-collapse" id="navbarsExample02">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="contact">Contact <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="factorielle">Factorielle</a>
            </li>
            <li class="nav-item active">
             <%
                if (session.getAttribute("login") == null) {
                    %><a class="nav-link" href="login">Connexion</a> <%
                } 
                else {
                    %><a class="nav-link" href="affichage">Session</a> <%
                }
                %>
            </li>
        </ul>
    </div>
</nav>
<hr>

<br />