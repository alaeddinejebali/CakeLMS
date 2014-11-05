<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.contenu.Categorie"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="org.mlearning.dto.users.Apprenant"%>
<%@page import="java.util.List"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.*, java.awt.*, java.awt.image.*,com.sun.image.codec.jpeg.*" %>

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
					<h1>DETAILS APPRENANT</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">			
						<% Apprenant a = (Apprenant) request.getAttribute("lApprenant"); %>

						<div class="row-fluid">
							<div class="span4 tac">
								<h2><%= a.getNom() %></h2>
								<div class="detailsUserPhone"><h3><a href=""><%= a.getPhone() %></a></h3></div>
								<img class="detailsUserPhoto" src="ImageServlet?img=<%= a.getPhoto() %>" />
							</div>
							<div class="span8">
						<div class="detailsUser tac">
							<a href="EnvoyerMessageServlet?user=<%= a.getId() %>&userName=<%= a.getNom() %>&groupe=null&groupeName=null" class="btn btn-danger btn-rounded"><i class="iconsweets-mail iconsweets-white"></i>  Composer un message</a>
							<% if(a.isIsactive()){ %>
								<a href="ApprenantsServlet?apprenant=<%= a.getId() %>&activate=0" class="btn btn-warning btn-rounded"><i class="iconsweets-mail iconsweets-white"></i>  Désactiver ce compte&nbsp;</a>
								<br/><hr/><h3>Cet apprenant est activé</h3><hr/>
							<%
								}
							else{
							%>
								<a href="ApprenantsServlet?apprenant=<%= a.getId() %>&activate=1" class="btn btn-success btn-rounded"><i class="iconsweets-create iconsweets-white"></i>  Activer ce compte&nbsp;&nbsp;</a>
								<br/><hr/><h3>Cet apprenant est désactivé</h3><hr/>
							<% } %>
						</div>

								<dl class="dl-horizontal">
									<dt>Inscrit depuis</dt>
									<dd><%= String.valueOf(a.getDateinscription().getDate()) + " / " + String.valueOf(1 + a.getDateinscription().getMonth()) + " / " + String.valueOf(1900 + a.getDateinscription().getYear()) %></dd><br/>
									<dt>Email</dt>
									<dd><%= a.getEmail() %></dd><br/>
									<dt>Pays</dt>
									<dd><%= a.getPays() %></dd><br/>
									<dt>Ville</dt>
									<dd><%= a.getVille() %></dd><br/>
									<dt>Adresse</dt>
									<dd><%= a.getAdresse() %></dd><br/>
									<dt>Identifiant</dt>
									<dd><%= a.getIdentifiantunique() %> (<%= a.getNatureidentifiant() %>)</dd><br/>
									<dt>Né(e) le </dt>
									<dd><%= String.valueOf(a.getNaissance().getDate()) + " / " + String.valueOf(1+a.getNaissance().getMonth()) + " / " + String.valueOf(1900 + a.getNaissance().getYear()) %> </dd>
								</dl>							
							</div>
						</div>

					</div>				
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>