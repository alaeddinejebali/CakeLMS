<%@page import="org.mlearning.dto.users.Message"%>
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
					<h1>DETAILS MESSAGE</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation" class="detailsMessage">			
						<%
							Message m = (Message) request.getAttribute("leMessage");
							String vDate = String.valueOf(m.getDatecreation().getDate()) + "/" + String.valueOf(1 + m.getDatecreation().getMonth()) + "/" + String.valueOf(1900 + m.getDatecreation().getYear());
						%>
						<h2 align="center" class="d_title"><%= m.getSujet() %></h2><hr/>
						Envoyé par <strong><%= m.getExpediteurnom() %></strong> le <i><%= vDate %></i><br/>
						<p><%= m.getContenu() %></p>
					</div>				
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>