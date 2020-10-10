
<% 
//page redirigeant l'utilisateur s'il n'est pas connecté
if(session.getAttribute("login") == null) {
    session.setAttribute("erreurAcces", "Vous ne pouvez pas accéder à la page demandé, vous devez d'abord vous connecté");
    response.sendRedirect("login");
} 
%>