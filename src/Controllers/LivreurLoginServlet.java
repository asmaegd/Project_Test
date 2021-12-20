package Controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.ConnexionBD;

/**
 * Servlet implementation class LivreurLoginServlet
 */
@WebServlet("/LivreurLoginServlet")
public class LivreurLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LivreurLoginServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("LivreurLogin.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConnexionBD cnx=new ConnexionBD();
		cnx.creerInstruction("SELECT * FROM livreur WHERE email = ? and mot_passe = ? ");
		String email = request.getParameter("email");
		String mot_passe = request.getParameter("pass");
		int id_livreur = 0;
		String nom = null;
		
		try {
			cnx.getInstructionPrepare().setString(1, email);
			cnx.getInstructionPrepare().setString(2, mot_passe);
			
			ResultSet rs=cnx.lire();
			if (rs.next())
			{
				id_livreur = rs.getInt("id");
				nom = rs.getString("nom");
				HttpSession session = request.getSession();
				session.setAttribute("id_livreur", id_livreur);
				session.setAttribute("nom", nom);
				RequestDispatcher view = request.getRequestDispatcher("EspaceLivreur.jsp");		// Espace livreur	
				view.forward(request, response);
				
			}
			else	// Si le livreur n'existe pas
			{
				request.setAttribute("erreur", "Mon erreur");
				RequestDispatcher loginVue = request.getRequestDispatcher("LivreurLogin.jsp");
				loginVue.forward(request, response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
