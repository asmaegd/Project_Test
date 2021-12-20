package Models;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.ConnexionBD;
import DB.*;
public class element_commandeClient {
private int id;
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
private int id_commande;
private int id_repas;
private int quantite;


public String getNomRepas(int idr){
	  ConnexionBD cnx=new ConnexionBD();
	  String nomR="";
		 cnx.creerInstruction("SELECT nom_repas FROM repas where id=?");
		
		try { 
			
			cnx.getInstructionPrepare().setInt(1,idr);
			
			ResultSet rs=cnx.lire();
			
			while (rs.next())
			{  
				 String nom=rs.getString("nom_repas");
                 
				 nomR=nom;
}

		}catch(SQLException ex){
		ex.printStackTrace();	
		}
		
		return nomR;
		}
public int getPrixRepas(int idr){
	  ConnexionBD cnx=new ConnexionBD();
	  int prixR=0;
		 cnx.creerInstruction("SELECT prix FROM repas where id=?");
		
		try { 
			
			cnx.getInstructionPrepare().setInt(1,idr);
			
			ResultSet rs=cnx.lire();
			
			while (rs.next())
			{  
				 int p=rs.getInt("prix");
               
				prixR=p;
}

		}catch(SQLException ex){
		ex.printStackTrace();	
		}
		
		return prixR;
		}

}
