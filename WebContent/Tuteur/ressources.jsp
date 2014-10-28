<%@page import="org.mlearning.dto.contenu.Groupe"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="org.mlearning.dto.users.Tuteur"%>
<%@page import="org.mlearning.dto.users.Apprenant"%>
<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.contenu.Module"%>
<%@page import="org.mlearning.dto.contenu.Ressource"%>
<%@page import="org.mlearning.dto.contenu.Cours"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="java.util.List"%>

<jsp:include page="../assets/layout/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/administrateur.css" />
	<div class="mainwrapper">
		<jsp:include page="../assets/layout/tuteur/menu.jsp"></jsp:include>
		<div class="rightpanel">
    		<jsp:include page="../assets/layout/common/top.jsp"></jsp:include>
				<div class="breadcrumbwidget">
					<ul class="breadcrumb">
						<li><a href="./">Accueil</a> <span class="divider">/</span></li>
						<li class="active">Tableau de bord</li>
					</ul>
				</div>
				<div class="pagetitle">
					<h1>ESPACE TUTEUR</h1> <span>Mes ressources...</span>
				</div>
				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">
						<hr/><h2 align="center" class="d_title">Mes ressources</h2><hr/>
						<div class="row-fluid">
							<div class="span12 tac tuteurRessourcesFilter">
								<span id="btnShowRessources_tous" class="tuteurRessourcesFilter_active">Tous</span> | <span id="btnShowRessources_text">Text</span> | <span id="btnShowRessources_audio">Audio</span> | <span id="btnShowRessources_video">Video</span> | <span id="btnShowRessources_video">Quizz</span>
							</div>
						</div>
						<!-- ----------------------	LISTE DES APPRENANTS	--------------------- -->		
							<%
								List<Cours> listeDesRessources = (List<Cours>) request.getAttribute("listeDesRessources");
								for (Cours r : listeDesRessources){
									int rType = r.getType();
									String strType = "";
									if( rType == 0 ){
										strType = "text";
									}
									else if( rType == 1 ){
										strType = "audio";
									}
									else if( rType == 2 ){
										strType = "video";
									}
							%>
							
								<div class="row-fluid row_ressource type_<%= strType %>">
									<div class="span2">
										<img src="images/<%= strType %>.png" />
									</div>
									<div class="span10">
										<h2><%= r.getTitre() %></h2>
										<p><%= r.getDescription() %></p>
									</div>
								</div>
							<%
								}
							%>
					</div>		
				</div>				
		</div>
	</div>
	<script type="text/javascript" src="js/admin_charts.js"></script>
	<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>