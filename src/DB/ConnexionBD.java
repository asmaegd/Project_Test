package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnexionBD {

	private static Connection cnx;
	private Statement instruction;
	protected ResultSet resultat;
	private PreparedStatement instructionPrepare;

	static {
		try {
			// Connection db=DriverManager.getConnection(
			Class.forName("com.mysql.cj.jdbc.Driver");
			cnx = DriverManager.getConnection("jdbc:mysql://localhost/gestion", "root", "");
			Statement st = cnx.createStatement();
		} catch (ClassNotFoundException ex) {
			System.out.println("Impossible de charger le driver");
		} catch (SQLException ex) {
			System.out.println("Erreur de connexion");
		}

	}

	public static Connection getConnexion() {

		return cnx;
	}

	public PreparedStatement getInstructionPrepare() {
		return instructionPrepare;
	}

	public void fermerInstruction() {
		try {
			if (instructionPrepare != null) {
				instructionPrepare.close();
				instructionPrepare = null;
			}
		} catch (Exception ex) {
			System.out.println("Erreur lors de la fermeture de l'instruction");
			ex.printStackTrace();
		}
	}

	public void creerInstruction(String requete) {
		try {
			fermerInstruction();
			instructionPrepare = cnx.prepareStatement(requete);
		} catch (Exception ex) {
			System.out.println("Erreur lors de la création de l'instruction");
			ex.printStackTrace();
		}
	}

	public ResultSet lire() {
		try {
			return instructionPrepare.executeQuery();
		} catch (Exception ex) {
			System.out.println("Erreur lors de l'execution de la requete de lecture");
			ex.printStackTrace();
			return null;
		}
	}

	public int mettreAJour() {
		try {
			return instructionPrepare.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Erreur lors de l'execution de la requete de mise a jour");
			ex.printStackTrace();
			return -1;
		}
	}

	public void fermerDB() {
		try {
			cnx.close();
		} catch (Exception ex) {
			System.out.println("Erreur lors de la fermeture de la connexion à la BD");
			ex.printStackTrace();
		}
	}

}
