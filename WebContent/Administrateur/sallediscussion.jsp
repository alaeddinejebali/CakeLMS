<%@page import="java.util.Date"%>
<%@page import="org.mlearning.dto.contenu.Sallediscussion"%>
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
					<h1>LISTE DES SALLES</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<h2 align="center" class="d_title">
						Liste des salles de formation
					</h2><hr/>
					<ul class="list-nostyle tac">
						<li><a href="AjouterSallediscussion"><span class="icon-plus"></span> Ajouter une nouvelle salle</a></li>
					</ul><hr/>
					<div class="w100 tac">
						<ul class="list-nostyle tac sallediscussion_menu">
							<li>Afficher:</li>
							<li><a id="btnSallesTous" href="#"><span class="icon-check"></span> Tous</a></li>
							<li><a id="btnSallesTerminees" href="#"><span class="icon-ok"></span> Termi&eacute;es</a></li>
							<li><a id="btnSallesEnCours" href="#"><span class="icon-refresh"></span>En cours</a></li>
							<li><a id="btnSallesNonCommencees" href="#"><span class="icon-time"></span> Pas encore commenc&eacute;es</a></li>						
						</ul>
					</div>
					<div id="admin_accueil_listeDesFormation">
						<% if( !(request.getParameter("code")).equals("null")){ %>
							<div class="alert alert-success">
								<button data-dismiss="alert" class="close" type="button">x</button>
								<strong>Nouvelle salle ajoutée!</strong>
							</div>
						<% } %>
						
						<!-- TOUTES LES SALLES -->
						<ul class="widgeticons row-fluid" id="salleDiscussion_tous">			
						<%
							List<Sallediscussion> listeDesSalles = (List<Sallediscussion>) request.getAttribute("listeDesSalles");
							Date currentTime = new Date();
							for (Sallediscussion uneSalle : listeDesSalles){
								String imgSalleEtat = "";									
								if( currentTime.before(uneSalle.getDebut()) ){
									imgSalleEtat = "nonComencee.png";
								}
								else if( currentTime.after(uneSalle.getFin()) ){
									imgSalleEtat = "terminee.png";
								}
								else{
									imgSalleEtat = "enCours.png";
								}
						%>
								<li class="one_fifth"><a id="aThumbnailPhoto" href="#?salle=<%= uneSalle.getId() %>"><img src="images/<%= imgSalleEtat %>" alt="" class="thumbnailPhoto"><span><%= uneSalle.getNom() %></span></a></li>
							<% } %>	
						</ul>
						
						<!-- SALLE DISCUSSION TERMINEES -->
						<ul class="widgeticons row-fluid" id="salleDiscussion_fini">			
						<%
							List<Sallediscussion> listeDesSallesFinis = (List<Sallediscussion>) request.getAttribute("listeDesSallesFinis");
							for (Sallediscussion uneSalleFini : listeDesSallesFinis){
						%>
								<li class="one_fifth"><a id="aThumbnailPhoto" href="#?salle=<%= uneSalleFini.getId() %>"><img src="images/terminee.png" alt="" class="thumbnailPhoto"><span><%= uneSalleFini.getNom() %></span></a></li>
							<% } %>	
						</ul>
						
						<!-- SALLE DISCUSSION NON COMMENCEE -->
						<ul class="widgeticons row-fluid" id="salleDiscussion_nonCommencee">			
						<%
							List<Sallediscussion> listeDesSallesNoncommences = (List<Sallediscussion>) request.getAttribute("listeDesSallesNoncommences");
							for (Sallediscussion uneSalleNonCommencee : listeDesSallesNoncommences){
						%>
								<li class="one_fifth"><a id="aThumbnailPhoto" href="#?salle=<%= uneSalleNonCommencee.getId() %>"><img src="images/nonComencee.png" alt="" class="thumbnailPhoto"><span><%= uneSalleNonCommencee.getNom() %></span></a></li>
							<% } %>	
						</ul>
						
						<!-- SALLE DISCUSSION ACTIVES -->
						<ul class="widgeticons row-fluid" id="salleDiscussion_active">			
						<%
							List<Sallediscussion> listeDesSallesActives = (List<Sallediscussion>) request.getAttribute("listeDesSallesActives");
							for (Sallediscussion uneSalleActive : listeDesSallesActives){
						%>
								<li class="one_fifth"><a id="aThumbnailPhoto" href="#?salle=<%= uneSalleActive.getId() %>"><img src="images/enCours.png" alt="" class="thumbnailPhoto"><span><%= uneSalleActive.getNom() %></span></a></li>
							<% } %>	
						</ul>						
					</div>				
				</div>
			</div>
			<script type="text/javascript" src="js/sallediscussion.js"></script>
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>