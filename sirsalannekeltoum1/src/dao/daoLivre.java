package dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.Livre;


public class daoLivre {

	public static ArrayList<Livre> listeLivres() throws SQLException, ClassNotFoundException{
		ArrayList<Livre> livres = new ArrayList<Livre>();
		Connexion.connect();
		ResultSet res = Connexion.select("select * from livre");
		while(res.next()) {
			Livre l =new Livre(res.getInt(1), res.getInt(2), res.getString(3),res.getString(4),res.getString(5),res.getInt(6),null, null);
			l.setCategorie(daoCategorie.categotirParId(res.getInt(7)));
			l.setAuteur(daoPersonne.PersonneParId(res.getInt(8)));
			livres.add(l);
		}
		Connexion.disconnect();
		return livres;
	}
	
	public static boolean LivreExiste(int isbn) throws ClassNotFoundException, SQLException {
		boolean exist = false ;
		Connexion.connect();
		ResultSet res = Connexion.select("select * from livre where isbn="+isbn);
		if(res.next()) {
			exist=true;
		}
		Connexion.disconnect();
		return exist;
	}
	
	public static int AjouterLivre(Livre l) throws ClassNotFoundException, SQLException {
		int a=daoPersonne.getIdPerByName(l.getAuteur().getNom());
		int b=daoCategorie.getIdCatByName(l.getCategorie().getNom());
		Connexion.connect();
		int res = Connexion.Maj("INSERT INTO livre(isbn,titre,genre,description,annee_edition,idcategorie,idauteur) VALUES ("+l.getIsbn()+",'"+l.getTitre()+"','"+l.getGenre()+"','"+l.getDescription()+"',"+l.getAnnee_edition()+","+b+","+a+")");
		Connexion.disconnect();
		return res;
	}
	
	
}