<!doctype html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>Titre de la page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <%@include file="../header.jsp" %>
            <form method="post"  action="afficherContact">
                <div class="form-group">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                            <div class="navbar-nav">
                                <a class="nav-item nav-link active" href="#paragraphe">Menu local</a>
                                <a class="nav-item nav-link active" href="https://passeport.dauphine.fr/" target="_blank" accesskey="p">Passeport dauphine</a>
                            </div>
                        </div>
                    </nav>

                    <div>
                        <img src="img/dauphine.jpg" alt="Dauphine">
                    </div>

                    <div>
                        <label for="name">Name :</label>
                        <input type="text" id="name" name="name" value="Nom" class="form-control" maxlength="10">
                        <br />
                        <label for="middle">Middle :</label>
                        <input type="text" id="middle" name="middle" class="form-control" maxlength="10">
                        <br />
                        <label for="lastName">Last name :</label>
                        <input type="text" id="lastName" name="lastName" class="form-control" maxlength="10">
                    </div>

                    <br />

                    <div>
                        <label for="male">Male : </label>
                        <input type="radio" id="male" name="gender" value="male">

                        <label for="female">Female : </label>
                        <input type="radio" id="female" name="gender" value="female">
                    </div>

                    <br /> 

                    <div>
                        <label for="phone">Phone :</label>
                        <input type="text" id="phone" class="form-control" name="phone">
                        <br />
                        <label for="email">Email :</label>
                        <input type="text" id="email" class="form-control" name="email">
                        <br />
                        <label for="contact">Contact ? </label>
                        <input type="checkbox" class="form-check-label" id="contact" name="contact">
                    </div>

                    <br />

                    <div>
                        <input type="submit" value="Soumettre" class="btn btn-primary">

                        <input type="reset" value="remettre à zéro" class="btn btn-danger">

                        <button id="javascript" type="button" class="btn btn-success" onclick="appelJS('name', 'Name value changed')">
                            Appel javascript
                        </button>
                    </div>
                </div>
            </form>

            <br />

            <p id="paragraphe">paragraphe atteint depuis menu local</p>
        </div>
        <script src="js/script.js"></script>
    </body>
</html>