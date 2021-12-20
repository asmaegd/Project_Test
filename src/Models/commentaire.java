package Models;

import java.sql.ResultSet;
import java.sql.SQLException;

import DB.ConnexionBD;

public class commentaire {
	private int idC;
public int getIdC() {
		return idC;
	}
	public void setIdC(int idC) {
		this.idC = idC;
	}
public int getId() {
		return id;
	}
private int id_repas;

	public int getId_repas() {
	return id_repas;
}
public void setId_repas(int id_repas) {
	this.id_repas = id_repas;
}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_cl() {
		return id_cl;
	}
	public void setId_cl(int id_cl) {
		this.id_cl = id_cl;
	}
	public String getContenu() {
		return contenu;
	}
	public void setContenu(String contenu) {
		this.contenu = contenu;
	}
private int id;
private int id_cl;
private String contenu;
private String time;
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getNomClient(int idc){
	String user=null;
	ConnexionBD cnx=new ConnexionBD();
	cnx.creerInstruction("SELECT * FROM client where id="+idc);
	
	try { 
		
		
		ResultSet rs=cnx.lire();
		while (rs.next())
		{   user=rs.getString("username");
			 	}
	 
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	return user;
}
}
