<%@page import="org.mlearning.dto.contenu.Categorie"%>
<%@page import="org.mlearning.dto.contenu.Module"%>
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
					<h1>LISTE DES MODULES</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">
						<% String vCategorie = request.getParameter("categorie"); %>
						<% String vCode = request.getParameter("code"); %>
						<h2 align="center" class="d_title">Liste des modules 
							<% if( vCategorie != null ){ %>
								 dans la catégorie "<%= request.getParameter("categorieName") %>"
							<% } %>
						</h2><hr/>
						<% if( (vCode != null) && (!vCode.equals("null")) ){ %>
							<div class="alert alert-success">
								<button data-dismiss="alert" class="close" type="button">×</button>
								<strong>Nouveau module ajouté!</strong>
							</div>
						<% } %>
						
						<link rel="stylesheet" type="text/css" href="assets/composants/roundedList.css" />
						<ol class="dCustomList_rectangle_list dCustomList_ol">				
						<%
							List<Module> listeDesModules = (List<Module>) request.getAttribute("listeDesModules");
							for (Module oneModule : listeDesModules){
						%>
								<li><a href=""><strong><%= oneModule.getNom() %></strong></a></li>
							<% } %>	
						</ol>
					</div>				
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>