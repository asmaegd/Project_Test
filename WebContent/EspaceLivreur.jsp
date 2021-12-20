<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<%@page import="Models.*"%>
<%@page import="DB.*"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Espace livreur</title>

    <!-- Bootstrap core CSS-->
    <link href="ressources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="ressources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="ressources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="ressources/css/sb-admin.css" rel="stylesheet">
<style>
 
</style>
  </head>

  <body id="page-top">
<%try{ int id_livreur = Integer.parseInt(session.getAttribute("id_livreur").toString());
		if(id_livreur != 0){
			%>
    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
  
      <a class="navbar-brand mr-1" href="EspaceLivreur.jsp">Welcome ${sessionScope.nom}</a>
	  <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
        <i class="fas fa-bars"></i>
      </button>
      <!-- Navbar -->
      <ul class="navbar-nav ml-auto mr-0 mr-md-3 my-2 my-md-0">    
        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
           <!--  <a class="dropdown-item" href="Profil_livreur.jsp">Paramètres</a> 
            <div class="dropdown-divider"></div> -->
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Déconnexion</a>
          </div>
        </li>
      </ul>

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="EspaceLivreur.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Tableau de bord </span>
          </a>
        </li>

		<li class="nav-item">
          <a class="nav-link" href="CommandesLivrées.jsp">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Commandes livrées</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="CommandesEnAttentes.jsp">
            <i class="fas fa-fw fa-table"></i>
            <span>Commandes en attente</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Route.jsp">
            <i class="fas fa-fw fa-table"></i>
            <span>Commandes en route</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Livrer.jsp">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Livrer</span></a>
        </li>
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="EspaceLivreur.jsp">Tableau de bord</a>
            </li>
            <li class="breadcrumb-item active">Accueil</li>
          </ol>

          <!-- Icon Cards-->
          <div class="row">
            <div class="col-xl-3 col-sm-6 mb-3">
            <a  href="Route.jsp" style="text-decoration:none">
              <div class="card text-white bg-danger o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-life-ring"></i>
                  </div>
                  <div class="mr-5">Commandes en route</div>
                </div>
                <div class="card-footer text-white clearfix small z-1">
                  <span class="float-left">
                 		<%
                 		  int id_livreur_route = Integer.parseInt(session.getAttribute("id_livreur").toString());
                 		
                		  fonction e_route =new fonction();
                		
                		  int n_route = e_route.getCountCommande(1, 1, id_livreur_route, 3);
                		  out.print(n_route);
                  %>
				  </span>
                   
                </div>
              </div></a>
            </div> 
           
            <div class="col-xl-3 col-sm-6 mb-3">
            <a  href="CommandesEnAttentes.jsp" style="text-decoration:none">
              <div class="card text-white bg-warning o-hidden h-100">
                <div class="card-body"> 
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-list"></i>
                  </div>
                  <div class="mr-5">Commandes en attente</div>
              </div>
                <div class="card-footer text-white clearfix small z-1">
                  <span class="float-left"><%
                		  fonction e_att =new fonction();
                		  int id_livreur_att = Integer.parseInt(session.getAttribute("id_livreur").toString());
                		  int n_att = e_att.getCountCommande(1, 1, id_livreur_att, 2);
                		  out.print(n_att);
                  %></span>
                  <!-- <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span> -->
                </div>
              </div>  </a>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
            <a  href="CommandesLivrées.jsp" style="text-decoration:none">
              <div class="card text-white bg-success o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-shopping-cart"></i>
                  </div>
                  <div class="mr-5">Commandes livrées</div>
                </div>
                <div class="card-footer text-white clearfix small z-1">
                  <span class="float-left"><%
                		  fonction e_l =new fonction();
                		  int id_livreur_l = Integer.parseInt(session.getAttribute("id_livreur").toString());
                		  int n_l = e_l.getCountCommande(1, 1, id_livreur_l, 4);
                		  out.print(n_l);
                  %></span>
                  <!-- <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span> -->
                </div>
              </div>
           </a> </div>
            
          </div>

          <div>
          <ol class="breadcrumb">
           	<h3><a class="dropdown-item" href="#" data-toggle="modal" data-target="#dispo">Mission términée?</a></h3>    
          </ol>
          </div>

        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>NAOUAL & NISSRINE & ZINEB Copyright © 2021  | ENSA SAFI.</span>
            </div>
          </div>
        </footer>

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Prêt à partir ?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Sélectionnez "Déconnexion" ci-dessous si vous êtes prêt à mettre fin à votre session en cours. </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Retour</button>
            <a class="btn btn-primary" href="LogoutServlet?page=livreur">Déconnexion</a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- dispo -->
    <div class="modal fade" id="dispo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Mission términée ?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Sélectionnez "Oui" ci-dessous si vous terminez votre mission. </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Non</button>
            <form action="DisponibiliteLivreur" method="post">
            	<input type="submit" class="btn btn-primary" name="Oui" value="Oui">
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="ressources/vendor/jquery/jquery.min.js"></script>
    <script src="ressources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="ressources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="ressources/vendor/chart.js/Chart.min.js"></script>
    <script src="ressources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="ressources/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="ressources/js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="ressources/js/demo/datatables-demo.js"></script>
    <script src="ressources/js/demo/chart-area-demo.js"></script>
<%}}catch(Exception e){
			 response.sendRedirect("LivreurLogin.jsp");
			
		}%>
  </body>

</html>
