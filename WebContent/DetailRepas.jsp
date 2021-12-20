<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Detail Repas</title>
 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marrakech magique</title>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- aos css cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">

    <!-- google fonts cdn link  -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200;400;500&family=Roboto:wght@100;300;400;500&display=swap" rel="stylesheet">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">
     <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
    />
     <link rel="stylesheet" href="css/stylerat.css" />
    <script src="js/index.js" defer></script>
   
  <style>
  
   .checked {
  color:red;
}

body{
font-size:16px;}
 
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #008B8B;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */


 
.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal1{
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 50%; /* Full width */
  height: 100%; /* Full height */
  /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
.modal-backdrop
{
    opacity:0.5 !important;
}
.btn1 {
  background: #e60023;
  
  color: #fff;
   
} 
#alert {
  padding: 20px;
  background-color:#ff9800;
  color: white;
  width:70%;
  position :fixed;
  bottom:0;
  
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
.comments-details button.btn.dropdown-toggle,
.comments-details .total-comments {
    font-size: 18px;
    font-weight: 500;
    color: #5e5e5e;
}
.comments-details {
    padding: 15px 15px;
}
.comments .comments .dropdown,
.comments .dropup {
    position: relative;
}
.comments button {
    background-color: transparent;
    border: none;
}
.comments .comment-box {
    width: 100%;
    float: left;
    height: 100%;
    background-color: #FAFAFA;
    padding: 10px 10px 10px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ddd;
}
.comments .add-comment {
    background-color: transparent;
    border: none;
    position: relative;
    margin-bottom: 50px;
}
.comments .commenter-pic {
    width: 50px;
    height: 50px;
    display: inline-block;
    border-radius: 100%;
    border: 2px solid #fff;
    overflow: hidden;
    background-color: #fff;
}
.comments .add-comment .commenter-name {
    width: 100%;
    padding-left: 75px;
    position: absolute;
    top: 20px;
    left: 0px;
}
.comments .add-comment input {
    border-top: 0px;
    border-bottom: 1px solid #ccc;
    border-left: 0px;
    border-right: 0px;
    outline: 0px;
    box-shadow: none;
    border-radius: 0;
    width: 100%;
    padding: 0;
    font-weight: normal;
}
.comments .add-comment input:focus {
    border-color:#1D666B;
    border-width: 2px;
}
.comments .add-comment button[type=submit] {
    background-color:#1D666B;
    color: #fff;
    margin-right: 0px;
}
.comments .add-comment button {
    background-color: #f5f5f5;
    margin: 10px 5px;
    font-size: 14px;
    text-transform: uppercase;
    float: right;
}
.comments .commenter-name .comment-time {
    font-weight: normal;
    margin-left: 8px;
    font-size: 15px;
}
.comments p.comment-txt {
    font-size: 15px;
    border-bottom: 1px solid #ddd;
    padding: 0px 0px 15px;
}
.comments .commenter-name {
    display: inline-block;
    position: relative;
    top: -20px;
    left: 10px;
    font-size: 16px;
    font-weight: bold;
}
.comments .comment-meta {
    font-size: 14px;
    color: #333;
    padding: 2px 5px 0px;
    line-height: 20px;
    float: right;
}
.comments .reply-box {
    display: none;
}
.comments .replied {
    background-color: #fff;
    width: 95%;
    float: right;
    margin-top: 15px;
}

/*======Responsive CSS=======*/
@media (max-width: 767px){
.comments .commenter-name {
    font-size: 13px;
    top: -5px;
}
.comments .commenter-pic {
    width: 40px;
    height: 40px;
}
.comments .commenter-name a{
  display: block;
}
.comments .commenter-name .comment-time{
  display: block;
  margin-left: 0px;
}
</style>
</head>
<body>
 <c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlistQ}" var="i">
		<c:set var="x" value="${x+1}"></c:set>
	</c:forEach>

<header>
    <a href="#" class="logo"><img src="images/logo-img.png" alt=""></a>

    <div id="menu-bar" class="fas fa-hamburger"></div>

    <nav class="navbar">
        <ul>
            <li><a class="active" href="Controller?page=index">Acceuil</a></li>
            <c:choose>
					<c:when test="${session == null}">
						 	<li><a href="Controller?page=inscrire">Inscription</a></li>
						 	 <li>
<button id="button1" onclick="document.getElementById('id2').style.display='block'" style="width:auto;
     background-color: #008B8B; font-size:15px;  padding: 14px 20px;  margin: 8px 0; border: none; cursor: pointer; width: 100%;color:white;">Authentifier</button></li>
					</c:when>
					<c:when test="${session != null}">
					
						<li><a href="Controller?page=deconnexion" style="color: #F24638;">Se déconnecter</a></li>
						<li><a href="Controller?page=user&id=<c:out value='${client.getId() }'></c:out>">Mon Compte(<c:out value="${client.getNom()}"></c:out>)</a></li>
			 
			  <li><a href="Controller?page=affichercart">
             <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            cart(<c:out value="${x}"/>)</a></li>
            </c:when>
				</c:choose>
             
        </ul>
    </nav>
 
</header>
 

 <div id="id2" class="modal1" style="margin-top:30px">
  
  <form class="modal-content animate" action="Controller" method="post">
    

	 <input type="hidden" name="page" value="authentifier-form-DetailRepas">
	 
	 	<h3 style="margin-top:30px; color:#F24638;font-size:15ps"><center><c:out value="${msg}"></c:out></center></h3>
    <div class="container">
    
      <label for="username"><b><p style="font-size:15px">Username</p></b></label>
      <input type="text" placeholder="Enter Username" name="username" required style="font-size:15px">

      <label for="psw"><p style="font-size:15px"><b>Password</b> </p></label>
      <input type="password" placeholder="Enter Password" name="password" required style="font-size:15px">
        
      <button type="submit" style="font-size:14px">Login</button>
      
    </div>

     <div class="container" style="background-color:#f1f1f1">
      <button type="button" style="font-size:14px" onclick="document.getElementById('id2').style.display='none'" class="cancelbtn">Cancel</button>
      </div>
  </form>
</div>

  <div class="container">
  
    <div class="row">
        <div class="col-xl-5">
    <section class="popular" id="popular" >
 
 
  <div class="box-container"  >
 
  <div class="box" >
        
        <a href="Controller?page=DetailRepas&id=<c:out value='${repas.getId() }'></c:out>"><img src="images/${rep.getImage() }" alt=""> </a>
        <h3> <c:out value="${ rep.getNom_repas() }"></c:out></h3>
         <div class="stars">
         <h3><c:out value='${rep.getRating() }'></c:out> <i class="fas fa-star"></i></h3>  
          
        </div>
        <div class="price"><c:out value="${ rep.getPrix() }"></c:out>DH</div>
     
      <button onclick="myFunction1(this,${rep.getId()})" class="btn">ajouter au panier</button>
    </div>
</div>
 
   

 
</section>
      </div> 


    <br>     <br> 
    <div class="col-xl-7"> 
    <br> 
    <br><br> 
    <br>
          <div class="card" style="">
  <div class="card-body">
    <h5 class="card-title"><c:out value="${rep.getPrix() }"></c:out>DH</h5>
    <p class="card-text"><c:out value="${rep.getDescription() }"></c:out></p>
        
    <a href="Controller?page=index" class="btn btn-default" style="background-color:#1D666B; color:white">continuer l'achat</a>
  </div>
</div> 
<br>
      <div class="card" style="">
  <div class="card-body">
    <h5 class="card-title">COMMENTAIRES</h5>
    <p class="card-text"> <b><c:out value="${nbrCommentaires}"></c:out></b> Commantaires</p>
     <div class="comments">
        <div class="comments-details">
               
        </div>
	
           <c:if test="${session != null}">
          <form method="post" action="Controller">
        <div class="comment-box add-comment">
          <span class="commenter-pic">
            <img src="images/user-icon.png" class="img-fluid">
          </span>
          <span class="commenter-name">
           <input type="hidden" name="client" value="${client.getId()}">
             <input type="hidden" name="idRep" value="${rep.getId()}">
     
	 <input type="hidden" name="page" value="commentaire-form">
	 <input type="hidden" name="id" value="${rep.getId()}">
	 
            <input type="text" placeholder="Ajouter un nouveau commentairet" name="commenter" required><br>
             <div>
      <span class="fas fa-star" data-star="1"></span>
      <span class="fa fa-star" data-star="2"></span>
      <span class="fas fa-star" data-star="3"></span>
      <span class="fas fa-star" data-star="4"></span>
      <span class="fas fa-star" data-star="5"></span>
       <input id="rating" value="0" type="hidden" name="valRat"> 
    </div>
            <button type="submit" class="btn btn-default">Commenter</button>
            <button type="reset" class="btn btn-default">Annuler</button>
          </span>
        </div>
      </form></c:if>
          
        </div>
  </div>
</div> 
        </div>
  
    



 
       
       
  
    </div>
     <div id="id01" class="modal1">
  
  <form class="modal-content animate" action="Controller" method="post">
    

	 <input type="hidden" name="page" value="demande-repas">
	  <input type="hidden" id="Id1" name="id_repas" value="">
	 
	 	<h3 style="margin-top:30px; color:#F24638;font-size:15ps"><center><c:out value="${msg}"></c:out></center></h3>
    <div class="container">
    
      <label><b><p style="font-size:15px">Entrez la quantité</p></b></label>
     <div class="form-group">
   
  <input type="number" style="font-size:15px"  id="quantity" name="quantity" min="1" max="5" class="form-control">
</div>
       
     <button type="submit" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-check" aria-hidden="true">Confirmé</i></button>
        
    </div>

   <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn" >Cancel</button>
      </div>
  </form>
</div>
    <br>
     <h5>NOUVEAUX COMMENTAIRES</h5>
         
    <c:forEach items="${elementsComments}" var="comment">
 
  
 <div class="row">
 
    <div class="col-12">
      <div class="comments">
        <div class="comments-details">
              
        </div>
      
        <div class="comment-box">
          <span class="commenter-pic">
            <img src="images/user-icon.png" class="img-fluid">
          </span>
          <span class="commenter-name">
            <a href="#"> <c:out value="${comment.getNomClient(comment.getId_cl())}"></c:out></a><span class="comment-time"><c:out value="${comment.getTime() }"></c:out></span>
          </span>       
          <p class="comment-txt more"> <c:out value="${comment.getContenu()}"></c:out></p>
         
          </div>
          <div class="comment-box add-comment reply-box">
            <span class="commenter-pic">
              <img src="/images/user-icon.jpg" class="img-fluid">
            </span>
             
          </div>
        </div>
        </div>
   
 
      </div>
</c:forEach>
    </div>
  </div>
  </div><br><br>
  <div class="footer">
   <footer class="page-footer font-small blue">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2021 Copyright:
    <a href="https://mdbootstrap.com/"> marakech.magique.com</a>
  </div>
  <!-- Copyright -->

</footer></div>
<!-- Foote
</div>
 <!-- Footer -->


</body>
</html>
<!-- aos js cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

<!-- jquery cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 
<script>

    AOS.init({
        delay:400,
        duration:1000
    })
    function myFunction1(elem,id){
    	document.getElementById('id01').style.display='block';
    	  $('#Id1').val(id);
    }
 
 
 
</script>