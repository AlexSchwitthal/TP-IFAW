
<% 
//page redirigeant l'utilisateur s'il n'est pas connect�
if(session.getAttribute("login") == null) {
    session.setAttribute("erreurAcces", "Vous ne pouvez pas acc�der � la page demand�, vous devez d'abord vous connect�");
    response.sendRedirect("login");
} 
%>