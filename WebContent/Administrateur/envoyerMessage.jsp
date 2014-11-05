<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="java.util.List"%>

<jsp:include page="../assets/layout/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/administrateur.css" />
	<div class="mainwrapper">
		<jsp:include page="../assets/layout/administrateur/menu.jsp"></jsp:include>
		<div class="rightpanel">
    		<jsp:include page="../assets/layout/common/top.jsp"></jsp:include>
    		
    		<!-- BREAD CRUMB -START  -->
			<div class="breadcrumbwidget">
				<ul class="breadcrumb">
					<li><a href="./">Accueil</a> <span class="divider">/</span></li>
					<li class="active">Tableau de bord</li>
				</ul>
			</div>
			<!-- BREAD CRUMB -END  -->
			
			<div class="pagetitle">
				<h1>MESSAGE</h1> <span>Contact intra-plateforme...</span>
			</div>
			<div class="maincontent">
				<h2 align="center" class="d_title">Envoyer un message 
					<%
						String vUser = request.getParameter("user");
						String vGroupe = request.getParameter("groupe");
						if(vGroupe.equals("null")){
					%>
							à "<%= request.getParameter("userName")  %>"
					<% }else{ %>
							à "<%= request.getParameter("groupeName")  %>"
					<% } %>
				</h2><hr/>
				<form action="EnvoyerMessageServlet" method="POST" class="stdform" id="envoyerMessageForm" novalidate="novalidate">
					<div class="par control-group">
						<label for="sujet" class="control-label">Sujet</label>
						<div class="controls"><input type="text" class="input-xxlarge" id="sujet" name="sujet"></div>
					</div>
					<div class="par control-group">
						<label for="message" class="control-label">Message</label>
						<div class="controls"><textarea id="message" class="input-xxlarge" name="message" rows="5" cols="80"></textarea></div> 
					</div>
					<input type="hidden" name="user" value="<%= request.getParameter("user") %>" />
					<input type="hidden" name="groupe" value="<%= request.getParameter("groupe") %>" />
					<p class="stdformbutton">
						<button class="btn btn-primary btn-rounded">Envoyer message</button>
					</p>
				</form>
			</div>
		</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>