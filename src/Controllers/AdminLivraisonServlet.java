package Controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Commande;
import Models.fonction;

/**
 * Servlet implementation class AdminLivraisonServlet
 */

public class AdminLivraisonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLivraisonServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view;
		try {
			fonction e = new fonction();
			ArrayList<Commande> listeCommande = e.getCommande(1, 1, 0);
			for (int i = 0; i < listeCommande.size(); i++) {
				int id = listeCommande.get(i).getId();
				// String idS=Integer.toString(id);

				String livreur = request.getParameter("livreurDispo");// comment recuperer la valeur de getParametre de
																		// radio :prob database
				int id_livreur = Integer.parseInt(livreur);
				fonction.AffectLivreur(id, id_livreur);
				fonction. missionTerminee(id_livreur, 1);

			}

			view = request.getRequestDispatcher("Admin_Livraison.jsp");

			view.forward(request, response);

		} catch (Exception e) {
			view = request.getRequestDispatcher("Admin_Livraison.jsp");

			view.forward(request, response);
		}

	}

}
