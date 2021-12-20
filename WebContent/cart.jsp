
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head> 

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

  
</head>
  <title>Cart</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style >
 

.liste {
  font-family: arial, sans-serif;
  font-size: 19px;
  border-collapse: collapse;
  border-radius: 7px;
  width: 95%;
  margin: 0;
  margin-right:20px;

}

td {
  border: 2px solid #dddddd;
  text-align: center;
  padding: 10px 0;
}
.footer{
  background: black;
  color: white;
  padding-top: 20px;
  padding-bottom: 20px;
  text-align: center;
}
 
.a{
  text-align: center;
  text-decoration: none;
  color:white;
  font-size: 1.2vw;
}

.a:hover {
  color: #F0c330;
  transition: 0.5s;
}
h1{
  position:absolute;
  padding:3px;
  float:left;
  margin-left: 2%;
  margin-top: 10px;
  color: white;
}
   .footer {
  position: relative;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: black;
  color: white;
  text-align: center;
}
tr:nth-child(even){background-color: #f2f2f2;}
</style>
    <link href="css/nav.css" rel="stylesheet">
   
  </head>
      
<body>

 	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlistQ }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
<nav class="navbar navbar-default " style="background-color:#ffff;  ">
  <div class="container-fluid ch ">
    <div class="navbar-header"    style="height:70px">
      <a  class="navbar-brand" href="Controller?page=index" ><img id="img" alt="" src="images/logo-img.png"></a>
    </div>
    <ul class="nav navbar-nav right">
    
      <li  class="hover" ><a href="Controller?page=index">Acceuil</a></li>
     <c:choose>
					<c:when test="${session == null}">
						 	<li><a href="Controller?page=inscrire" >Inscription</a></li>
					 <li><a href="#">Authentification</a></li>
					 </c:when>
					<c:when test="${session != null}">
							
        <li><a href="Controller?page=user&id=<c:out value='${client.getId() }'></c:out>">Mon Compte(<c:out value="${client.getNom()}"></c:out>)</a></li>
      
      <li><a href="Controller?page=affichercart">
             <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            cart(<c:out value="${x}"/>)</a></li>
      
      <li><a href="Controller?page=deconnexion " class="hover" >Se déconnecter</a></li>
				
      
            </c:when>
				</c:choose>
             
    </ul>
  </div>
</nav> 
	 
<c:if test="${mess != null}">
					
 <div style="
  padding: 20px;
  background-color:#ff9800;//#04AA6D
  color: white;
  width:70%;
  font-size:20px;
  position :fixed;
   z-index: 9;
   margin-left:15px;
   font-size:15px;
  " class="alert alert-danger alert-dismissible"> 
    <strong></strong> <c:out value="${mess }"></c:out>.
  </div>
  </c:if>
<br><br>
  <div class="" style="">
<div class="container"> 
  <div class="row">
  <br><br>
     <div class="col-xs-8">
       
  <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">Nom Repas</th>
            <th scope="col">Prix</th>
            <th scope="col">Qauntité</th>
            <th scope="col">Supprimer Repas</th>
          </tr>
        </thead>
        <c:set var="total" value="0"></c:set>
		<c:forEach items="${cartlistQ }" var="i" >
		<c:forEach items="${listRepas }" var="repas">
			 <c:if test="${i.key == repas.getId() }">
					<c:set var="total" value="${total + repas.getPrix()*quantite}"></c:set>
				
        <tbody>
               <tr>
            <th scope="row"><c:out value="${repas.getNom_repas()}"/></th>
              <td><c:out value="${repas.getPrix()}"/></td>
             <td><c:out value="${quantite}"/></td>
           
            <td> 

                <a href="Controller?page=remove&id=<c:out value="${repas.getId()}"/>"
                   class="btn btn-danger">Annuler</a>
            </td>
          </tr>
          
        </tbody>
				</c:if>
			</c:forEach>
		</c:forEach>
      </table>

    </div>   
  
      <div class="col-xs-4">
  <br>
    <div class="panel panel-info">
      <div class="panel-heading">Les élements de Panel</div>
      <div class="panel-body">
      
      <c:choose> 
		<c:when test="${x == 1}">
						<h4 style="margin-top: 20px;">Mon panier(<c:out value="${x}"/> éléments)</h4>
		</c:when>
		<c:when test="${x > 1}">
						<h4 style="margin-top: 20px;">Mon panier(<c:out value="${x}"/> éléments)</h4>
		</c:when>
		<c:otherwise >
				<h4 style="margin-top: 20px;">Votre panier est vide</h4>
		</c:otherwise>
	
	</c:choose>
      
      
      
      
      </div>
    </div>
  <br>
   <div class="panel panel-danger">
      <div class="panel-heading">Le Prix Totale</div>
      <div class="panel-body">
      
	<h4>Totale de commande <c:out value="${ total}"></c:out>DH</h4>
      
      </div>
    </div>  <a  href="Controller?page=suiteTraitement&id=<c:out value="${client.getId()}"/>"><input type="submit" value="Envoyer la commande" class="btn btn-success" style="width:100%;padding:8px;font-size:16px;"></a><br>
	<br>
	<a href="Controller?page=index"><input type="button" value="Continuer Achats " class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
	
  </div>
      </div> 
    
    </div>
 
  <br><br> <br>
  <div class="footer">
   <footer class="page-footer font-small blue">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2021 Copyright:
    <a href="https://mdbootstrap.com/"> marakech.magique.com</a>
  </div>
  <!-- Copyright -->

</footer></div>
 

</body>
</html>