<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.contenu.Categorie"%>
<%@page import="org.mlearning.dto.contenu.Module"%>
<%@page import="org.mlearning.dto.users.User"%>
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
					<h1>NOUVEAU MODULE</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">			
					<form action="AjouterModuleServlet" method="POST" class="stdform" id="ajouterModuleForm" novalidate="novalidate">
						<div class="par control-group">
							<label for="nom" class="control-label">Nom module</label>
							<div class="controls"><input type="text" class="input-xxlarge" id="nom" name="nom"></div>
						</div>
						<div class="par control-group">
							<label for="description" class="control-label">Description</label>
							<div class="controls"><textarea id="description" class="input-xxlarge" name="description" rows="5" cols="80"></textarea></div> 
						</div>
						<div class="par control-group">
							<label for="excerpt" class="control-label">Excerpt</label>
							<div class="controls"><textarea id="excerpt" class="input-xxlarge" name="excerpt" rows="5" cols="80"></textarea></div> 
						</div>
						<p class="stdformbutton">
							<button class="btn btn-primary btn-rounded">Ajouter module</button>
						</p>
					</form>
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>