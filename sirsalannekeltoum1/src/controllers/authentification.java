package controllers;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.daoPersonne;
import models.Personne;
import models.Role;



@SuppressWarnings("serial")
@WebServlet("/authentification")
public class authentification extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
this.getServletContext().getRequestDispatcher("/authentification.jsp").include(request, response);
}


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

PrintWriter out=response.getWriter();
String email=request.getParameter("username");
String mdp=request.getParameter("pass");
   Personne p=null;
try {
	p=service.servicePersonne.Authentification(email, mdp);
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
if(p==null) {

this.getServletContext().getRequestDispatcher("/authentification1.jsp").forward(request, response);
}else {
	HttpSession session=request.getSession();
	session.setAttribute("personne", p);
	out.print("Redirection vers la page d'accueil");
	if(p.getRole().equals(Role.ADMIN))
	{ response.sendRedirect("http://localhost:8080/sirsalannekeltoum1/Admin.jsp");}
	else
	{ response.sendRedirect("http://localhost:8080/sirsalannekeltoum1/Etudiant.jsp");}
}
}

}