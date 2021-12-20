package Models;

public class CommentairesA {

	int id;
	int id_commande;
	String commantaire;
	int id_cl;
	
	public CommentairesA() {
	
	}

	public CommentairesA(int id, int id_commande, String commantaire, int id_cl) {
		
		this.id = id;
		this.id_commande = id_commande;
		this.commantaire = commantaire;
		this.id_cl = id_cl;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_commande() {
		return id_commande;
	}

	public void setId_commande(int id_commande) {
		this.id_commande = id_commande;
	}

	public String getCommantaire() {
		return commantaire;
	}

	public void setCommantaire(String commantaire) {
		this.commantaire = commantaire;
	}

	public int getId_cl() {
		return id_cl;
	}

	public void setId_cl(int id_cl) {
		this.id_cl = id_cl;
	}
	
	
	
}
