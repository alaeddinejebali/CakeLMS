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
			<% if( pageName.equals("index.jsp") ||  pageName.equals("dashboard.jsp") ){ %>
				<li class='active'><br/><br/><br/><div class="alert alert-warning"><button data-dismiss="alert" class="close" type="button">x</button><strong>Veuillez choisir une formation pour consulter la listes de modules qui vous sont assignés...</strong></div><br/><br/><br/></li>
			<% }else{ %>
				<li class="nav-header active">Ressources</li>
				<li><a href="Ressources"><span class="icon-th"></span>Mes ressources</a>
				<li><a href="AjouterRessource"><span class="icon-plus"></span>Créer nouvelle</a>
				<li class="nav-header active">Mes modules</li>
					<li><a href=""><span class="icon-chevron-right"></span> La communication informelle</a>
					<li><a href=""><span class="icon-chevron-right"></span> Les méthodes de communication formelle </a>
					<li><a href=""><span class="icon-chevron-right"></span> Traiter des sujets sensibles</a>
					<li><a href=""><span class="icon-chevron-right"></span> Responsabilité et attentes </a>
					<li><a href=""><span class="icon-chevron-right"></span> Matériels et méthodes à utiliser </a>
				

			<% } %>	
		</ul>
	</div>
</div>