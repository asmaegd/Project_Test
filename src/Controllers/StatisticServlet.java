package Controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ConnexionBD;
import Models.Element_Commande;
import Models.fonction;

/**
 * Servlet implementation class StatisticServlet
 */

public class StatisticServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StatisticServlet() {
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
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		int id_cat = Integer.parseInt(request.getParameter("cat"));
		ArrayList<Element_Commande> commande_statique = fonction.getCommandeStatistics(from, to, id_cat);

		ArrayList<Element_Commande> liste_statestique = new ArrayList<Element_Commande>();

		for (int i = 0; i < commande_statique.size(); i++) {
			int id_commande = commande_statique.get(i).id_repas;
			int quantite = commande_statique.get(i).quantite;
			for (int j = i + 1; j < commande_statique.size(); j++) {
				if (id_commande == commande_statique.get(j).id_repas) {

					quantite += commande_statique.get(j).quantite;
					i = j;
				}
			}

			liste_statestique.add(new Element_Commande(commande_statique.get(i).id_repas, quantite));
			id_commande = commande_statique.get(i).id_repas;
			quantite = commande_statique.get(i).quantite;

		}
		
		request.setAttribute("aa", liste_statestique);
		
		view = request.getRequestDispatcher("Admin_Statistique.jsp");

		view.forward(request, response);
}catch (Exception e) {
	view = request.getRequestDispatcher("Admin_Statistique.jsp");

	view.forward(request, response);
}
		/*
		 * String del="delivered";
		 * 
		 * 
		 * int hb = 0; int cb =0; int dcb=0;
		 * 
		 * int hbprice=0; int cbprice=0; int dcbprice=0; String item
		 * =resultSet.getString("item"); String qt =resultSet.getString("quantity");
		 * String price =resultSet.getString("price"); if (item.equals("hamburger")) {
		 * hb+=Integer.parseInt(qt); hbprice+=Integer.parseInt(price);
		 * 
		 * //out.println("yes"+hb); }else if(item.equals("cheeseburger")) {
		 * cb+=Integer.parseInt(qt); cbprice+=Integer.parseInt(price); //
		 * out.println("No"+cb); }else { dcb+=Integer.parseInt(qt);
		 * dcbprice+=Integer.parseInt(price); //out.println("Very"+dcb); }
		 * 
		 * 
		 * }
		 * 
		 * } catch (Exception e) { e.printStackTrace(); }
		 */

	}

}
