package Controllers;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ConnexionBD;
import Models.Commande;
import Models.CommandeE;
import Models.fonction;

public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderServlet() {
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

		/*
		 * try { Element_Commande e =new Element_Commande(); ArrayList<CommandeE>
		 * listeCommande=e.getCommande(0); for(int i = 0; i < listeCommande.size(); i++)
		 * { int id=listeCommande.get(i).getId(); String idS=Integer.toString(id);
		 * 
		 * String[] etat=request.getParameterValues("choix"+id);//comment recuperer la
		 * valeur de getParametre de radio :prob database int
		 * c=Integer.parseInt(etat[0]); Element_Commande.ApprouverRefuser(id,c,1);
		 * 
		 * 
		 * 
		 * 
		 * }
		 * 
		 * view = request.getRequestDispatcher("adminorder.jsp");
		 * 
		 * view.forward(request, response);
		 * 
		 * }catch(Exception e) { view = request.getRequestDispatcher("adminorder.jsp");
		 * 
		 * view.forward(request, response); }
		 */
		try {
			fonction e = new fonction();
			ArrayList<Commande> listeCommande = e.getCommande(0, 0, 0);
			for (int i = 0; i < listeCommande.size(); i++) {
				int id = listeCommande.get(i).getId();
				String idS = Integer.toString(id);

				String[] etat = request.getParameterValues("choix" + id);// comment recuperer la valeur de getParametre
																			// de radio :prob database
				int c = Integer.parseInt(etat[0]);
				fonction.ApprouverRefuser(id, c, 1);

			}

			view = request.getRequestDispatcher("Admin_Livraison.jsp");

			view.forward(request, response);

		} catch (Exception e) {
			view = request.getRequestDispatcher("Admin_Order.jsp");

			view.forward(request, response);
		}

	}

}
