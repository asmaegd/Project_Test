<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="Models.*"%>
<%@page import="DB.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Espace Admin</title>

<!-- Bootstrap core CSS-->
<link href="ressources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="ressources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="ressources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="ressources/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">
<%try{ int id_admin = Integer.parseInt(session.getAttribute("id_Admin").toString());
		if(id_admin != 0){
			%>
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
		<a class="navbar-brand mr-1" href="EspaceAdmin.jsp">Admin</a>
		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar -->
		<ul class="navbar-nav ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">

					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal">Déconnexion</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="EspaceAdmin.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i>
					<span>Tableau de bord </span>
			</a></li>


			<li class="nav-item"><a class="nav-link" href="Admin_Order.jsp">
					<i class="fas fa-fw fa-table"></i> <span>Commandes non
						traitée</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="Admin_Livraison.jsp"> <i class="fas fa-fw fa-table"></i> <span>Livraison</span></a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="Admin_Historique.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>Historique</span></a></li>
			<li class="nav-item"><a class="nav-link" href="Admin_Inbox.jsp">
					<i class="fas fa-fw fa-table"></i> <span>Message</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="Admin_AddLivreur.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>Ajout Livreur</span></a></li>
			<li class="nav-item"><a class="nav-link"
				href="Admin_Statistique.jsp"> <i class="fas fa-fw fa-chart-area"></i>
					<span>Statistique</span></a></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="EspaceAdmin.jsp">Tableau
							de bord</a></li>
					<li class="breadcrumb-item active">Livreur</li>
				</ol>

				<!-- Icon Cards-->
				<div class="row"></div>


				<footer class="sticky-footer">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>NAOUAL & NISSRINE & ZINEB Copyright © 2021 | ENSA
								SAFI.</span>
						</div>
					</div>
				</footer>

			</div>
			<!-- /.content-wrapper -->

			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> Ajoutez un livreur
				</div>
				<div class="card-body">
					<div class="card-body">

						<form action="AdminAddLivreur" method="post">

							<div class="form-row">
								<div class="col-md-5">
								<label>Nom : </label>
									<input type="text" name="nom" class="form-control">
								</div>
								<div class="col-md-5">
								<label>Prénom : </label>
									<input type="text" name="prenom" class="form-control">
								</div>
							</div>
							<br>
							<div class="form-row">
								
								<div class="col-md-5">
								<label> Téléphone : </label>
									<input type="text" name="tel" class="form-control">
								</div>
								<div class="col-md-5">
								<label>Email : </label>
									<input type="text" name="email" class="form-control">
								</div>
							</div>
							<br>
							<div class="form-row">
								<div class="col-md-5">
								<label>Mot De Passe : </label>
									<input type="password" name="pswd" class="form-control"
										>
								</div>
								
								<div class="col-md-5">
								
								<label class="text-white">ajoute</label>
									<input type="submit" class="btn btn-primary form-control" value="Enregistrer" >
								</div>
								 
							</div>


						</form>
<br>
<%
			if (request.getAttribute("error") != null) {
			%>
			<div class="alert alert-danger col-md-5">
				<i class="icon-remove-sign"></i> <strong>merci de remplir tous les champs</strong> !
			</div>
			<%
			}
			%>
<%
			if (request.getAttribute("insert") != null) {
			%>
			<div class="alert alert-success col-md-5">
				<i class="icon-remove-sign"></i> <strong>L'insertion effectuée</strong> !
			</div>
			<%
			}
			%>



					</div>
				</div>
				<!-- /#wrapper -->
			</div>
			<!-- /#wrapper -->

			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>

			<!-- Logout Modal-->
			<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Prêt à partir
								?</h5>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">Sélectionnez "Déconnexion"
							ci-dessous si vous êtes prêt à mettre fin à votre session en
							cours.</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button"
								data-dismiss="modal">Retour</button>
							<a class="btn btn-primary" href="LogoutServlet?page=admin">Déconnexion</a>
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
			 response.sendRedirect("Admin_Login.jsp");
			
		}%>
</body>

</html>