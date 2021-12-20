package Controllers;
 
 
 

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


import Models.client1;
import Models.commandeClient;
import Models.commentaire;
import Models.commentaireClient;
import Models.element_commandeClient;
import Models.fonctionClient;
import Models.repasClient;

/**
 * Servlet implementation class Controller
 */ 
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<repasClient> listRepas = new ArrayList<repasClient>();
	repasClient l=new repasClient();
	 String $mess=null;
	static HashMap<String,String> cartlistQ = new HashMap<>();
	ArrayList<commandeClient> listC ;
	 
	HttpSession session;
	commandeClient  com=new commandeClient();
	
	ArrayList<commentaireClient> elementsCommentaire= new ArrayList<commentaireClient>();

 	String msg;
	public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		String page = request.getParameter("page");
		if(page==null|| page.equals("index")) {
			fonctionClient f=new fonctionClient();
			listRepas=f.fetchRepas() ;
			
			session = request.getSession();
			 session.setAttribute("cartlistQ", cartlistQ);
			 session.setAttribute("listRepas",listRepas);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			doPost(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		
		   if(page.equals("authentifier-form")) {
			
	                 String username = request.getParameter("username");
			         String password = request.getParameter("password");
			
		        	 fonctionClient f=new fonctionClient();
			
		        	 client1 cl=new client1();
			        boolean status = false;
		     	try {
			       	status = f.checkClient(username, password);
			   } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			     }
			      if(status) {
				   session = request.getSession();
			     	session.setAttribute("session", session);
			    	cl = f.fetchClient(username);
			    	 fonctionClient f1=new fonctionClient();
						listRepas=f1.fetchRepas() ;
						 session.setAttribute("listRepas", listRepas);
						
				   session.setAttribute("client",cl);
				   int traiter;
				   traiter=f.traiteCommande(cl.getId());
				  
				
				
				 if(traiter==1){
					 int etat;
					 
					  f=new fonctionClient();
					 etat=f.etatCommand(cl.getId());
					 if(etat==0)
						msg="votre commandeClient est refusé";
					 else
						 msg="votre commandeClient est bien accepté";
					 
					}
				 else{
						msg="votre commandeClient est en attente";
						 
                     
                      
	           }

				 session.setAttribute("message",msg);
		           request.getRequestDispatcher("index.jsp").forward(request, response);

			}
	         else {
		           request.getRequestDispatcher("index.jsp").forward(request, response);
	              } 
			       
	 } 
		   if(page.equals("authentifier-form-DetailRepas")) {
				
		        String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				fonctionClient f=new fonctionClient();
				client1 cl=new client1();
				boolean status = false;
				try {
					status = f.checkClient(username, password);
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(status) {
					session = request.getSession();
					session.setAttribute("session", session);
					cl = f.fetchClient(username);
					session.setAttribute("client",cl);
					request.getRequestDispatcher("DetailRepas.jsp").forward(request, response);
				
			             }
		         else {
			           request.setAttribute("msg", "username ou password est incorrect"); 
			         request.getRequestDispatcher("DetailRepas.jsp").forward(request, response);
		             } 
		 } 
		  
			   if(page.equals("demande-repas")) { 
				   String id = request.getParameter("id_repas");
				   String quantite=request.getParameter("quantity");
					 session.setAttribute("quantite",quantite);
					
					  repasClient p = new repasClient();
				   fonctionClient f=new fonctionClient();
				   boolean check = f.checkrepasCart(cartlistQ,id);
					String wraning=null;
					if(check){
						 wraning="Le repas est déjà ajouté au panier ";
						 
						session.setAttribute("wran",wraning);
						
						request.getRequestDispatcher("index.jsp").forward(request, response);
						wraning=null;
					}
						 	else { 
					 cartlistQ.put(id,quantite);
					 
					  $mess=null;
						session.setAttribute("mess", $mess);
						
					 request.getRequestDispatcher("index.jsp").forward(request, response);
					
					 }
					
				    
			   }
			   if(page.equals("affichercart")) {
				   $mess=null;
					session.setAttribute("mess", $mess);
					
					request.getRequestDispatcher("cart.jsp").forward(request, response);
				}
			   if(page.equals("remove")) {
				   String id = request.getParameter("id");
				   repasClient r= new repasClient();
				    cartlistQ.remove(id);
					
					session = request.getSession();
					session.setAttribute("cartlistQ", cartlistQ);
					
					request.getRequestDispatcher("cart.jsp").forward(request, response);
				}
			   if(page.equals("suiteTraitement")) {
				   ArrayList<element_commandeClient> elementsC=new ArrayList<element_commandeClient>();
				   fonctionClient f=new fonctionClient(); 
				   element_commandeClient element;
				   int cl=Integer.parseInt(request.getParameter("id"));
				     $mess=null;
				     
				     for (String i : cartlistQ.keySet()) {
				    	  
				     
				     
				 
					 element=new element_commandeClient();
					   element.setId_repas(Integer.parseInt(i));
					   element.setQuantite(Integer.parseInt(cartlistQ.get(i)));
					 elementsC.add(element);
						 
				 }  
					  int a= 0;
					 a=  f.insertCommande(cl, elementsC);  
					 cartlistQ.clear();
					 $mess="vous avez bien envoyé votre commandeClient";
					session.setAttribute("mess",$mess);
					String ak="hh"+cartlistQ.size();
					session.setAttribute("ak",ak);
				 
					    request.getRequestDispatcher("cart.jsp").forward(request, response);
				   }
				  
			   
				if(page.equals("DetailRepas")) {
					int count=0;
					String id = request.getParameter("id"); 
					fonctionClient f=new fonctionClient();
					l=f.getRepas(Integer.parseInt(id));
					session.setAttribute("rep",l);
					 count= f.countCommentaires();
	                session.setAttribute("nbrCommentaires",count);
					elementsCommentaire=f.getNouveauxCommentaires();
					 session.setAttribute("elementsComments",elementsCommentaire);
						
					request.getRequestDispatcher("DetailRepas.jsp").forward(request, response);
				
				}
				if(page.equals("commentaire-form")) {
					
					String valR=request.getParameter("valRat");
					String commentaire = request.getParameter("commenter");
					String idC=request.getParameter("client");
					String idR=request.getParameter("idRep");
					
					fonctionClient f=new fonctionClient();
					f.insertCommantaire(
						Integer.parseInt(idC),0,Integer.parseInt(idR),commentaire,Float.parseFloat(valR));
					int count=0;
					String id = request.getParameter("id"); 
					 l=f.getRepas(Integer.parseInt(id));
					session.setAttribute("rep",l);
					 count= f.countCommentaires();
	                session.setAttribute("nbrCommentaires",count);
					elementsCommentaire=f.getNouveauxCommentaires();
					 session.setAttribute("elementsComments",elementsCommentaire);
					// session.setAttribute("elementsComments",elementsCommentaire);
							
					request.getRequestDispatcher("DetailRepas.jsp").forward(request, response);
					
					
				}
				 
				if(page.equals("inscription-form")) {
					String nom = request.getParameter("nom");
					String prenom = request.getParameter("prenom");
					String email = request.getParameter("email");
					String addresse = request.getParameter("addresse");
					String tel = request.getParameter("tel");
					String username = request.getParameter("username");
					String psw = request.getParameter("pswd");
						client1 cl=new client1();
						cl.setAdresse(addresse);
						cl.setEmail(email);
						cl.setNom(nom);
						cl.setPassword(psw);
						cl.setTele(tel);
						cl.setUsername(username);
						cl.setPrenom(prenom);
						fonctionClient f=new fonctionClient();
						f.insertClient(cl);
				     request.getRequestDispatcher("index.jsp").forward(request, response);
				}	
				if(page.equals("inscrire")){
					 request.getRequestDispatcher("inscription.jsp").forward(request, response);
						
				}
				if(page.equals("user")){
					 
					String idcl=request.getParameter("id");
					fonctionClient f=new fonctionClient();
					listC=f.getCommandeByClient(
							Integer.parseInt(idcl));
					  
					session.setAttribute("listCommandes",listC);
					
					 request.getRequestDispatcher("user.jsp").forward(request, response);
						
				}
				if(page.equals("comment-commande")){
				 String messa=null;
					String idcl=request.getParameter("idcl");
					String idco=request.getParameter("idco");
					String comment=request.getParameter("comment");
					
				 	fonctionClient f=new fonctionClient();
					//listC=f.getcommandeClientByClient(
						//	Integer.parseInt(idcl));
					session.setAttribute("cl",idco);
					
					f.insertCommantaire(
							Integer.parseInt(idcl),Integer.parseInt(idco),0,comment,0);
				 
					
					 request.getRequestDispatcher("user.jsp").forward(request, response);
						
							
				}
				if (page.equals("deconnexion")) {
					session = request.getSession();
					session.invalidate();
					
					 session = request.getSession();
					 cartlistQ.clear();
					 session.setAttribute("cartlistQ", cartlistQ);
					 
					 fonctionClient f=new fonctionClient();
						listRepas=f.fetchRepas() ;
						 session.setAttribute("listRepas", listRepas);
							
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				
				 
}

}
