<%@page import="org.mlearning.dto.users.User"%>
<%@page import="org.mlearning.dto.users.Apprenant"%>
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
					<h1>LISTE DES APPRENANTS</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<h2 align="center" class="d_title">
						Liste des apprenants
						<%
							String vGroupe = request.getParameter("groupe");
							if( vGroupe != null ){
						%>
							du groupe "<%= request.getParameter("groupeName") %>"
						<% } %>
					</h2><hr/>
					<div id="admin_accueil_listeDesFormation">
						<% if( !(request.getParameter("code")).equals("null")){ %>
							<div class="alert alert-success">
								<button data-dismiss="alert" class="close" type="button">x</button>
								<strong>Nouveau apprenant ajouté!</strong>
							</div>
						<% } %>
						
						<ul class="widgeticons row-fluid">			
						<%
							List<Apprenant> listeDesApprenants = (List<Apprenant>) request.getAttribute("listeDesApprenants");
							for (Apprenant oneApprenant : listeDesApprenants){
						%>
								<li class="one_fifth"><a id="aThumbnailPhoto" href="ApprenantsServlet?apprenant=<%= oneApprenant.getId() %>"><img src="ImageServlet?img=<%= oneApprenant.getPhoto() %>" alt="" class="thumbnailPhoto"><span><%= oneApprenant.getNom() %></span></a></li>
							<% } %>	
						</ul>
					</div>				
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>