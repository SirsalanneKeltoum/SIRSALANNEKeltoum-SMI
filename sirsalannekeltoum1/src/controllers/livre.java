package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Categorie;
import models.Livre;
import models.Personne;

@WebServlet("/livre")
public class livre extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public livre() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/Admin.jsp").include(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		boolean res=false;
		Livre l = new Livre(Integer.parseInt(request.getParameter("isbn")), request.getParameter("titre"), request.getParameter("genre"), request.getParameter("description"),Integer.parseInt(request.getParameter("ae")),new Categorie(0,request.getParameter("cat"),null,null),new Personne(0,request.getParameter("per"),null,null,null,null));
		 try {
			res = service.serviceLivre.AjouterLivre(l);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		if(res) {
	           out.print("your book has been added");
					}else {
			 out.print("your book already exists");
					}
	}

	

}
