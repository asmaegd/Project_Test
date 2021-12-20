<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.*"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">


    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marrakech magique</title>

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
<style>


 
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
					
						
						<li><a href="Controller?page=user&id=<c:out value='${client.getId() }'></c:out>">Mon Compte(<c:out value="${client.getNom()}"></c:out>)</a></li>
			 
			  <li><a href="Controller?page=affichercart">
             <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            cart(<c:out value="${x}"/>)</a></li>
            <li><a href="Controller?page=deconnexion" style="color: #F24638;">Se déconnecter</a></li>
            </c:when>
				</c:choose>
             
        </ul>
    </nav>
 
</header>
 <div class="modal fade" id="myModal" style="top:30px">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header --> <br>
        <div class="modal-header">
        
             </div>
        
        <!-- Modal body -->
        <div class="modal-body" style="font-size:15px">
       <center> <c:out value="${message }"></c:out><center>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width:30%">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
 
 
 <div id="id2" class="modal1" style="margin-top:30px">
  
  <form class="modal-content " action="Controller" method="post">
    

	 <input type="hidden" name="page" value="authentifier-form">
	 
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
<!-- header section ends -->

<!-- home section starts  -->
<!--<c:if test="${wran != null}">
					
 <div style="
  padding: 20px;
  background-color:#ff9800;//#04AA6D
  color: white;
  width:70%;
  position :fixed;
   z-index: 9;
   font-size:15px;
  top:100px;" class="alert alert-danger alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Remarque!</strong> <c:out value="${wran }"></c:out>.
  </div>
  </c:if>-->
<section class="home" id="home">

    <div class="content" data-aos="fade-right">
     <h4>  <h3> MarakechMagique<h3>
        la bonne nourriture offre un grand sourire </h4>
         <p>
         MarakechMagique vous propose une cuisine maroccain de qualité avec des produits frais de saison, dans un cadre sobre et élégant situé en plein coeur de Marrakech et de ses commerces.
Le chef & son équipe vous proposent une cuisine maroccain authentique de tradition 
         </p>
      
      <c:if test="${session == null}">
					
        <a href="Controller?page=inscrire"><button class="btn">Inscrire maintenant</button></a>
    </c:if>
         </div>

    <div class="image" data-aos="fade-up">
        <img src="images/im.png" alt="">
    </div>

</section>
  
 
 

<!-- popular section starts  -->
<section class="menu" id="menu">

<h1 class="heading"> notre délicieux <span>menu</span> </h1>

<ul class="list" data-aos="fade-down">
    <li class="btn   active"   onclick="openMenu('Sandwiches')">Sandwiches</li>
    <li class="btn  "  onclick="openMenu('Burger&Pizza')">Burger ET Pizza</li>
    <li class="btn"  onclick="openMenu('Deseert&Juice')">Dessert Et Juices</li>
    <li class="btn" onclick="openMenu('CuisineTr')">Cuisine traditionnelle</li>
</ul>

<div class="row" data-aos="fade-right">

     
<section class="popular" id="html_links" >
 
<div 
id="Sandwiches"  class="repas"
>  
 							
		 			
  <div class="box-container"  >
 
<c:forEach items="${listRepas }" var="repas">
<c:if test="${repas.getCategorie() ==1 }">
  

  
  
   
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

    <div class="box" data-aos="fade-right">
        <a href="Controller?page=DetailRepas&id=<c:out value='${repas.getId() }'></c:out>"><img src="images/${repas.getImage() }" alt=""> </a>
        <h3> <c:out value="${ repas.getNom_repas() }"></c:out></h3>
          <div class="price"><c:out value="${ repas.getPrix() }"></c:out>DH</div>
     
        <div class="stars">
         <h3><c:out value='${repas.getRating() }'></c:out> <i class="fas fa-star"></i></h3>  
          
        </div>
         <c:if test="${session == null}">
					
     
     
      <button  onclick="document.getElementById('id2').style.display='block'"  class="btn">ajouter au panier</button></c:if>
      <c:if test="${session != null}">
		 <button onclick="myFunction1(this,${repas.getId()})" class="btn">ajouter au panier</button></c:if>
    
    </div>
    
</c:if>
</c:forEach>
</div>
 		
    </div>
<div 
id="Burger&Pizza" style="display:none"
class="repas">  
  					
		 			
  <div class="box-container"  >
 
<c:forEach items="${listRepas }" var="repas">
<c:if test="${repas.getCategorie() ==2 }">
<div id="id02" class="modal1">
  
  <form class="modal-content animate" action="Controller" method="post">
    

	 <input type="hidden" name="page" value="demande-repas">
	  <input type="hidden" id="Id2" name="id_repas" value="">
	 
	 	<h3 style="margin-top:30px; color:#F24638;font-size:15ps"><center><c:out value="${msg}"></c:out></center></h3>
    <div class="container">
    
      <label><b><p style="font-size:15px">Entrez la quantité</p></b></label>
     <div class="form-group">
   
  <input type="number" style="font-size:15px"  id="quantity" name="quantity" min="1" max="5" class="form-control">
</div>
       
     <button type="submit" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-check" aria-hidden="true">Confirmé</i></button>
        
    </div>

   <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn" >Cancel</button>
      </div>
  </form>
</div>

 		<div class="box" data-aos="fade-right">
        <a href="Controller?page=DetailRepas&id=<c:out value='${repas.getId() }'></c:out>"><img src="images/${repas.getImage() }" alt=""> </a>
        <h3> <c:out value="${ repas.getNom_repas() }"></c:out></h3>
           <div class="price"><c:out value="${ repas.getPrix() }"></c:out>DH</div>
     
         <div class="stars">
         <h3><c:out value='${repas.getRating() }'></c:out> <i class="fas fa-star"></i></h3>  
          
        </div>
     
      <button onclick="myFunction2(this,${repas.getId()})" class="btn">ajouter au panier</button>
    </div>
       
 
</c:if>
</c:forEach>
</div>
 		
 
    </div>
    <div 
id="Deseert&Juice"  class="repas" style="display:none"
>  
		 			
  <div class="box-container"  >
 

  <c:forEach items="${listRepas}" var="repas">
<c:if test="${repas.getCategorie()==3}">
 							
    <div id="id03" class="modal1">
  
  <form class="modal-content animate" action="Controller" method="post">
    

	 <input type="hidden" name="page" value="demande-repas">
	  <input type="hidden" id="Id3" name="id_repas" value="">
	 
	 	<h3 style="margin-top:30px; color:#F24638;font-size:15ps"><center><c:out value="${msg}"></c:out></center></h3>
    <div class="container">
    
      <label><b><p style="font-size:15px">Entrez la quantité</p></b></label>
     <div class="form-group">
   
  <input type="number" style="font-size:15px"  id="quantity" name="quantity" min="1" max="5" class="form-control">
</div>
       
     <button type="submit" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-check" aria-hidden="true">Confirmé</i></button>
        
    </div>

   <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn" >Cancel</button>
      </div>
  </form>
</div>

 		<div class="box" data-aos="fade-right">
        <a href="Controller?page=DetailRepas&id=<c:out value='${repas.getId() }'></c:out>"><img src="images/${repas.getImage() }" alt=""> </a>
        <h3> <c:out value="${ repas.getNom_repas() }"></c:out></h3>
         <div class="price"><c:out value="${ repas.getPrix() }"></c:out>DH</div>
     
        <div class="stars">
         <h3><c:out value='${repas.getRating() }'></c:out> <i class="fas fa-star"></i></h3>  
          
        </div>
      
      <button onclick="myFunction3(this,${repas.getId()})" class="btn">ajouter au panier</button>
    </div>
       
 
</c:if>
</c:forEach>
</div>
 		
    </div>

    <div 
id="CuisineTr" style="display:none"
class="repas">  
   <div class="box-container"  >
 

  <c:forEach items="${listRepas}" var="repas">
<c:if test="${repas.getCategorie()==4}">
 							
    <div id="id04" class="modal1">
  
  <form class="modal-content animate" action="Controller" method="post">
    

	 <input type="hidden" name="page" value="demande-repas">
	  <input type="hidden" id="Id4" name="id_repas" value="">
	 
	 	<h3 style="margin-top:30px; color:#F24638;font-size:15ps"><center><c:out value="${msg}"></c:out></center></h3>
    <div class="container">
    
      <label><b><p style="font-size:15px">Entrez la quantité</p></b></label>
     <div class="form-group">
   
  <input type="number" style="font-size:15px"  id="quantity" name="quantity" min="1" max="5" class="form-control">
</div>
       
     <button type="submit" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-check" aria-hidden="true">Confirmé</i></button>
        
    </div>

   <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id04').style.display='none'" class="cancelbtn" >Cancel</button>
      </div>
  </form>
</div>

 		<div class="box" data-aos="fade-right">
        <a href="Controller?page=DetailRepas&id=<c:out value='${repas.getId() }'></c:out>"><img src="images/${repas.getImage() }" alt=""> </a>
        <h3> <c:out value="${ repas.getNom_repas() }"></c:out></h3>
        <div class="price"><c:out value="${ repas.getPrix() }"></c:out>DH</div>
     
         <div class="stars">
         <h3><c:out value='${repas.getRating() }'></c:out> <i class="fas fa-star"></i></h3>  
          
        </div>
       
      <button onclick="myFunction4(this,${repas.getId()})" class="btn">ajouter au panier</button>
    </div>
       
 
</c:if>
</c:forEach>
</div>
 		
    </div>
    </div>
</section>
    
 </div>

 

</section>


<!-- popular section ends -->




<div class="footer">

    <div class="box-container">

        <div class="box">
            <h3>contact info</h3>
            <p> <i class="fas fa-map-marker-alt"></i> Maroc, Marrakech 4040 </p>
            <p> <i class="fas fa-envelope"></i> marakechMagique@gmail.com </p>
            <p> <i class="fas fa-phone"></i> +212-654567899 </p>
            <p> <i class="fas fa-phone"></i>0567883321 </p>
        </div>

        <div class="box">
         <p> <i class="fas fa-map-marker-alt"></i> Les villes </p>
            
           <p> <i class="fas "></i> Casablanca</p>
          <p> <i class="fas "></i> Fafi</p>
          <p> <i class="fas "></i> Assaouira</p>
          <p> <i class="fas "></i> Marrakech</p>
        
        </div>

        <div class="box">
            <h3>Liens rapides </h3>
            <a href="Controller?page=index">acceuil</a>
              <a href="Controller?page=inscrire">inscrire</a>
             </div>

        <div class="box">
            <h3>Suivez nous</h3>
            <a href="https://www.instagram.com/marrakech_magique/">instagram</a>
            <a href="https://www.facebook.com/profile.php?id=100068536247028">facebook</a>
           
        </div>

    </div>

    <h1 class="credit">crée par <a href="#">MarakechMagique</a></h1>

</div>
 













<!-- aos js cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

<!-- jquery cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- custom js file link  -->
<script src="js/script.js"></script>

<!-- initializing aos  -->

<script>

    AOS.init({
        delay:400,
        duration:1000
    })

 
 
function openMenu(repas) {
   
   var i;
  var x = document.getElementsByClassName("repas");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  document.getElementById(repas).style.display = "block";  
}
    function myFunction1(elem,id){
    	document.getElementById('id01').style.display='block';
    	  $('#Id1').val(id);
    }
    function myFunction2(elem,id){
    	document.getElementById('id02').style.display='block';
    	  $('#Id2').val(id);
    }
    function myFunction3(elem,id){
    	document.getElementById('id03').style.display='block';
    	  $('#Id3').val(id);
    }
    function myFunction4(elem,id){
    	document.getElementById('id04').style.display='block';
    	  $('#Id4').val(id);
    }
    $(document).ready(function(){
    	  $('[data-toggle="popover"]').popover();   
    	});
</script>
</body>
</html>