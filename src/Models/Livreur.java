package Models;

import java.io.Serializable;

public class Livreur implements Serializable{
		
	public int id;
	public String nom;
	public  String prenom;
	public  String tele;
	public  String email;
	public String motdepasse;
	
	public Livreur() {
		
	}
	public Livreur(int id, String nom, String prenom, String tele, String email) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.tele = tele;
		this.email = email;
	}
	public Livreur(int id, String nom, String prenom, String tele, String email,String mdp) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.tele = tele;
		this.email = email;
		this.motdepasse=mdp;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public String getMotdepasse() {
		return motdepasse;
	}
	public void setMotdepasse(String motdepasse) {
		this.motdepasse = motdepasse;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getTele() {
		return tele;
	}
	public void setTele(String tele) {
		this.tele = tele;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
