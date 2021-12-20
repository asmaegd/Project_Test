package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Livreur;
import Models.client1;
import Models.fonction;
import Models.fonctionClient;

/**
 * Servlet implementation class AdminAddLivreur
 */
@WebServlet("/AdminAddLivreur")
public class AdminAddLivreur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddLivreur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String psw = request.getParameter("pswd");
		if(nom == "" ||  prenom =="" || email =="" || tel =="" || psw ==""  ) {
			
			request.setAttribute("error", "erreur");
			 request.getRequestDispatcher("Admin_AddLivreur.jsp").forward(request, response);
			 
		}else {
			
			 Livreur livreur=new Livreur();
				livreur.setEmail(email);
				livreur.setNom(nom);
				livreur.setMotdepasse(psw);
				livreur.setTele(tel);
				livreur.setPrenom(prenom);
				fonction f=new fonction();
				f.insertLivreur(livreur);
				request.setAttribute("insert", "insert");
		     request.getRequestDispatcher("Admin_AddLivreur.jsp").forward(request, response);
		}
			
	}

}
