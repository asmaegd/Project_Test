package Models;

import java.util.ArrayList;
import java.util.HashMap;

public class repasClient {
private float rating;
	 public float getRating() {
	return rating;
}
public void setRating(float rating) {
	this.rating = rating;
}
	private int id;
	 private String nom_repas;
	 private double prix;
	 private String image; 
	 public int getCategorie() {
		return categorie;
	}
	public void setCategorie(int categorie) {
		this.categorie = categorie;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	private int categorie;
	 private String description;
	 public repasClient() {}
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
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
 
	 
 
}
