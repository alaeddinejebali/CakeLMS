<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.mlearning.dto.contenu.Module"%>
<%@page import="java.util.List"%>

<script type="text/javascript" src="js/tuteur.js"></script>
<%
	String uri = request.getRequestURI();
	String pageName = uri.substring(uri.lastIndexOf("/")+1);
%>
<div class="leftpanel">
	<div class="logopanel espaceTuteur">
		<h1><a href="TuteurServlet">&nbsp;&nbsp;&nbsp;Espace tuteur</a></h1>
	</div>

	<div class="datewidget">
		<%
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat ft = new java.text.SimpleDateFormat("'Nous somme le ' dd / MM / yyyy '@' hh:mm a");
			out.println( ft.format(dt) );
		%>
	</div>
	<div class="leftmenu">
		<ul class="nav nav-tabs nav-stacked">
			<% if( pageName.equals("index.jsp") ){ %>
				<li class='active'><br/><br/><br/><div class="alert alert-warning"><button data-dismiss="alert" class="close" type="button">x</button><strong>Veuillez choisir une formation pour consulter la listes de modules qui vous sont assignés...</strong></div><br/><br/><br/></li>
			<% }else{ %>
				<li class="nav-header">Ressources</li>
				<li <% if(pageName.equals("ressources.jsp")) out.println(" class='active'"); %>><a href="Ressources"><span class="icon-th"></span>Mes ressources</a>
				<li <% if( pageName.equals("ajouterRessource.jsp") ||  pageName.equals("ajouterRessourceCoursAudio.jsp") ||  pageName.equals("ajouterRessourceCoursText.jsp") ||  pageName.equals("ajouterRessourceCoursVideo.jsp") ||  pageName.equals("ajouterRessourceQuizz.jsp") ) out.println(" class='active'"); %>><a href="AjouterRessource"><span class="icon-plus"></span>Créer nouvelle</a>
				<li class="nav-header">Mes modules</li>
				<%
					List<Module> listeDeMesModules =  (List<Module>) request.getSession().getAttribute("mesModules");
					for (Module m : listeDeMesModules){
				%>
						<li><a href=""><span class="icon-chevron-right"></span><%= m.getNom() %></a>
				<%
					}
				%>
			<% } %>	
			<li class="nav-header">Salles de discussion en cours</li>
			<li <% if(pageName.equals("sallediscussionplay.jsp")) out.println(" class='active'"); %>> <a href="Sallediscussionplay"><span class="icon-facetime-video"></span>Salle TEST</a></li>
		</ul>
	</div>
</div>