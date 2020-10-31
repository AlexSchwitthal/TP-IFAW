<%@page import="java.util.Enumeration"%>
<%@page import="dauphine.miage.tp3.beans.Personne"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<h1>TP3 : Servlet</h1> <br>
<%
    // GESTION DES COOKIES
    if(session.getAttribute("login") != null & request.getParameter("supprimer") == null) {
        Cookie[] cookies = request.getCookies();
        if ( cookies != null ) {
            for ( Cookie cookie : cookies ) {
               if (cookie.getName().equals(("id")) ) {
                    %> <h3> Votre id est <%= cookie.getValue() %> ,<% 
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
    }
    
    // NB USERS 
    int nbUsers = 0;
    ServletContext ctx = getServletContext();
    Enumeration<String> attrNames = ctx.getAttributeNames();
    while (attrNames.hasMoreElements()) {
        String attrName = attrNames.nextElement();
        if(!(attrName.contains("."))) {
            nbUsers++;
        }
    }
    %> <h4> Il y a actuellement <%= nbUsers %> utilisateur(s) connecté(s) </h4> <%

    // GESTION DE LA DATE
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