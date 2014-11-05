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
						<hr/><h2 align="center" class="d_title">Ressources du module "Les méthodes de communication formelle"</h2><hr/>		
								<div class="row-fluid row_ressource type_text">
									<div class="span2">
										<img src="images/text.png">
									</div>
									<div class="span10">
										<h2>Planifier des r&eacute;unions avec des groupes</h2>
										<p>Pellentesque tincidunt, est sit amet faucibus venenatis, tortor orci lacinia tellus, a euismod felis erat id diam. Duis non porttitor mi, id cursus diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent vehicula ipsum nec condimentum tincidunt. Cras sed gravida nibh. Nunc at purus dolor. Aenean dignissim nisi et auctor sodales. Ut justo nisi, interdum sit amet enim nec, dapibus adipiscing lacus. </p>
									</div>
								</div>
								<div class="row-fluid row_ressource type_text">
									<div class="span2">
										<img src="images/text.png">
									</div>
									<div class="span10">
										<h2>Recueillir de l'information sur le contexte local </h2>
										<p>Maecenas vel arcu vel sapien feugiat molestie. Etiam tempus pulvinar consectetur. Integer non luctus ante. Quisque augue tortor, feugiat vitae enim id, dignissim euismod turpis. Fusce aliquam eros adipiscing eleifend mollis. Sed ac fringilla mi. Aliquam erat volutpat. </p>
									</div>
								</div>
								<div class="row-fluid row_ressource type_video">
									<div class="span2">
										<img src="images/video.png">
									</div>
									<div class="span10">
										<a href="VoirRessource"><h2>G&eacute;rer les dynamiques et les conflits de groupe</h2></a>
										<p>Les dynamiques sociales changent in&eacute;vitablement lors des situations de crise et souvent le contexte devient tr&eagrave;s politis&eacute;. Si un ou plusieurs participants bloquent la discussion...</p>
									</div>
								</div>
								<div class="row-fluid row_ressource type_audio">
									<div class="span2">
										<img src="images/audio.png">
									</div>
									<div class="span10">
										<h2>Planifier des &eacute;v&eacute;nements avec la communaut&eacute;</h2>
										<p>Pellentesque non lorem sapien. Maecenas non tempor ligula, sit amet commodo erat. Integer lacinia quis eros eget malesuada. Nunc interdum dapibus sagittis...</p>
									</div>
								</div>
								<div class="row-fluid row_ressource type_text">
									<div class="span2">
										<img src="images/text.png">
									</div>
									<div class="span10">
										<h2>Prendre des notes</h2>
										<p>Suspendisse euismod tristique ipsum eget sodales. Maecenas tellus felis, posuere ut justo ac, ornare posuere lacus. Integer ut porta nisl. Proin fermentum bibendum..... </p>
									</div>
								</div>
								<div class="row-fluid row_ressource type_audio">
									<div class="span2">
										<img src="images/audio.png">
									</div>
									<div class="span10">
										<h2>Les r&eacute;unions de facilitation</h2>
										<p>Pellentesque non lorem sapien. Maecenas non tempor ligula, sit amet commodo erat. Integer lacinia quis eros eget malesuada. Nunc interdum dapibus sagittis....</p>
									</div>
								</div>
					</div>				
				</div>			
		</div>
	</div>
	<script type="text/javascript" src="js/admin_charts.js"></script>
	<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>