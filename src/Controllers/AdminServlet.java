package Controllers;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.*;
import Models.fonctionClient;

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	public AdminServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
			ConnexionBD cnx = new ConnexionBD();
			cnx.creerInstruction("SELECT * FROM admin WHERE login = ? and passe = ? ");
			String login = request.getParameter("email");
			String pass = request.getParameter("pass");
			String type = "";

			try {
				cnx.getInstructionPrepare().setString(1, login);
				cnx.getInstructionPrepare().setString(2, pass);

				ResultSet rs = cnx.lire();
				if (rs.next()) {
					int id_Admin = rs.getInt("id");
					RequestDispatcher view;

					view = request.getRequestDispatcher("EspaceAdmin.jsp"); // Page Admin
				 session = request.getSession();
					session.setAttribute("id_Admin", id_Admin);
					view.forward(request, response);
				} else // Si le login n'existe pas
				{
					HttpSession session = request.getSession();
					session.setAttribute("id_Admin", 0);
					request.setAttribute("error", "Mon erreur");
					RequestDispatcher loginVue = request.getRequestDispatcher("Admin_Login.jsp");
					
					loginVue.forward(request, response);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		
	}

}
