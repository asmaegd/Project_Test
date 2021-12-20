package Models;

import java.io.Serializable;

public class Commande implements Serializable {

	public int id;
	public String date_commande;
	public String heure;
	public int id_client;
	public int id_livreur;
	public String nom_client;
	public String tele_client;
	public String nom_livreur;
	public String tele_livreur;
	public String adresse;

	public int getId_livreur() {
		return id_livreur;
	}

	public Commande(int id, String date_commande, String heure, int id_client) {
		super();
		this.id = id;
		this.date_commande = date_commande;
		this.heure = heure;
		this.id_client = id_client;
	}

	public Commande(int id, String date_commande, String heure, int id_client, int id_livreur) {
		super();
		this.id = id;
		this.date_commande = date_commande;
		this.heure = heure;
		this.id_client = id_client;
		this.id_livreur = id_livreur;
	}

	public Commande(int id, String date_commande, String heure, String nom_client, String tele_client,
			String nom_livreur, String tele_livreur, String add) {
		super();
		this.id = id;
		this.date_commande = date_commande;
		this.heure = heure;
		this.nom_client = nom_client;
		this.tele_client = tele_client;
		this.nom_livreur = nom_livreur;
		this.tele_livreur = tele_livreur;
		this.adresse = add;
	}

	public Commande() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate_commande() {
		return date_commande;
	}

	public void setDate_commande(String date_commande) {
		this.date_commande = date_commande;
	}

	public int getId_client() {
		return id_client;
	}

	public void setId_client(int id_client) {
		this.id_client = id_client;
	}

	public String getHeure() {
		return heure;
	}

	public void setHeure(String heure) {
		this.heure = heure;
	}

	public void setId_livreur(int id_livreur) {
		this.id_livreur = id_livreur;
	}

	public String getNom_client() {
		return nom_client;
	}

	public void setNom_client(String nom_client) {
		this.nom_client = nom_client;
	}

	public String getTele_client() {
		return tele_client;
	}

	public void setTele_client(String tele_client) {
		this.tele_client = tele_client;
	}

	public String getNom_livreur() {
		return nom_livreur;
	}

	public void setNom_livreur(String nom_livreur) {
		this.nom_livreur = nom_livreur;
	}

	public String getTele_livreur() {
		return tele_livreur;
	}

	public void setTele_livreur(String tele_livreur) {
		this.tele_livreur = tele_livreur;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

}
