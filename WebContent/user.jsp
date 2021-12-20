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
	 
  <div class="" style="">
<div class="container"> 
  <div class="row">
  <center>  <h3 style="font-size:25px">LA LISTE DES COMMANDES</h3></center>
  <br>  <br>
     <div class="col-xs-12">
  <table class="table table-striped">
        <thead>
          <tr> 
            <th scope="col">la Date de Commande</th>
            <th scope="col">la Liste des Repas</th>
           
            <th scope="col">Totale  de Commande</th>
            <th scope="col">Etat de La Commande</th> 
            
          </tr>
        </thead>
           <tbody>
           <c:choose>
	 <c:when test="${listCommandes != null}">
	 <c:forEach items="${listCommandes }" var="i">
	
			   <tr> 
              <td><c:out value="${i.getDateC()}"/></td>
              	
          <td> <c:forEach items="${i.getEleC() }" var="j">
	
	<c:set var="total" value="${total + j.getPrixRepas(j.getId_repas())*j.getQuantite() }"></c:set>
				
          
           <p><c:out value="${j.getNomRepas(j.getId_repas())}"></c:out></p>
         
           </c:forEach>
           
     <td><c:out value="${total}"/>DH</td>

<c:set var="total" value="0"></c:set>
 </td>
             <c:if test="${i.getTraiter()==0}"><td><div  class="btn btn-primary"><c:out value="en cours de traitement"/></div></td></c:if>
             <c:if test="${i.getTraiter()==1}">
             <c:if test="${i.getEtat()==0}">
             
            <td><div  class="btn btn-danger"><c:out value="commande refusée"/></div></td> 
            </c:if>
             
             
               <c:if test="${i.getEtat()==1}">
                <c:if test="${i.getStatut()==0}">
           
             <td><button
             onclick="myFunction4(this,'25%')" data-toggle="modal" data-target="#myModal" class="btn btn-info"><c:out value="commande acceptée"/></button>
             
             
             
             </td></c:if>
             
                <c:if test="${i.getStatut()==2}">
           
             <td><button
             onclick="myFunction4(this,'45%')" data-toggle="modal" data-target="#myModal" class="btn btn-success"><c:out value="Livraison en Attente"/></button>
             
             
             
             </td></c:if>
             
             
             
             
                <c:if test="${i.getStatut()==3}">
           
           
              <td><button
             onclick="myFunction4(this,'75%')" data-toggle="modal" data-target="#myModal" class="btn btn-success"><c:out value="Livraison en Route"/></button>
             
             
             
             
             
             </td></c:if>
             
             
             
               <c:if test="${i.getStatut()==4}">
             
             
             <td><button
             onclick="myFunction5(this,'100%',${i.getId()},${client.getId() })" data-toggle="modal" data-target="#myModal1" class="btn btn-warning"><c:out value="commande Livrée"/></button>
             
             
             
             </td></c:if>
             
             
             </c:if></c:if>
            
              
          </tr>
          
            <div id="myModal" data-backdrop="false" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Livraison</h4>
      </div>
      <div class="modal-body">
        <div id="id3"  class="progress"  >
 <div   ></div>
</div>
         <!--<c:forEach items="${i.getEleC()}" var="j">
	
       <p><c:out value="${j.getId_repas()}"/></p>
        
        </c:forEach> -->
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
      </div>
    </div>

  </div>
</div>


 <div id="myModal1" data-backdrop="false" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
     <form action="Controller" method="post">
    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Livraison</h4>
      </div>
      <div class="modal-body">
        <div id="id2"  class="progress"  >
      
</div>
	 <input type="hidden" name="page" value="comment-commande">

     <input type="hidden" name="idcl" id="idcl" value=""/>
     <input type="hidden" id="idco" value="" name="idco"/>
    
         <input class="form-control" type="text" name="comment"  placeholder="Envoyer un commentaire"/>
         <!--<c:forEach items="${i.getEleC()}" var="j">
	
       <p><c:out value="${j.getId_repas()}"/></p>
        
        </c:forEach> -->
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       <button  type="submit"  class="btn btn-default"  >envoyer </button>
   
      </div></form>
    </div>

  </div></form>
</div>
          </c:forEach> 
   </c:when>
    	
  <c:when test="${listCommandes == null}">
   
 
			</c:when></c:choose>
            
          
        </tbody>
				 
      </table>

    </div>  
       
  
      </div> 
     
    </div>
 
  <br><br>  
 
  <div class="footer">
   <footer class="page-footer font-small blue">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2021 Copyright:
    <a href="https://mdbootstrap.com/"> marakech.magique.com</a>
  </div>
  <!-- Copyright -->

</footer></div>
 
<script>

function myFunction4(elem,id){ 
	$('#id3').css("width",id);
	$('#id3').css("color","white");

	$('#id3').html(id);
	 
	
 
}
 
function myFunction5(elem,id,id1,id2){ 
	$('#id2').css("width",id);
	$('#id2').css("color","white");
	$('#id2').html(id);
	$("#idcl").val(id2);
	$("#idco").val(id1);
	
	
	 
	
 
}	 
	  
 
</script>
</body>
</html>
