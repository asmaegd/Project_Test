package Models;

import java.util.ArrayList;

public class teste {

	public static void main(String[] args) {
	fonctionClient f=new fonctionClient();
	ArrayList<commandeClient> l=f.getCommandeByClient(2);
	System.out.println("hh"+l.get(0).getId());

	}

}
