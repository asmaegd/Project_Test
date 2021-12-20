package Models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import DB.ConnexionBD;

public class fonction {

	public ArrayList<CommandeE> listeCommande;
	
	public ArrayList<Commande> liste_Commande;
	
	public ArrayList<CommandeE> getElementCommande(int etat) {
		listeCommande = new ArrayList<CommandeE>();
		ConnexionBD cnx = new ConnexionBD();
		cnx.creerInstruction("SELECT * FROM element_commande WHERE traiter = ?");
		
		try {
			cnx.getInstructionPrepare().setInt(1, etat);
			
			ResultSet rs = cnx.lire();
			while (rs.next()) {
				int id = rs.getInt("id");
				int id_commande = rs.getInt("id_commande");
				int id_repas = rs.getInt("id_repas");
				int quantite = rs.getInt("quantite");
				
				listeCommande.add(new CommandeE(id, "nom-repas", quantite, "date", "heure"));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	// ajouter une etat
	public static void ApprouverRefuser(int id, int etat, int traiter) {

		// ConnexionBD cnx=new ConnexionBD();
		Connection con = ConnexionBD.getConnexion();
		Statement statement;
		try {
			statement = con.createStatement();
			String query = "UPDATE commande SET etat ='" + etat + "',traiter='" + traiter + "' WHERE id='" + id + "'";

			statement.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<Commande> getCommande(int etat, int traiter, int id_livreur) {
		liste_Commande = new ArrayList<Commande>();
		ConnexionBD cnx = new ConnexionBD();
		cnx.creerInstruction("SELECT * FROM commande WHERE etat = ? AND id_livreur=? AND traiter= ?");

		try {
			cnx.getInstructionPrepare().setInt(1, etat);
			cnx.getInstructionPrepare().setInt(2, id_livreur);
			cnx.getInstructionPrepare().setInt(3, traiter);

			ResultSet rs = cnx.lire();
			while (rs.next()) {
				int id_commande = rs.getInt("id");

				String date_commande = rs.getString("date_commande");
				String Heure = rs.getString("Heure");
				int id_client = rs.getInt("id_client");

				liste_Commande.add(new Commande(id_commande, date_commande, Heure, id_client));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return liste_Commande;
	}

	public ArrayList<String> getRepas(int id_commande) {
		ArrayList<String> liste_Repas = new ArrayList<String>();
		ConnexionBD cnx = new ConnexionBD();
		cnx.creerInstruction(
				"SELECT * from repas where id in (SELECT id_repas FROM element_commande WHERE id_commande=?)");

		try {
			cnx.getInstructionPrepare().setInt(1, id_commande);

			ResultSet rs = cnx.lire();
			while (rs.next()) {

				String nom_repas = rs.getString("nom_repas");

				liste_Repas.add(nom_repas);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return liste_Repas;

	}

	// afficher les infos du client

	public client getClient(int id_commande) {

		ConnexionBD cnx = new ConnexionBD();
		client client = new client();
		cnx.creerInstruction("SELECT * from client where id in (SELECT id_client FROM commande WHERE id=?)");
		id_commande=2;
		try {
			cnx.getInstructionPrepare().setInt(1, id_commande);

			ResultSet rs = cnx.lire();
			while (rs.next()) {
				int id = rs.getInt("id");
				String nom = rs.getString("nom");
				String prenom = rs.getString("prenom");
				String tele = rs.getString("telephone");
				String adresse = rs.getString("adresse");
				String email = rs.getString("email");
				client = new client(id, nom, prenom, tele, adresse, email);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return client;

	}

	public ArrayList<Livreur> getLivreurDispo(int etat) {
		ArrayList<Livreur> liste_livreur = new ArrayList<Livreur>();
		ConnexionBD cnx = new ConnexionBD();
		Livreur client = new Livreur();
		cnx.creerInstruction("SELECT * from livreur where id in (SELECT id_livreur FROM livreur_etat WHERE etat=?) ");

		try {
			cnx.getInstructionPrepare().setInt(1, etat);

			ResultSet rs = cnx.lire();
			while (rs.next()) {
				int id = rs.getInt("id");
				String nom = rs.getString("nom");
				String prenom = rs.getString("prenom");
				String tele = rs.getString("telephone");

				String email = rs.getString("email");
				Livreur livreur = new Livreur(id, nom, prenom, tele, email);
				liste_livreur.add(livreur);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return liste_livreur;

	}

	public static void AffectLivreur(int id, int id_livreur) {

		// ConnexionBD cnx=new ConnexionBD();
		Connection con = ConnexionBD.getConnexion();
		Statement statement;
		try {
			statement = con.createStatement();
			String query = "UPDATE commande SET id_livreur='" + id_livreur + "' , status='2' WHERE id='" + id + "'";

			statement.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static ArrayList<Element_Commande> getCommandeStatistics(String date1, String date2, int id_categorie) {
		ArrayList<Element_Commande> commande_statique = new ArrayList<Element_Commande>();
		ConnexionBD cnx = new ConnexionBD();
		cnx.creerInstruction(
				"select * from element_commande where id_commande in( select id from commande WHERE date_commande>=? and date_commande<=? and status='4') and id_repas in (select id from repas where id_categorie=?) ORDER by id_repas ASC");

		try {
			cnx.getInstructionPrepare().setString(1, date1);
			cnx.getInstructionPrepare().setString(2, date2);
			cnx.getInstructionPrepare().setInt(3, id_categorie);

			ResultSet rs = cnx.lire();
			while (rs.next()) {
				int id = rs.getInt("id");
				int id_commande = rs.getInt("id_commande");

				int id_repas = rs.getInt("id_repas");
				int quantite = rs.getInt("quantite");

				commande_statique.add(new Element_Commande(id, id_commande, id_repas, quantite));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return commande_statique;
	}

	public static void LivreeOuAttente(int id, int status) {
		Connection con = ConnexionBD.getConnexion();
		Statement statement;
		try {
			statement = con.createStatement();
			String query = "UPDATE commande SET status ='" + status + "' WHERE id='" + id + "'";

			statement.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<Commande> getCommandeLivreur(int etat, int traiter, int status, int id_livreur) {
		liste_Commande = new ArrayList<Commande>();
		ConnexionBD cnx = new ConnexionBD();
		cnx.creerInstruction("SELECT * FROM commande WHERE etat = ? AND id_livreur=? AND traiter= ? AND status=?");

		try {
			cnx.getInstructionPrepare().setInt(1, etat);
			cnx.getInstructionPrepare().setInt(2, id_livreur);
			cnx.getInstructionPrepare().setInt(3, traiter);
			cnx.getInstructionPrepare().setInt(4, status);

			ResultSet rs = cnx.lire();
			while (rs.next()) {
				int id_commande = rs.getInt("id");

				String date_commande = rs.getString("date_commande");
				String Heure = rs.getString("Heure");
				int id_client = rs.getInt("id_client");

				liste_Commande.add(new Commande(id_commande, date_commande, Heure, id_client));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return liste_Commande;
	}

	public int getCountCommande(int etat, int traiter, int id_livreur, int status) {
		int nb_commandes = 0;
		ConnexionBD cnx = new ConnexionBD();
		cnx.creerInstruction("SELECT * FROM commande WHERE etat = ? AND id_livreur=? AND traiter= ? AND status=?");

		try {
			cnx.getInstructionPrepare().setInt(1, etat);
			cnx.getInstructionPrepare().setInt(2, id_livreur);
			cnx.getInstructionPrepare().setInt(3, traiter);
			cnx.getInstructionPrepare().setInt(4, status);

			ResultSet rs = cnx.lire();

			while (rs.next()) {
				nb_commandes = rs.getRow();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nb_commandes;
	}

	public ResultSet getCategorie() {

		ConnexionBD cnx = new ConnexionBD();
		cnx.creerInstruction("SELECT * FROM catgorie_repas");
		ResultSet rs = cnx.lire();

		return rs;
	}
	public String getNomRepas(int id) {
		String nom_repas="";
		ConnexionBD cnx = new ConnexionBD();
		cnx.creerInstruction("SELECT * FROM repas WHERE id=?");
		try {
			cnx.getInstructionPrepare().setInt(1, id);
			
			ResultSet rs = cnx.lire();
			while (rs.next()) {
			 nom_repas = rs.getString("nom_repas");
}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nom_repas ;
	}

	public ArrayList<Commande> getCommandeStatus(int etat, int traiter, int status) {
		liste_Commande = new ArrayList<Commande>();
		ConnexionBD cnx = new ConnexionBD();
		cnx.creerInstruction(
				"SELECT commande.id,commande.date_commande,commande.Heure,client.nom,client.telephone,livreur.nom,livreur.telephone,client.adresse FROM commande,livreur,client WHERE commande.id_livreur=livreur.id and commande.id_client=client.id and etat =? AND traiter=? AND status=?");

		try {
			cnx.getInstructionPrepare().setInt(1, etat);
			cnx.getInstructionPrepare().setInt(2, traiter);
			cnx.getInstructionPrepare().setInt(3, status);

			ResultSet rs = cnx.lire();
			while (rs.next()) {
				int id_commande = rs.getInt(1);

				String date_commande = rs.getString(2);
				String Heure = rs.getString(3);
				String nom_client = rs.getString(4);
				String tele_client = rs.getString(5);
				String nom_livreur = rs.getString(6);
				String tele_livreur = rs.getString(7);
				String add = rs.getString(8);
				liste_Commande.add(new Commande(id_commande, date_commande, Heure, nom_client, tele_client, nom_livreur,
						tele_livreur, add));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return liste_Commande;
	}
	
	public ArrayList<CommentairesA> getMessage() {
		ArrayList<CommentairesA> liste_msg = new ArrayList<CommentairesA>();
		ConnexionBD cnx = new ConnexionBD();
		
		cnx.creerInstruction("SELECT * from commentaires where 	id_repas=?");

		try {
			int s=0;
			cnx.getInstructionPrepare().setInt(1,s);

			ResultSet rs = cnx.lire();
			while (rs.next()) {
				int id = rs.getInt("id");
				int id_commande = rs.getInt("id_commande");
				String commantaire = rs.getString("commentaire");
				int id_cl = rs.getInt("id_cl");

				CommentairesA msg=new CommentairesA(id,id_commande,commantaire,id_cl);
		
				liste_msg.add(msg);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return liste_msg;

	}
	public static void missionTerminee(int id_livreur, int etat) {
		
		Connection con=ConnexionBD.getConnexion();
		Statement statement;
		try {
			statement = con.createStatement();
			String query = "UPDATE livreur_etat SET etat='"+etat+"' WHERE id_livreur='"+id_livreur+"'";
			statement.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		} 
	
	public client getClientNomPrenom(int idclient) {

		ConnexionBD cnx = new ConnexionBD();
		client client = new client();
		cnx.creerInstruction("SELECT * from client where id=?");
		
		try {
			cnx.getInstructionPrepare().setInt(1, idclient);

			ResultSet rs = cnx.lire();
			while (rs.next()) {
				int id = rs.getInt("id");
				String nom = rs.getString("nom");
				String prenom = rs.getString("prenom");
				String tele = rs.getString("telephone");
				String adresse = rs.getString("adresse");
				String email = rs.getString("email");
				client = new client(id, nom, prenom, tele, adresse, email);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return client;

	}
	 public  void insertLivreur( Livreur livreur) {
		 
	     
			Connection con=ConnexionBD.getConnexion();
			 
			try {
				 String query = "insert into livreur values(null,?,?,?,?,?)";
					
				PreparedStatement preparedStatement =con.prepareStatement(query);
				 
				 preparedStatement.setString(1,livreur.getNom());
				 preparedStatement.setString(2,livreur.getPrenom());
				 preparedStatement.setString(3,livreur.getTele());
				 preparedStatement.setString(4,livreur.getEmail());
				 preparedStatement.setString(5,livreur.getMotdepasse());
				 
					
			    preparedStatement.executeUpdate();
	           
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	}
 
	
}
