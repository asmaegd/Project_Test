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
 * Servlet implementation class HistoriqueServlet
 */
@WebServlet("/HistoriqueServlet")
public class HistoriqueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoriqueServlet() {
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
		// TODO Auto-generated method stub
		RequestDispatcher view;
		 int status = Integer.parseInt(request.getParameter("status"));
		 fonction e =new fonction();
		 
		  ArrayList<Commande> listeCommandeHistorique= e.getCommandeStatus(1,1,status);
		  
	
			  
		   
	
		  
			   request.setAttribute("listeCommandeHistorique",listeCommandeHistorique);
			   
			  
		  
		  
		   view = request.getRequestDispatcher("Admin_Historique.jsp");		
			
			view.forward(request, response);
	}

}
