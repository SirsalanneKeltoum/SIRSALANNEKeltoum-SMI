<%@page import="service.servicePersonne"%>
<%@page import="service.serviceCategorie"%>
<%@page import="models.Categorie"%>
<%@page import="service.serviceLivre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Livre"%>
<%@page import="models.Personne"%>
<%Personne p = (Personne)session.getAttribute("personne"); 
if(p==null){
	response.sendRedirect("http://localhost:8080/sirsalannekeltoum1/authentification1");

}else{

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags --> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Espace Admin</title>
  <!-- base:css -->
  <link rel="stylesheet" href="template1/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="template1/vendors/feather/feather.css">
  <link rel="stylesheet" href="template1/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="template1/vendors/flag-icon-css/css/flag-icon.min.css"/>
  <link rel="stylesheet" href="template1/vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="template1/vendors/jquery-bar-rating/fontawesome-stars-o.css">
  <link rel="stylesheet" href="template1/vendors/jquery-bar-rating/fontawesome-stars.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="template1/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="template1/images/favicon.png" />
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="index.html"><img id="fsbm" src="template1/images/" /></a>
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="template1/images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" placeholder="Search Projects.." aria-label="search" aria-describedby="search">
            </div>
          </li>
          
        </ul>
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item dropdown d-lg-flex d-none">
                <button type="button" class="btn btn-info font-weight-bold">+ Create New</button>
            </li>
          <li class="nav-item dropdown d-flex">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
              <i class="icon-air-play mx-0"></i>
            </a>
           </li>
          <li class="nav-item dropdown d-flex mr-4 ">
            <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="icon-cog"></i>
            </a>
        
          </li>
          <li class="nav-item dropdown mr-4 d-lg-flex d-none">
            <a class="nav-link count-indicatord-flex align-item s-center justify-content-center" href="#">
              <i class="icon-grid"></i>
            </a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="user-profile">
          <div class="user-image">
            <img src="template1/images/logouser.jpg">
          </div>
          <div class="user-name">
              <%=p.getNom()+" "+p.getPrenom() %>
          </div>
          <div class="user-designation">
              Admin
          </div>
        </div>
        <ul class="nav">
          
          <li class="nav-item">
            <a class="nav-link" href="template1/pages/forms/AddStudent.jsp">
              <i class="icon-file menu-icon"></i>
              <span class="menu-title" >Add Student</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">
              <i class="icon-pie-graph menu-icon"></i>
              <span class="menu-title">Add Book</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">
              <i class="icon-command menu-icon"></i>
              <span class="menu-title">Ordering Book</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">
              <i class="icon-help menu-icon"></i>
              <span class="menu-title">Tables</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">User Pages</span>
              <i class="menu-arrow"></i>
            </a>
            
          </li>
          
        </ul>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div id="table1" class="card-body">
                  <h4 class="card-title 123" >Add Student</h4>
                  <p class="card-description">
                    Please enter your Student's data:
                  </p>
                  <form class="forms-sample" action="inscription" method="post">
                    <div class="form-group">
                      <label for="exampleInputUsername1">Last Name</label>
                      <input type="text" name="lastname" class="form-control" id="exampleInputUsername1" placeholder="Lastname">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputUsername1">First Name</label>
                      <input type="text" name="firstname" class="form-control" id="exampleInputUsername1" placeholder="Firstname">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Email address</label>
                      <input type="email" name="username" class="form-control" id="exampleInputEmail1" placeholder="Email">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" name="pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>
                    
                    
                    <button type="submit" class="btn btn-primary mr-2">Add Student</button>
                    <button class="btn btn-light">Cancel</button>
                    
                  </form>
                </div>
                <br><br><br>
                  <div class="card">
                                            <div class="card-header 123" id="table1">
                                                <h5>List Of Books</h5>
                                                <div class="card-header-right">
                                                   
                                                </div>
                                            </div>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                <% ArrayList<Livre> livres = serviceLivre.listeLivres(); %>
                                                    <table class="table">
                                                        <thead>
                                                           <tr>
                          <th>
                            #
                          </th>
                          <th>
                            ISBN
                          </th>
                          <th>
                            Title
                          </th>
                           <th>
                           Type
                          </th>
                          <th>
                           Year Edition
                          </th>
                          <th>
                            Category
                          </th>
                          <th>
                           Author
                          </th>
                        </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%for(Livre l :livres){
                                                            	%>
                                                            <tr>
                                                                <th scope="row"><%=l.getId()%></th>
                                                                <td><%=l.getIsbn() %></td>
                                                                <td><%=l.getTitre() %></td>
                                                                <td><%=l.getGenre() %></td>
                                                                <td><%=l.getAnnee_edition() %></td>
                                                                <td><%=l.getCategorie().getNom() %></td>
                                                                <td><%=l.getAuteur().getNom()+" "+l.getAuteur().getPrenom() %></td>
                                                            </tr>
                                                            <%} %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <br><br><br>
                                        
                                        <div class="card-body" id="table1">
                  <h4 class="card-title 123" >Add Book</h4>
                  <p class="card-description">
                    Please enter your book's data:
                  </p>
                  <form class="forms-sample" action="livre" method="post">
                    <div class="form-group">
                      <label for="exampleInputUsername1">ISBN</label>
                      <input type="text" name="isbn" class="form-control" id="exampleInputUsername1" placeholder="ISBN">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputUsername1">Title</label>
                      <input type="text" name="titre" class="form-control" id="exampleInputUsername1" placeholder="Titre">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Type</label>
                      <input type="text" name="genre" class="form-control" id="exampleInputEmail1" placeholder="Type">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Description</label>
                      <input type="password" name="description" class="form-control" id="exampleInputPassword1" placeholder="Description">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Year Edition</label>
                      <input type="password" name="ae" class="form-control" id="exampleInputPassword1" placeholder="Année Edition">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Category</label>
                      <%ArrayList<Categorie> categories = serviceCategorie.listeCategories();%>
                                                                    <select name="cat" class="form-control">
                                                                    	<% for(Categorie c:categories){ %>
                                                                        <option><%=c.getNom() %></option>
                                                                        <%} %>
                                                                    </select>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Author</label>
                      <%ArrayList<Personne> auteurs = servicePersonne.listeAuteurs();%>
                                                                
                                                                    <select name="per" class="form-control">
                                                                     	<% for(Personne a:auteurs){ %>
                                                                        <option><%=a.getNom() %></option>
                                                                        <%} %>   
                                                                     </select>
                    </div>
                    
                    
                    <button type="submit" class="btn btn-primary mr-2">Add Book</button>
                    
                    
                  </form>
                </div>
                
              </div>
            </div>
          
                                        
                                      
        
</body>
</html>
<%}%>