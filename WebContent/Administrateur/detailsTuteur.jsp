<%@page import="org.mlearning.dto.users.Tuteur"%>
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
					<h1>DETAILS TUTEUR</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">			
						<% Tuteur t = (Tuteur) request.getAttribute("leTuteur"); %>

						<div class="row-fluid">
							<div class="span4 tac">
								<h2><%= t.getNom() %></h2>
								<div class="detailsUserPhone"><h3><a href=""><%= t.getPhone() %></a></h3></div>
								<img class="detailsUserPhoto" src="ImageServlet?img=<%= t.getPhoto() %>" />
							</div>
							<div class="span8">
						<div class="detailsUser tac">
							<a href="EnvoyerMessageServlet?user=<%= t.getId() %>&userName=<%= t.getNom() %>&groupe=null&groupeName=null" class="btn btn-danger btn-rounded"><i class="iconsweets-mail iconsweets-white"></i>  Composer un message</a>
							<% if(t.isIsactive()){ %>
								<a href="TuteursServlet?tuteur=<%= t.getId() %>&activate=0" class="btn btn-warning btn-rounded"><i class="iconsweets-mail iconsweets-white"></i>  Désactiver ce compte&nbsp;</a>
								<br/><hr/><h3>Ce tuteur est activé</h3><hr/>
							<%
								}
							else{
							%>
								<a href="TuteursServlet?tuteur=<%= t.getId() %>&activate=1" class="btn btn-success btn-rounded"><i class="iconsweets-create iconsweets-white"></i>  Activer ce compte&nbsp;&nbsp;</a>
								<br/><hr/><h3>Ce tuteur est désactivé</h3><hr/>
							<% } %>
						</div>

								<dl class="dl-horizontal">
									<dt>Inscrit depuis</dt>
									<dd><%= t.getDateinscription() %></dd><br/>
									<dt>Email</dt>
									<dd><%= t.getEmail() %></dd><br/>
									<dt>Pays</dt>
									<dd><%= t.getPays() %></dd><br/>
									<dt>Ville</dt>
									<dd><%= t.getVille() %></dd><br/>
									<dt>Adresse</dt>
									<dd><%= t.getAdresse() %></dd><br/>
									<dt>Identifiant</dt>
									<dd><%= t.getIdentifiantunique() %> (<%= t.getNatureidentifiant() %>)</dd><br/>
									<dt>Né(e) le </dt>
									<dd><%= t.getNaissance() %> </dd>
								</dl>							
							</div>
						</div>

					</div>				
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>