package Models;

import java.util.ArrayList;

public class commandeClient {
private int id; 
private int statut;
private int traiter;
public int getTraiter() {
	return traiter;
}
public void setTraiter(int traiter) {
	this.traiter = traiter;
}
public int getStatut() {
	return statut;
}
public void setStatut(int statut) {
	this.statut = statut;
}
public ArrayList<element_commandeClient> eleC;
public int getId() {
	return id;
}
private String dateC; 
public ArrayList<element_commandeClient> getEleC() {
	return eleC;
}
public void setEleC(ArrayList<element_commandeClient> eleC) {
	this.eleC = eleC;
}
public String getDateC() {
	return dateC;
}
public void setDateC(String dateC) {
	this.dateC = dateC;
}
public void setId(int id) {
	this.id = id;
}
public int getId_client() {
	return id_client;
}
public void setId_client(int id_client) {
	this.id_client = id_client;
}
public int getEtat() {
	return etat;
}
public void setEtat(int etat) {
	this.etat = etat;
}
private int id_client;
private int etat; 
}
