<%@page import="org.mlearning.dto.users.Tuteur"%>
<%@page import="org.mlearning.dto.users.Apprenant"%>
<%@page import="org.mlearning.dto.contenu.Formation"%>
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
					<h1>TABLEAU DE BORD</h1> <span>Administration de la plateforme...</span>
				</div>

				<br/><h2 align="center" class="d_title">&Eacute;volution inscription dans la plateforme</h2><hr/>
				<input id="tabChartApprenant" type="hidden" value="[[2008, 6], [2009,3], [2010, 8], [2011, 5], [2012, 13], [2013, 8], [2014, 11]]" />
				<input id="tabChartTuteur" type="hidden" value="[[2008, 4], [2009,4], [2010, 1], [2011, 9], [2012, 10], [2013, 13], [2014, 13]]" />
				<input id="tabChartFormation" type="hidden" value="[[2008, 6], [2009,9], [2010, 1], [2011, 9], [2012, 12], [2013, 9], [2014, 6]]" />
				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">
						<!-- --------------------------	GRAPH EVOLUTION	------------------------- -->
						<div class="row-fluid">
							<div class="span12">
								<div id="chartplace" style="height:300px;"></div>
							</div>
						</div>
					
						<!-- ----------------------	LISTE DES FORMATIONS	--------------------- -->
						<br/><hr/><h2 align="center" class="d_title">Liste des formations</h2><hr/>
						<link rel="stylesheet" type="text/css" href="assets/composants/roundedList.css" />
						<ol class="rounded-list">				
						<%
							List<Formation> listeDesFormations = (List<Formation>) request.getAttribute("listeDesFormations");
							for (Formation f : listeDesFormations){
								float fProgress = f.getProgress();
						%>
								<li><a href="./DetailsFormationServlet?id=<%= f.getId() %>">
									<strong><%= f.getNom() %></strong><br/>
									<%
										if(fProgress <= 50){
									%>
											<div class="progress progress-danger progress-striped active">
												<div class="bar" style="width: <%= fProgress %>%"></div>
											</div>
									<%
										}
										else if(fProgress == 100){
									%>
											<div class="progress progress-success">
												<div class="bar" style="width: <%= fProgress %>%"></div>
											</div>
									<%
										}
										else{
									%>
											<div class="progress progress-warning  progress-striped active">
											    <div class="bar" style="width: <%= fProgress %>%"></div>
											</div>
									<%
										}
									%>
								</a></li>
						<%
							}
						%>
						</ol>

						<!-- ----------------------	DERNIERE INSCRIPTION	--------------------- -->
						<br/><h2 align="center" class="d_title">Dernières inscriptions</h2><hr/>
							<div class="row-fluid">
								<div class="span12">
									<div class="span6">
										<h3 align="center">5 derniers apprenants inscrits</h3><hr/>
										<%
											List<Apprenant> listeDesDerniersApprenantsInscrits = (List<Apprenant>) request.getAttribute("listeDesDerniersApprenantsInscrits");
											for (Apprenant a : listeDesDerniersApprenantsInscrits){
										%>
											<div class="row-fluid">
												<div class="span12 adminDernieresInscriptionsThumbnail">
													<a href="ApprenantsServlet?apprenant=<%= a.getId() %>">
														<div class="_thumbnail"><img class="thumbnailPhoto" alt="" src="ImageServlet?img=<%= a.getPhoto() %>"></div>
														<div class="_nom"><%= a.getNom() %><br/><%= a.getPhone() %></div>
													</a>	
												</div>
											</div>	
										<% } %>
									</div>
									<div class="span6 dernierTuteursInscrits">
										<h3 align="center">5 derniers tuteurs inscrits</h3><hr/>
										<%
											List<Tuteur> listeDesDerniersTuteursInscrits = (List<Tuteur>) request.getAttribute("listeDesDerniersTuteursInscrits");
											for (Tuteur t : listeDesDerniersTuteursInscrits){
										%>
											<div class="row-fluid">
												<div class="span12 adminDernieresInscriptionsThumbnail">
													<a href="TuteursServlet?tuteur=<%= t.getId() %>">
														<div class="_thumbnail"><img class="thumbnailPhoto" alt="" src="ImageServlet?img=<%= t.getPhoto() %>"></div>
														<div class="_nom"><%= t.getNom() %><br/><%= t.getPhone() %></div>
													</a>	
												</div>
											</div>	
										<% } %>
									</div>
								</div>
							</div>
									

							
						</div>		
					</div>				
				</div>
			</div>
			<script type="text/javascript" src="js/admin_charts.js"></script>
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>