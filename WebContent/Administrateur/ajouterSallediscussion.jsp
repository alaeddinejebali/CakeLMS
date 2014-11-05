<%@page import="org.mlearning.dto.users.Apprenant"%>
<%@page import="org.mlearning.dto.users.Tuteur"%>
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
			
			<!-- TIME PICKER -->
			<script type="text/javascript" language="javascript" src="assets/composants/TimePicker/protoplasm.js"></script>
			<script type="text/javascript" language="javascript">
				Protoplasm.use('timepicker').transform('input.timepicker', {use24hrs: false});
			</script>
			<script type="text/javascript" src="assets/composants/TimePicker/timepicker.js"></script>
			<link rel="stylesheet" type="text/css" href="assets/composants/TimePicker/timepicker.css">
			<!-- /TIME PICKER -->	
				<div class="maincontent">
					<h2 align="center" class="d_title">Ajouter une salle de formation</h2><hr/>
					<form action="AjouterSallediscussion" method="POST" class="stdform formWithDualSelect" id="ajouterSalleFormationForm" novalidate="novalidate">
						<div class="par control-group">
							<label for="nom" class="control-label">Nom</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="nom" name="nom"></div>
						</div>
						<div class="par control-group">
							<label for="description" class="control-label">Description</label>
							<div class="controls"><textarea id="description" class="input-xxlarge" name="description" rows="5" cols="80"></textarea></div> 
						</div>						
						<div class="par control-group">
							<label for="debut" class="control-label">Date début</label>
							<input id="dateDebutFormation" type="text" name="debut" class="input-xxlarge" />
						</div>
						<div class="par control-group cb pt20">
							<label for="tempsRequis" class="control-label">Temps début</label>
							<div class="controls">
								<input type="text" class="input-xxlarge timepicker" id="tempsDebut" name="tempsDebut">
							</div>
						</div>
						<div class="par control-group">
							<label for="fin" class="control-label">Date Fin</label>
							<input id="dateFinFormation" type="text" name="fin" class="input-xxlarge" />
						</div>
						<div class="par control-group cb pt20">
							<label for="tempsRequis" class="control-label">Temps fin</label>
							<div class="controls">
								<input type="text" class="input-xxlarge timepicker" id="tempsFin" name="tempsFin">
							</div>
						</div>
						<div class="par control-group">
							<label>Choisir une formation</label>
							<div class="controls">
								<span class="formwrapper">
									<select data-placeholder="" style="width:100%" class="chzn-select" tabindex="2" name="formation" id="formation">
										<%
											List<Formation> listeDesFormations = (List<Formation>) request.getAttribute("listeDesFormations");
											for (Formation f : listeDesFormations){
										%>
												<option value="<%= f.getId() %>"><%= f.getNom() %></option>
										<%
											}
										%>
									</select>
								</span>
							</div>
						</div>
						
						<div class="control-group">
							<label>Choisir un tuteur</label>
							<div class="controls">
								<span class="formwrapper">
									<select data-placeholder="" style="width:100%" class="chzn-select" tabindex="2" name="tuteur" id="tuteur">
										<%
											List<Tuteur> listeDesTuteurs = (List<Tuteur>) request.getAttribute("listeDesTuteurs");
											for (Tuteur t : listeDesTuteurs){
										%>
												<option value="<%= t.getId() %>"><%= t.getNom() %></option>
										<%
											}
										%>
									</select>
								</span>
							</div>
						</div>
						
						<div class="control-group">
							<label>Choisir le (les) apprenant(s)</label>
							<div class="controls">
	                            <span id="dualselect" class="dualselect">
	                            	<select class="uniformselect" name="allCategories" id="allCategories" multiple="multiple" size="10">
										<%
											List<Apprenant> listeDesApprenants = (List<Apprenant>) request.getAttribute("listeDesApprenants");
											for (Apprenant a : listeDesApprenants){
										%>
												<option value="<%= a.getId() %>"><%= a.getNom() %></option>
										<%
											}
										%>
	                                </select>
	                                <span class="ds_arrow">
	                                	<button class="btn ds_prev"><i class="icon-chevron-left"></i></button><br />
	                                    <button class="btn ds_next"><i class="icon-chevron-right"></i></button>
	                                </span>
	                                <select multiple="multiple" size="10" name="allCategoriesRight" id="allCategoriesRight">
	                                	<option value=""></option>
	                                </select>
	                            </span>
							</div>
							<input type="text" name="apprenants" id="hiddenDualSelect" />
						</div>
	
						<p class="stdformbutton">
							<button class="btn btn-primary btn-rounded">Ajouter la salle</button>
						</p>
					</form>



				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>