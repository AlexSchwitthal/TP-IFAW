<%@page import="dauphine.miage.tp3.beans.Personne"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<h1>TP3 : Servlet</h1>
<%
    if(session.getAttribute("personne") != null) {
        Personne personne = (Personne) session.getAttribute("personne");
        %> <h2> Bonjour <%= personne.getName() %> </h2> <% 
    } 
    else {
        %> <h2> Bonjour visiteur </h2> <%
    }

    Date dateCourante = new Date();
    DateFormat formatFR = DateFormat.getDateInstance(DateFormat.SHORT);                
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