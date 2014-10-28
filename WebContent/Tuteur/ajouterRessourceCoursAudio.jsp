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
				<h1>CR&Eacute;ATION COURS</h1> <span>Création contenu...</span>
			</div>

				<div class="maincontent">
					<!-- TINYMCE EDITOR -->
					<script type="text/javascript" src="assets/composants/tinymce/tinymce.min.js"></script>
					<script type="text/javascript">
						tinymce.init({selector: "textarea.tinymce"});
					</script>
					<!-- TIME PICKER -->
					<script type="text/javascript" language="javascript" src="assets/composants/TimePicker/protoplasm.js"></script>
					<script type="text/javascript" language="javascript">
						Protoplasm.use('timepicker').transform('input.timepicker', {use24hrs: false});
					</script>
					<script type="text/javascript" src="assets/composants/TimePicker/timepicker.js"></script>
					<link rel="stylesheet" type="text/css" href="assets/composants/TimePicker/timepicker.css">
					
					<!-- AJOUT FORM -->					
					<h2 align="center" class="d_title">Créer une ressource audio</h2><hr/>
					<form action="AjouterRessourceCoursAudio" method="POST" class="stdform" id="ajouterRessourceCoursTextForm" novalidate="novalidate" enctype="multipart/form-data">
						<div class="par control-group">
							<label for="titre" class="control-label">Titre</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="titre" name="titre"></div>
						</div>
						<div class="par control-group">
							<label for="url" class="control-label">Source audio</label>
							<div class="controls">
								<!-- <input type="text" class="input-xxlarge" id="url" name="url"> -->
								<span class="formwrapper">
                            	<select id="url" name="url" data-placeholder="Choisir une ressource..." class="chzn-select listWithSearch" tabindex="2">
									<option value=""></option>
									<script type="text/javascript" src="assets/webServices/appels/getRessourcesAudio.js"></script>
								</select>	 
                                  								
							</div>
						</div>
						<div class="par control-group">
							<label for="description" class="control-label">Description</label>
							<div class="controls"><textarea id="description" class="input-xxlarge" name="description" rows="5" cols="80"></textarea></div> 
						</div>
						<div class="par control-group">
							<label for="excerpt" class="control-label">Excerpt</label>
							<div class="controls"><textarea id="excerpt" class="input-xxlarge" name="excerpt" rows="5" cols="80"></textarea></div> 
						</div>
						<div class="par control-group">
							<label for="contenu" class="control-label">Contenu</label>
							<div class="controls">
								<div class="fl">
									<textarea id="contenu" class="input-xxlarge tinymce" name="contenu" rows="5" cols="80"></textarea>
								</div>
							</div> 
						</div>
						<div class="par control-group cb pt20">
							<label for="tempsRequis" class="control-label">Temps requis</label>
							<div class="controls"><input type="text" class="input-xxlarge timepicker" id="tempsRequis" name="tempsRequis"></div>
						</div>
						<div class="par">
							<label>Thumbnail</label>
							<div class="fileupload fileupload-new" data-provides="fileupload"><input type="hidden">
								<div class="input-append">
									<div class="uneditable-input span4">
										<i class="icon-file fileupload-exists"></i>
										<span class="fileupload-preview"></span>
									</div>
									<span class="btn btn-file"><span class="fileupload-new">Upload</span>
									<span class="fileupload-exists">Modifier</span>
									<input type="file" name="file" id="file"></span>
									<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Supprimer</a>
								</div>
							</div>
						</div>
						<p class="stdformbutton">
							<button class="btn btn-primary btn-rounded">Ajouter ressource audio</button>
						</p>
					</form>
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>