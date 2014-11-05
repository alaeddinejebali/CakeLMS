<%@page import="java.math.BigDecimal"%>
<%@page import="org.mlearning.dto.users.Tuteur"%>
<%@page import="org.mlearning.dto.users.Apprenant"%>
<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.contenu.Categorie"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="java.util.List"%>

<jsp:include page="../assets/layout/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/administrateur.css" />
	<div class="mainwrapper">
		<jsp:include page="../assets/layout/apprenant/menu.jsp"></jsp:include>
		<div class="rightpanel">
    		<jsp:include page="../assets/layout/common/top.jsp"></jsp:include>
				<div class="breadcrumbwidget">
					<ul class="breadcrumb">
						<li><a href="./">Accueil</a> <span class="divider">/</span></li>
						<li class="active">Tableau de bord</li>
					</ul>
				</div>
				<div class="pagetitle">
					<h1>TABLEAU DE BORD</h1> <span>Espace Apprenant..</span>
				</div>

				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">
						<hr/><h2 align="center" class="d_title">Catégories de la formation "Formation Telecom 1"</h2><hr/>		
						<link rel="stylesheet" type="text/css" href="assets/composants/roundedList.css" />
						<ol class="dCustomList_rectangle_list dCustomList_ol">				
						<%
							List<Categorie> listeDesCategories = (List<Categorie>) request.getAttribute("listeDesCategories");
							for (Categorie oneCategory : listeDesCategories){
								List<Categorie> childCategories = oneCategory.getListChild();
						%>
								<li><a href="ApprenantVoirCategory?categorie=<%= oneCategory.getId() %>&categorieName=<%= oneCategory.getNom() %>"><strong><%= oneCategory.getNom() %></strong></a>
									<ol class="dCustomList_ol">
										<%
											for (Categorie childCategory : childCategories) {
										%>
												<li><a href="ApprenantVoirCategory?categorie=<%= oneCategory.getId() %>&categorieName=<%= childCategory.getNom() %>"><%= childCategory.getNom() %></a></li>
										<% } %>
									</ol>
								</li>
							<% } %>	
						</ol>
					</div>				
				</div>			
		</div>
	</div>
	<script type="text/javascript" src="js/admin_charts.js"></script>
	<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>