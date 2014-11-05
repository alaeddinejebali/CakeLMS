<%@page import="org.mlearning.dto.contenu.Groupe"%>
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
					<h1>LISTE DES GROUPES</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<h2 align="center" class="d_title">Liste des groupes</h2><hr/>
					<div id="admin_accueil_listeDesFormation">
						<% String vGroupe = request.getParameter("groupe"); %>
						<% String vCode = request.getParameter("code"); %>
						<% if( (vCode != null) && (!vCode.equals("null")) ){ %>
							<div class="alert alert-success">
								<button data-dismiss="alert" class="close" type="button">×</button>
								<strong>Nouveau groupe ajouté!</strong>
							</div>
						<% } %>
						<link rel="stylesheet" type="text/css" href="assets/composants/roundedList.css" />
						<ol class="dCustomList_rectangle_list dCustomList_ol">				
						<%
							List<Groupe> listeDesGroupes = (List<Groupe>) request.getAttribute("listeDesGroupes");
							for (Groupe oneGroupe : listeDesGroupes){
						%>
								<li><a href="GroupeServlet?groupe=<%= oneGroupe.getId() %>"><strong><%= oneGroupe.getNom() %><!strong></a></li>
							<% } %>	
						</ol>
					</div>				
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>