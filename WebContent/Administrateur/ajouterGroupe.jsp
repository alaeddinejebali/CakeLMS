<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="java.util.List"%>

<jsp:include page="../assets/layout/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/administrateur.css" />
	<div class="mainwrapper">
		<jsp:include page="../assets/layout/administrateur/menu.jsp"></jsp:include>
		<div class="rightpanel">
    		<jsp:include page="../assets/layout/common/top.jsp"></jsp:include>
    		
    		<!-- BREAD CRUMB -START  -->
			<div class="breadcrumbwidget">
				<ul class="breadcrumb">
					<li><a href="./">Accueil</a> <span class="divider">/</span></li>
					<li class="active">Tableau de bord</li>
				</ul>
			</div>
			<!-- BREAD CRUMB -END  -->
			
			<div class="pagetitle">
				<h1>NOUVEAU GROUPE</h1> <span>Administration de la plateforme...</span>
			</div>

				<div class="maincontent">
					<form action="AjouterGroupeServlet" method="POST" class="stdform" id="ajouterGroupeForm" novalidate="novalidate">
						<div class="par control-group">
							<label for="nom" class="control-label">Nom Groupe</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="nom" name="nom"></div>
						</div>
	
						<p class="stdformbutton">
							<button class="btn btn-primary btn-rounded">Ajouter groupe</button>
						</p>
					</form>



				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>