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
				<h1>NOUVELLE FORMATION</h1> <span>Administration de la plateforme...</span>
			</div>

				<div class="maincontent">
					<form action="AjouterFormationServlet" method="POST" class="stdform" id="ajouterFormationForm" novalidate="novalidate">
						<div class="par control-group">
							<label for="nom" class="control-label">Nom Formation</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="nom" name="nom"></div>
						</div>
						<div class="par control-group">
							<label for="client" class="control-label">Client</label>
							<div class="controls">
								<select class="uniformselect input-xxlarge" id="client" name="client" style="opacity: 0;">
										<option value="">Sélectionner un client</option>
										<option value="0">Aucun client</option>
										<option value="1">Client 1</option>
										<option value="2">Client 2</option>
										<option value="3">Client 3</option>
										<option value="4">Client 4</option>
										<option value="5">Client 5</option>
										<option value="6">Client 6</option>
									</select>
							</div>
						</div>
						<div class="par control-group">
							<label for="debut" class="control-label">Date début</label>
							<input id="dateDebutFormation" type="text" name="debut" class="input-xxlarge" />
						</div>					
						<div class="par control-group">
							<label for="fin" class="control-label">Date Fin</label>
							<input id="dateFinFormation" type="text" name="fin" class="input-xxlarge" />
						</div>	
						<div class="par control-group">
							<label for="description" class="control-label">Description</label>
							<div class="controls"><textarea id="description" class="input-xxlarge" name="description" rows="5" cols="80"></textarea></div> 
						</div>
	
						<p class="stdformbutton">
							<button class="btn btn-primary btn-rounded">Ajouter formation</button>
						</p>
					</form>



				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>