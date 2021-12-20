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
	<script type="text/javascript" src="ressources/js/loader.js"></script>
    <title>Espace Admin</title>

    <!-- Bootstrap core CSS-->
    <link href="ressources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="ressources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="ressources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="ressources/css/sb-admin.css" rel="stylesheet">

  </head>

  <body id="page-top">
<%try{ int id_admin = Integer.parseInt(session.getAttribute("id_Admin").toString());
		if(id_admin != 0){
			%>
    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
      <a class="navbar-brand mr-1" href="EspaceAdmin.jsp">Admin</a>
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
           
            
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Déconnexion</a>
          </div>
        </li>
      </ul>

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="EspaceAdmin.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Tableau de bord </span>
          </a>
        </li>

      
        <li class="nav-item">
          <a class="nav-link" href="Admin_Order.jsp">
            <i class="fas fa-fw fa-table"></i>
            <span>Commandes non traitée</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Admin_Livraison.jsp">
            <i class="fas fa-fw fa-table"></i>
            <span>Livraison</span></a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="Admin_Historique.jsp">
            <i class="fas fa-fw fa-table"></i>
            <span>Historique</span></a>
        </li>
       <li class="nav-item">
          <a class="nav-link" href="Admin_Inbox.jsp">
            <i class="fas fa-fw fa-table"></i>
            <span>Message</span></a>
        </li>
        <li class="nav-item"><a class="nav-link"
				href="Admin_AddLivreur.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>Ajout Livreur</span></a></li>
        <li class="nav-item">
          <a class="nav-link" href="Admin_Statistique.jsp">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Statistique</span></a>
        </li>
        
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
         <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="EspaceAdmin.jsp">Tableau de bord</a>
            </li>
            <li class="breadcrumb-item active">Statistique</li>
          </ol>

          <!-- Icon Cards-->
         
           <div class="card mb-2">
            <div class="card-header">
               <i class="fas fa-fw fa-chart-area"></i>
             
              Statistique
             </div>
         

<center>

    <form action="StatisticServlet" method="post">

	
              
              
               <div class="row mb-3">
                <div class="col">
                      
				
			  <select class="form-control" name="cat"><% fonction f=new fonction();

ResultSet rs= f.getCategorie();
    		while (rs.next())
			{

		%>	
			
			    <option value="<%= rs.getInt("id_categorie")%>" <%= rs.getInt("id_categorie")%> ><%= rs.getString("nom_categorie")%> </option>
			    <%} %>
			    </select>
                    </div>
                    <div class="col">
                      <input   class="form-control" type="text" name="from" placeholder="From: " >
                    </div>
                    <div class="col">
                    <input   class="form-control" type="text" name="to" placeholder="To: " >
                    </div>
                </div>
           

<input type="submit" value="Afficher" class="btn btn-lg btn-primary">
</form> 
</center>

   <% 
   
  ArrayList<Element_Commande>liste_statestique =new ArrayList<Element_Commande>();
  
  liste_statestique=( ArrayList<Element_Commande>)request.getAttribute("aa");
  
  String from = request.getParameter("from");  
  String nana="nawal";
  String to = request.getParameter("to1");
 int q=0;
  int size=0;
  
  if(liste_statestique != null){
	 
	  size= liste_statestique.size() ;
	
  }%>

<center>


 <script type="text/javascript">
  var x="";
  var y="200ùù";
  var z="mm";

  var x0=10;
  var x1=10;
 
  var color=["#FCFF00","#FF0000","#b87333","#001EFF","#FF00F7","#00FFFD","#CF6700","#47D101","#01BDD1","#5401D1","#FCFF00","#FF0000","#b87333","#001EFF","#FF00F7","#00FFFD","#CF6700","#47D101","#01BDD1","#5401D1"]
	  
  var rows=<%= size %>
  var tableau = new Array()
  if(rows>0){
		<% String nom_repas="";
		
		for (int i = 0; i < size; i++){
			int j=i+1;
			int quatite=liste_statestique.get(i).quantite;
			int id_repas=liste_statestique.get(i).id_repas;
			 nom_repas=f.getNomRepas(id_repas).toString();
			%>
			tableau[0]=["Item", "Quantité", { role: "style" }, { role: 'annotation' } ];
			
			tableau[<%=j %>]=[x, <%= quatite%>,color[<%=i %>] ,"<%= nom_repas %>"];
			
		<%}%>

  }
	
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart); 
    function drawChart() {
      var data = google.visualization.arrayToDataTable(tableau);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 3,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "la quantité vendue",
        width: 700,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
  </script>
<div id="columnchart_values" ></div>
</center>
					   
    
    </div>        
          </div>

     
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
            <a class="btn btn-primary" href="LogoutServlet">Déconnexion</a>
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