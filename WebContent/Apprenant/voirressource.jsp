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
						<hr/><h2 align="center" class="d_title">G&eacute;rer les dynamiques et les conflits de groupe"</h2><hr/>		
						<div class="row-fluid">
							<div class="span12">
								<video width="265" height="265" controls>
									<source src="http://localhost:8080/mLearningPlateforme/Apprenant/v1.webm" type="video/webm"></source>
									<source src="http://localhost:8080/mLearningPlateforme/Apprenant/v1.mp4" type="video/mp4">
									Your browser does not support the video tag.
								</video>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<blockquote>
									<p>
									Les dynamiques sociales changent in&eacute;vitablement lors des situations de crise et souvent le contexte devient tr&eagrave;s politis&eacute;. 
									Si un ou plusieurs participants bloquent
									la discussion ou cr&eacute;ent des tensions dans le groupe, essayez d'aider le groupe à g&eacute;rer cette personne en &eacute;vitant de vous impliquer personnellement.
									</p>
								
									<small>Temps requis <cite title="Source Title">[22mn:15]</cite></small>
								</blockquote> 
							</div>
						</div>
					</div>				
				</div>			
		</div>
	</div>
	<script type="text/javascript" src="js/admin_charts.js"></script>
	<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>