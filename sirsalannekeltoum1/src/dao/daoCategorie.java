package dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.Categorie;

public class daoCategorie {

	public static Categorie categotirParId(int id) throws ClassNotFoundException, SQLException {
		Categorie c=null;
		Connexion.connect();
		ResultSet res = Connexion.select("select * from categorie where id="+id);
		if(res.next()) {
			c=new Categorie(res.getInt(1), res.getString(2), res.getString(3), null);
		}
		Connexion.disconnect();
		return c;
	}
	
	public static int getIdCatByName(String name) throws ClassNotFoundException, SQLException {
		int idcat=0;
		Connexion.connect();
		ResultSet res = Connexion.select("select id from categorie where nom='"+name+"'");
		if(res.next()) {
			idcat = res.getInt(1);
		}
		Connexion.disconnect();
		return idcat;
	}
	
	public static ArrayList<Categorie> listeCategories() throws ClassNotFoundException, SQLException{
		ArrayList<Categorie> categories = new ArrayList<Categorie>();
		Connexion.connect();
		ResultSet res = Connexion.select("select * from categorie");
		while(res.next()) {
			Categorie c=new Categorie(res.getInt(1), res.getString(2), res.getString(3), null);
			categories.add(c);
		}
		Connexion.disconnect();
		return categories;
	}
	
	
}