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
 * Servlet implementation class Maplivraioson
 */
@WebServlet("/Maplivraioson")
public class Maplivraioson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Maplivraioson() {
        super();
        // TODO Auto-generated constructor stub
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
			int ids = Integer.parseInt(request.getParameter("commencerLiv"));
			fonction.LivreeOuAttente(ids, 3);	
			
		   view = request.getRequestDispatcher("Route.jsp");		
			
			view.forward(request, response);
			
		}catch(Exception e) {
			  view = request.getRequestDispatcher("Route.jsp");		
				
				view.forward(request, response);
		}
	}

}
