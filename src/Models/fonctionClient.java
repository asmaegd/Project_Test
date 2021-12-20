package Models;
 

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import DB.ConnexionBD;

  

public class fonctionClient {


	
	 public ArrayList<repasClient> fetchRepas() {
		    repasClient p;
			  ArrayList<repasClient> listeRepas=new ArrayList<repasClient>();
			 ConnexionBD cnx=new ConnexionBD();
			cnx.creerInstruction("SELECT * FROM repas");
			
			try { 
				
				
				ResultSet rs=cnx.lire();
				while (rs.next())
				{ 
					p = new repasClient(); 
					
					 float ratt=rs.getFloat("rating");
                      String image=rs.getString("image");
                      String nom=rs.getString("nom_repas");
                      Double prix=rs.getDouble("prix");
                      int categorie=rs.getInt("id_categorie");
                      int id=rs.getInt("id");
                      String descrip=rs.getString("description");
                      
                      p.setRating(ratt);
                      p.setImage(image);
                      p.setNom_repas(nom);
                      p.setPrix(prix);
                      p.setId(id);
                      p.setDescription(descrip);
                      p.setCategorie(categorie);
                    
                      listeRepas.add(p);
					 	}
			 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return listeRepas;
			} 
	
	public boolean checkClient(String username, String password) throws SQLException {
		 ConnexionBD cnx=new ConnexionBD();
         int count = 0;
		 cnx.creerInstruction("Select * from client where username = ? and password = ?");
			 
				cnx.getInstructionPrepare().setString(1, username.toLowerCase());
				cnx.getInstructionPrepare().setString(2, password.toLowerCase());
				
				
				ResultSet rs=cnx.lire();
				while (rs.next())
				{ 
					count = 1;
				}
				 
				if(count == 0)
					return false;
				
				return true; 
				
	}
	public client1 fetchClient(String username)  {
		client1 cl=new client1();
		 ConnexionBD cnx=new ConnexionBD();
			cnx.creerInstruction("SELECT * FROM client where username=?");
			
			try { 
				 cnx.getInstructionPrepare().setString(1,username);
				ResultSet rs=cnx.lire();
				while (rs.next())
				{  int id=rs.getInt("id");
					String nom=rs.getString("nom");

					String prenom=rs.getString("prenom");

					String tele=rs.getString("telephone");

					String adresse=rs.getString("adresse");
                    String password=rs.getString("password");
					String email=rs.getString("email");
					String user=rs.getString("username");
					
					cl.setNom(nom);
					cl.setPassword(password);
					cl.setEmail(email);
					cl.setPassword(password);
					cl.setPrenom(prenom);
					cl.setTele(tele);
					cl.setId(id);
					cl.setUsername(user);
				}}
				catch (Exception e) { 
					e.printStackTrace();
				}
				return cl;	
                
	}  
	  
	public boolean checkrepasCart(HashMap<String,String> cartlistQ, String id2) {
		
		for (String i : cartlistQ.keySet()) {
			if(i.equals(id2))
				return true;
		}
		return false;}
		
	 
	

	
public  int insertCommande(int id_client,ArrayList<element_commandeClient> elem) {
	  ResultSet rs = null;
      int candidateId = 0;
       
		Connection con=ConnexionBD.getConnexion();
		 
		try {
			 String query = "insert into commande (id_client,date_commande,etat,traiter,id_livreur,status) values(?,?,0,0,0,0)";
				
			PreparedStatement preparedStatement =con.prepareStatement(query,
                    Statement.RETURN_GENERATED_KEYS);
			Date date = new Date();
		      SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		       String str = formatter.format(date);
		  preparedStatement.setInt(1,id_client);

			preparedStatement.setString(2,str);

			  int rowAffected = preparedStatement.executeUpdate();
            if(rowAffected == 1)
            {
                // get candidate id
                rs = preparedStatement.getGeneratedKeys();
                if(rs.next())
                    candidateId = rs.getInt(1);

            }

			for(int i=0;i<elem.size();i++){
				 String query1 = "insert into element_commande (id_commande,id_repas,quantite) "
				 		+ "values(?,?,?)";
				 PreparedStatement preparedStatement1 = con.prepareStatement(query1);
				 int idR=elem.get(i).getId_repas();
				 int quant=elem.get(i).getQuantite();
 	 
					preparedStatement1.setInt(1,candidateId);
					preparedStatement1.setInt(2,idR);

					preparedStatement1.setInt(3,quant);
					 
					preparedStatement1.executeUpdate();
				 
						
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return candidateId;
}
	
	
	
public repasClient getRepas(int idR){
	repasClient p=new repasClient();
	ConnexionBD cnx=new ConnexionBD();
	cnx.creerInstruction("SELECT * from repas where id =?");
	
	try {
		cnx.getInstructionPrepare().setInt(1,idR);
		
		
		ResultSet rs=cnx.lire();
		while (rs.next())
		{
			
			String image=rs.getString("image");
            String nom=rs.getString("nom_repas");
            Double prix=rs.getDouble("prix");
            float ratt=rs.getFloat("rating");
            
             int id=rs.getInt("id");
            String descrip=rs.getString("description");
             p.setImage(image);
            p.setNom_repas(nom);
            p.setPrix(prix);
            p.setRating(ratt);
            p.setId(id);
            p.setDescription(descrip);
             
          
		}
	 
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	return p;
	
}


public  void insertCommantaire(int id_client,int idc,int id_repas,String commentaire,float rat) {
	 
     
		Connection con=ConnexionBD.getConnexion();
		 Statement statement;
		try {
			 String query = "insert into commentaires(id_cl,id_repas,commentaire,id_commande) values(?,?,?,?)";
				
			PreparedStatement preparedStatement =con.prepareStatement(query);
			 
			preparedStatement.setInt(1,id_client);
			
			preparedStatement.setInt(2,id_repas);
			preparedStatement.setString(3,commentaire);
			preparedStatement.setInt(4,idc);
			
		    preparedStatement.executeUpdate();
		    statement = con.createStatement();
			 
		    ConnexionBD cnx=new ConnexionBD();
			 float ratt=0;
				 cnx.creerInstruction("SELECT rating FROM repas where id=?");
				
				try { 
					
					cnx.getInstructionPrepare().setInt(1,id_repas);
					
					ResultSet rs=cnx.lire();
					
					while (rs.next())
					{  
						 float rattr=rs.getFloat("rating");
		                 
						 ratt=rattr;
		}

				}catch(SQLException ex){
				ex.printStackTrace();	
				}
				if(ratt==0) ratt=rat;
				
				else ratt=(ratt+rat)/2;
		    String query1 = "update repas set rating=FORMAT("+ratt+",2) where id='"+id_repas+"'";
			
		     statement.executeUpdate(query1);
			   
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
}
	
public int countCommentaires(){
	int count=0;
	ConnexionBD cnx=new ConnexionBD();
	cnx.creerInstruction("SELECT * FROM commentaires");
	
	try { 
		
		
		ResultSet rs=cnx.lire();
		while (rs.next())
		{  count++;
			 	}
	 
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	return count;
}		 	

   public ArrayList<commentaireClient> getNouveauxCommentaires(){
	   commentaireClient p;
		  ArrayList<commentaireClient> listeRepas=new ArrayList<commentaireClient>();
		 ConnexionBD cnx=new ConnexionBD();
		cnx.creerInstruction("SELECT * FROM commentaires order by id desc LIMIT 5  ");
		
		try { 
			
			
			ResultSet rs=cnx.lire();
			while (rs.next())
			{ 
				p = new commentaireClient(); 
				
               int id_client=rs.getInt("id_cl");
               String content=rs.getString("commentaire");
               int repas=rs.getInt("id_repas");
               String date=rs.getString("time");
               p.setContenu(content); 
               p.setId_cl(id_client); 
               p.setId_repas(repas); 
               p.setTime(date);
                   listeRepas.add(p);
				 	}
		 
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return listeRepas;
   }
   
   public  void insertClient( client1 cl) {
		 
	     
		Connection con=ConnexionBD.getConnexion();
		 
		try {
			 String query = "insert into client values(null,?,?,?,?,?,?,?)";
				
			PreparedStatement preparedStatement =con.prepareStatement(query);
			 
			 preparedStatement.setString(1,cl.getNom());
			 preparedStatement.setString(2,cl.getPrenom());
			 preparedStatement.setString(3,cl.getEmail());
			 preparedStatement.setString(4,cl.getAdresse());
			 preparedStatement.setString(5,cl.getTele());
			 preparedStatement.setString(6,cl.getUsername());
			 preparedStatement.setString(7,cl.getPassword());
				
		    preparedStatement.executeUpdate();
           
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
}


public int traiteCommande(int idcl){
	int traiter=0;
	 ConnexionBD cnx=new ConnexionBD();
	cnx.creerInstruction("SELECT 	traiter from commande where id_client =?");
	
	try {
		cnx.getInstructionPrepare().setInt(1,idcl);
		
		
		ResultSet rs=cnx.lire();
		while (rs.next())
		{
			
			traiter=rs.getInt("traiter");
            
             
          
		}
	 
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	return traiter;
	
}
public int etatCommand(int idcl){
	int etat=0;
	 ConnexionBD cnx=new ConnexionBD();
	cnx.creerInstruction("SELECT etat from commande where id_client =?");
	
	try {
		cnx.getInstructionPrepare().setInt(1,idcl);
		
		
		ResultSet rs=cnx.lire();
		while (rs.next())
		{
			
			etat=rs.getInt("etat");
            
             
          
		}
	 
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	return etat;
	
}
public ArrayList<commandeClient> getCommandeByClient(int idC) {
	commandeClient c;
     int count=0;
     ArrayList<commandeClient> listeC=new ArrayList<commandeClient>();
		
	   ConnexionBD cnx=new ConnexionBD();
	   ConnexionBD cnx1=new ConnexionBD();
		
	cnx.creerInstruction("SELECT * FROM commande where id_client=?");
	
	try { 
		
		cnx.getInstructionPrepare().setInt(1,idC);
		
		ResultSet rs=cnx.lire();
		
		while (rs.next())
		{ count++;
			c = new commandeClient(); 
			
			 int idco=rs.getInt("id");
			 
			 cnx1.creerInstruction("SELECT * FROM element_commande where id_commande=?");
				
			 
			 cnx1.getInstructionPrepare().setInt(1,idco);
			 ResultSet rs1=cnx1.lire();
			 element_commandeClient e;
				ArrayList<element_commandeClient> listE=new 	ArrayList<element_commandeClient> ();
			 while (rs1.next())
				{
				 e=new 	element_commandeClient();
				 int idelemC=rs1.getInt("id");
				 int id_rep=rs1.getInt("id_repas");
				 int q=rs1.getInt("quantite");
				 
				 e.setId(idelemC);
				 e.setId_repas(id_rep);
				 e.setQuantite(q);
				 listE.add(e);
				}
				
			 
			 String dateC=rs.getString("date_commande");
             
			
                 int etat=rs.getInt("etat");
              int statut=rs.getInt("status");
              int trait=rs.getInt("traiter");
              c.setTraiter(trait);
              c.setStatut(statut);
              c.setId(idco);
              c.setEtat(etat);
              c.setDateC(dateC);
              c.setEleC(listE);
              listeC.add(c);
			 	}
	 
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	if(count>0)
	return listeC;
	else
		return null;
	} 

}