package Models;

import java.io.Serializable;

public class CommandeE implements Serializable {

	public int id;
	public String nom_repas;
	public int quantite;
	public String date;
	public String heure;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom_repas() {
		return nom_repas;
	}

	public void setNom_repas(String nom_repas) {
		this.nom_repas = nom_repas;
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHeure() {
		return heure;
	}

	public void setHeure(String heure) {
		this.heure = heure;
	}

	public CommandeE() {

	}

	public CommandeE(int id, String nom_repas, int quantite, String date, String heure) {
		this.id = id;
		this.nom_repas = nom_repas;
		this.quantite = quantite;
		this.date = date;
		this.heure = date;
	}

}
