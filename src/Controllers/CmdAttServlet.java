package Controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.ConnexionBD;

import Models.*;


/**
 * Servlet implementation class CmdAttServlet
 */
@WebServlet("/CmdAttServlet")
public class CmdAttServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CmdAttServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view;
		try {
			fonction e =new fonction();
			int id_livreur = Integer.parseInt(request.getSession().getAttribute("id_livreur").toString());
		   	   ArrayList<Commande> listeCommande = e.getCommandeLivreur(1, 1, 3, id_livreur);
			   for(int i = 0; i < listeCommande.size(); i++) {
				   int id=listeCommande.get(i).getId();
					
				   String[] status = request.getParameterValues("choix" + id);//comment recuperer la valeur de getParametre de radio :prob database
					int c = Integer.parseInt(status[0]);
					fonction.LivreeOuAttente(id, c);	
		}
		
		   view = request.getRequestDispatcher("Route.jsp");		
			
			view.forward(request, response);
			
		}catch(Exception e) {
			  view = request.getRequestDispatcher("Route.jsp");		
				
				view.forward(request, response);
		}
	}

}
