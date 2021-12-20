package Models;

public class Element_Commande {

	public int id;
	public int id_commande;
	public int id_repas;
	public int quantite;

	public Element_Commande() {

	}

	public Element_Commande(int id_repas, int quantite) {

		this.id_repas = id_repas;
		this.quantite = quantite;
	}

	public Element_Commande(int id, int id_commande, int id_repas, int quantite) {
		super();
		this.id = id;
		this.id_commande = id_commande;
		this.id_repas = id_repas;
		this.quantite = quantite;

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

	public int getId_repas() {
		return id_repas;
	}

	public void setId_repas(int id_repas) {
		this.id_repas = id_repas;
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

}
