<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <title>Authentification livreur</title>

 <link rel="stylesheet" href="ressources/css/test.css">
 <link href="ressources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	
 </head>

<body>
	<div class="wrapper">
      <div class="title">Connexion</div>
      <form action="LivreurLoginServlet" method="post">
        <div class="field">
          <input type="email" name="email" placeholder="Email" required>
          
        </div>
        <div class="field">
          <input type="password" name="pass" placeholder="Mot de passe" required>
         
        </div> 
        <div class="field">
          <input type="submit" value="Connecter">
        </div>
        	<%
			if (request.getAttribute("erreur") != null) {
			%>
			<div class="alert alert-danger">
				<i class="icon-remove-sign"></i> <strong>Identifiant et /
					ou mot de passe incorrect(s)</strong> !
			</div>
			<%
			}
			%>
      </form>
    </div>
                  
	<br><br>	
		<div class="websiteFooter">
			<div class="copyright">NAOUAL & NISSRINE & ZINEB Copyright © : 2021  |  <b> Object Oriented Programming</b>, ENSA SAFI (All Rights Reserved).</div>
		</div>

</div>
</body>
</html>