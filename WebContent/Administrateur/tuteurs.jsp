<%@page import="org.mlearning.dto.users.Tuteur"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="org.mlearning.dto.users.Apprenant"%>
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
					<h1>LISTE DES TUTEURS</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<h2 align="center" class="d_title">Liste des tuteurs</h2><hr/>
					<div id="admin_accueil_listeDesFormation">
						<% if( !(request.getParameter("code")).equals("null")){ %>
							<div class="alert alert-success">
								<button data-dismiss="alert" class="close" type="button">x</button>
								<strong>Nouveau tuteur ajouté!</strong>
							</div>
						<% } %>
						
						<ul class="widgeticons row-fluid">			
						<%
							List<Tuteur> listeDesTuteurs = (List<Tuteur>) request.getAttribute("listeDesTuteurs");
							for (Tuteur oneTuteur : listeDesTuteurs){
						%>
								<li class="one_fifth"><a id="aThumbnailPhoto" href="TuteursServlet?tuteur=<%= oneTuteur.getId() %>"><img src="ImageServlet?img=<%= oneTuteur.getPhoto() %>" alt="" class="thumbnailPhoto"><span><%= oneTuteur.getNom() %></span></a></li>
							<% } %>	
						</ul>
					</div>				
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>