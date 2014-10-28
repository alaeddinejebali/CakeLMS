<%@page import="java.math.BigDecimal"%>
<%@page import="org.mlearning.dto.users.Tuteur"%>
<%@page import="org.mlearning.dto.users.Apprenant"%>
<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="java.util.List"%>

<jsp:include page="../assets/layout/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/administrateur.css" />
	<div class="mainwrapper">
		<jsp:include page="../assets/layout/tuteur/menu.jsp"></jsp:include>
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

				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">
						<!-- ----------------------	LISTE DES FORMATIONS	--------------------- -->
						<hr/><h2 align="center" class="d_title">Liste des formations</h2><hr/>
						<ul id="sortable2" class="sortlist ui-sortable">				
							<%
								List<Formation> listeDesFormations = (List<Formation>) request.getAttribute("listeDesFormations");
								for (Formation f : listeDesFormations){
									float fProgress = f.getProgress();
							%>
								<li>
									<div class="label">
										<span class="icon-align-justify"></span><span class="icon-arrow-down showcnt"></span>
										<strong><%= f.getNom() %></strong>
									</div>
									<div class="details">
										<p>
											<div class="tac">
												<strong class="tac"><a href="DashboardTuteurServlet?f=<%= f.getId() %>">Choisir la formation "<u><%= f.getNom() %></u>"</a></strong><br/>
												<%
											       BigDecimal bd = new BigDecimal(Float.toString(fProgress));
										        bd = bd.setScale(2, BigDecimal.ROUND_HALF_UP);
										        float tmp_fProgress = bd.floatValue();												
												%>
												(<strong><%= tmp_fProgress %>% terminée</strong>)
											</div><br/>
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
											<blockquote><p><%= f.getDescription() %></p></blockquote>
										</p>
									</div>	
								</li>
						<%
							}
						%>
						</ul>
					</div>		
				</div>				
		</div>
	</div>
	<script type="text/javascript" src="js/admin_charts.js"></script>
	<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>