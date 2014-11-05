<%@page import="org.mlearning.dto.contenu.Groupe"%>
<%@page import="org.mlearning.dto.users.Apprenant"%>
<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.contenu.Categorie"%>
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
					<h1>DETAILS FORMATION</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">			
						<%
							Formation f = (Formation) request.getAttribute("laFormation");
						%>
						<h2 align="center" class="d_title"><%= f.getNom() %></h2><hr/>
						<p><%= f.getDescription() %></p>
						<%
							java.util.Date debut = f.getDebut();
							java.util.Date fin = f.getFin();
							String vDebut = String.valueOf(debut.getDate()) + " / " + String.valueOf(debut.getMonth()) + " / " + String.valueOf(1900 + debut.getYear()) ;
							String vFin = String.valueOf(fin.getDate()) + " / " + String.valueOf(fin.getMonth()) + " / " + String.valueOf(1900 + fin.getYear()) ;
						%>
						<p>
							<strong>Date debut</strong>: <%= vDebut %><br/>
							<strong>Date fin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>: <%= vFin %>
						</p>
						
						<br/>
						
						<div class="row-fluid">
							<div class="span12">
								<h4 class="widgettitle nomargin shadowed"><a href="AssignerCategoriesServlet"><img src="images/img/edit.png" /></a>&nbsp;&nbsp;&nbsp;Liste des catégories assignés</h4>
								<div class="widgetcontent bordered shadowed">
									<ol class="dCustomList_rectangle_list dCustomList_ol">
										<%
											List<Categorie> mesCategories = f.getCategorie();
											for (Categorie oneCategory : mesCategories) {
												List<Categorie> listeDesCategories = oneCategory.getListChild();
										%>
												<li><a href="ModuleServlet?categorie=<%= oneCategory.getId() %>&categorieName=<%= oneCategory.getNom() %>"><strong><%= oneCategory.getNom() %></strong></a>
													<ol class="dCustomList_ol">
											<%
													for (Categorie childCategory : listeDesCategories) {
											%>
													<li><a href="ModuleServlet?categorie=<%= childCategory.getId() %>&categorieName=<%= childCategory.getNom() %>"><%= childCategory.getNom() %></a></li>
											<%			
													}
											%>
												</ol>
												</li>
										<%
											}
										%>
									</ol>
								</div>
							</div>
						</div>

						<div class="row-fluid">
							<div class="span12">
								<h4 class="widgettitle nomargin shadowed"><a href="AssignerApprenantsFormationServlet"><img src="images/img/edit.png" /></a>&nbsp;&nbsp;&nbsp;Liste des apprenants assignés</h4>
								<div class="widgetcontent bordered shadowed">
									<ol class="dCustomList_rectangle_list dCustomList_ol">
										<%
											List<Apprenant> mesApprenants = f.getApprenant();
											for (Apprenant oneApprenant : mesApprenants) {
										%>
												<li><a href="ApprenantsServlet?apprenant=<%= oneApprenant.getId() %>"><strong><%= oneApprenant.getNom() %></strong></a></li>
										<%
											}
										%>
									</ol>
								</div>
							</div>
						</div>

						<div class="row-fluid">
							<div class="span12">
								<h4 class="widgettitle nomargin shadowed"><a href="AssignerApprenantsFormationServlet"><img src="images/img/edit.png" /></a>&nbsp;&nbsp;&nbsp;Liste des groupes assignés</h4>
								<div class="widgetcontent bordered shadowed">
									<ol class="dCustomList_rectangle_list dCustomList_ol">
										<%
											List<Groupe> mesGroupes = f.getGroupe();
											for (Groupe unGroupe : mesGroupes) {
										%>
												<li><a href="ApprenantsServlet?apprenant=%= unGroupe.getId() %>"><strong><%= unGroupe.getNom() %></strong></a></li>
										<%
											}
										%>
									</ol>
								</div>
							</div>
						</div>

					</div>				
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>