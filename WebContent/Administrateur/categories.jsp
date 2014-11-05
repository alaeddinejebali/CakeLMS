<%@page import="org.mlearning.dto.contenu.Categorie"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="java.util.List"%>

<jsp:include page="../assets/layout/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/administrateur.css" />
	<div class="mainwrapper">
		<jsp:include page="../assets/layout/administrateur/menu.jsp"></jsp:include>
		<div class="rightpanel">
    		<jsp:include page="../assets/layout/common/top.jsp"></jsp:include>
				<div class="breadcrumbwidget">
					<ul class="breadcrumb">
						<li><a href="./">Accueil</a> <span class="divider">/</span></li>
						<li class="active">Tableau de bord</li>
					</ul>
				</div>
				<div class="pagetitle">
					<h1>LISTE DES CATEGORIES</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">
						<% if( !(request.getParameter("code")).equals("null")){ %>
							<div class="alert alert-success">
								<button data-dismiss="alert" class="close" type="button">×</button>
								<strong>Nouvelle catégorie ajoutée!</strong>
							</div>
						<% } %>
						
						<link rel="stylesheet" type="text/css" href="assets/composants/roundedList.css" />
						<ol class="dCustomList_rectangle_list dCustomList_ol">				
						<%
							List<Categorie> listeDesCategories = (List<Categorie>) request.getAttribute("listeDesCategories");
							for (Categorie oneCategory : listeDesCategories){
								List<Categorie> childCategories = oneCategory.getListChild();
						%>
								<li><a href="ModuleServlet?categorie=<%= oneCategory.getId() %>&categorieName=<%= oneCategory.getNom() %>"><strong><%= oneCategory.getNom() %></strong></a>
									<ol class="dCustomList_ol">
										<%
											for (Categorie childCategory : childCategories) {
										%>
												<li><a href="ModuleServlet?categorie=<%= oneCategory.getId() %>&categorieName=<%= childCategory.getNom() %>"><%= childCategory.getNom() %></a></li>
										<% } %>
									</ol>
								</li>
							<% } %>	
						</ol>
					</div>				
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>