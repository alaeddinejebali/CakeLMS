<%@page import="org.mlearning.dto.contenu.Groupe"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="org.mlearning.dto.users.Tuteur"%>
<%@page import="org.mlearning.dto.users.Apprenant"%>
<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.contenu.Module"%>
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
						<%
							String nomFormation = (String)request.getAttribute("nomFormation");
						%>
						<hr/><h2 align="center" class="d_title"><%= nomFormation %></h2><hr/>
						<!-- ----------------------	LISTE DES APPRENANTS	--------------------- -->
						<hr/><h2 align="center" class="d_title">Liste des apprenants</h2><hr/>
						<ul id="sortable2" class="sortlist ui-sortable">				
							<%
								List<Apprenant> listeDesApprenants = (List<Apprenant>) request.getAttribute("listeDesApprenants");
								for (Apprenant a : listeDesApprenants){
							%>
									<li>
										<div class="label">
											<span class="icon-align-justify"></span><span class="icon-arrow-down showcnt"></span>
											<strong><%= a.getNom() %></strong>
										</div>
										<div class="details">
											<p>
												<div class="tac">
													<strong class="tac"><u><%= a.getNom() %></u></strong>
												</div>
											</p>
										</div>	
									</li>
							<%
								}
							%>
						</ul>

						<!-- ----------------------	LISTE DES GROUPES	--------------------- -->
						<hr/><h2 align="center" class="d_title">Liste des groupes</h2><hr/>
						<ul id="sortable2" class="sortlist ui-sortable">				
							<%
								List<Groupe> listeDesGroupes = (List<Groupe>) request.getAttribute("listeDesGroupes");
								for (Groupe g : listeDesGroupes){
							%>
									<li>
										<div class="label">
											<span class="icon-align-justify"></span><span class="icon-arrow-down showcnt"></span>
											<strong><%= g.getNom() %></strong>
										</div>
										<div class="details">
											<p>
												<div class="tac">
													<strong class="tac"><u><%= g.getNom() %></u></strong>
												</div>
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