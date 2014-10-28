<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="java.util.List"%>

<jsp:include page="../assets/layout/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/administrateur.css" />
	<div class="mainwrapper">
		<jsp:include page="../assets/layout/tuteur/menu.jsp"></jsp:include>
		<div class="rightpanel">
    		<jsp:include page="../assets/layout/common/top.jsp"></jsp:include>
    		
    		<!-- BREAD CRUMB -START  -->
			<div class="breadcrumbwidget">
				<ul class="breadcrumb">
					<li><a href="TuteurServlet">Liste des formations</a> <span class="divider">/</span></li>
					<li><a href="DashboardTuteurServlet">Tableau de board</a></li>
				</ul>
			</div>
			<!-- BREAD CRUMB -END  -->
			
			<div class="pagetitle">
				<h1>CR&Eacute;ATION contenu</h1> <span>Choix type de contenu...</span>
			</div>

				<div class="maincontent">
					<h2 align="center" class="d_title">Choisir le type du ressource à créee</h2><hr/>
					<div class="row-fluid">
						<div class="span2"></div>
						<div class="span4 tac choixTypeRessource">
							<a href="AjouterRessourceCoursText"><img src="images/text.png" /></a><br/><h3>Ressource textuelle</h3>
						</div>
						<div class="span4 tac choixTypeRessource">
							<a href="AjouterRessourceCoursAudio"><img src="images/audio.png" /></a><br/><h3>Ressource audio</h3>
						</div>						
						<div class="span2"></div>
					</div>
					<div class="row-fluid">
						<div class="span2"></div>
						<div class="span4 tac choixTypeRessource">
							<a href="AjouterRessourceCoursVideo"><img src="images/video.png" /></a><br/><h3>Ressource vidéo</h3>
						</div>
						<div class="span4 tac choixTypeRessource">
							<a href="AjouterRessourceQuizz"><img src="images/question.png" /></a><br/><h3>Ressource quizz</h3>
						</div>						
						<div class="span2"></div>
					</div>					
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>