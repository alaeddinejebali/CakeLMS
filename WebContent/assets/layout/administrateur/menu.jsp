<%@page import="java.text.SimpleDateFormat"%>
<%
	String uri = request.getRequestURI();
	String pageName = uri.substring(uri.lastIndexOf("/")+1);
%>
<div class="leftpanel">
	<div class="logopanel">
		<h1><a href="dashboard.html">Administration</a></h1>
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
			<li class="nav-header">Main Navigation</li>
            	
			<li <% if(pageName.equals("index.jsp")) out.println(" class='active'"); %>> <a href="AdministrateurServlet"><span class="iconsweets-home"></span>Tableau de bord</a></li>
                
			<li class="dropdown  <% if(pageName.equals("ajouterApprenant.jsp") || pageName.equals("rechercherApprenant.jsp") || pageName.equals("apprenants.jsp") || pageName.equals("detailsApprenant.jsp") ) out.println(" active"); %>"><a href=""><span class="icon-briefcase"></span>Apprenants</a>
				<ul>
					<li><a href="AjouterApprenantServlet"><span class="icon-pencil"></span>Ajouter nouveau</a></li>
					<li><a href="ApprenantsServlet"><span class="icon-list"></span>Liste des apprenants</a></li>
					<li><a href="RechercherApprenantServlet"><span class="icon-search"></span>Rechercher</a></li>
				</ul>
			</li>

			<li class="dropdown  <% if(pageName.equals("ajouterTuteur.jsp") || pageName.equals("rechercherTuteur.jsp") || pageName.equals("tuteurs.jsp") || pageName.equals("detailsTuteur.jsp") ) out.println(" active"); %>"><a href=""><span class="icon-user"></span>Tuteurs</a>
				<ul>
					<li><a href="AjouterTuteurServlet"><span class="icon-pencil"></span>Ajouter nouveau</a></li>
					<li><a href="TuteursServlet"><span class="icon-list"></span>Liste des tuteurs</a></li>
					<li><a href="RechercherTuteurServlet"><span class="icon-search"></span>Rechercher</a></li>
				</ul>
			</li>
			
			<li class="dropdown  <% if(pageName.equals("ajouterGroupe.jsp") || pageName.equals("rechercherGroupe.jsp") || pageName.equals("groupe.jsp") || pageName.equals("assignerApprenantsGroupe.jsp") ) out.println(" active"); %>"><a href=""><span class="icon-th"></span>Groupes</a>
				<ul>
					<li><a href="AjouterGroupeServlet"><span class="icon-pencil"></span>Ajouter nouveau</a></li>
					<li><a href="GroupeServlet"><span class="icon-list"></span>Liste des groupes</a></li>
					<li><a href="RechercherGroupeServlet"><span class="icon-search"></span>Rechercher</a></li>
					<li><a href="AssignerApprenantsGroupeServlet"><span class="icon-briefcase"></span>Assigner apprenants</a></li>
				</ul>
			</li>
			
			<li class="dropdown  <% if(pageName.equals("ajouterCategorie.jsp") || pageName.equals("rechercherCategorie.jsp") || pageName.equals("assignerModules.jsp") || pageName.equals("categories.jsp") ) out.println(" active"); %>"><a href=""><span class="icon-list-alt"></span>Catégories</a>
				<ul>
					<li><a href="AjouterCategorieServlet"><span class="icon-pencil"></span>Ajouter nouveau</a></li>
					<li><a href="CategorieServlet"><span class="icon-list"></span>Liste des catégories</a></li>
					<li><a href="RechercherCategorieServlet"><span class="icon-search"></span>Rechercher</a></li>
					<li><a href="AssignerModulesServlet"><span class="iconsweets-folder"></span>Assigner modules</a></li>
				</ul>
			</li>
			
			<li class="dropdown  <% if(pageName.equals("ajouterModule.jsp") || pageName.equals("rechercherModule.jsp") || pageName.equals("assignerTuteurs.jsp") || pageName.equals("modules.jsp")) out.println(" active"); %>"><a href=""><span class="iconsweets-folder"></span>Modules</a>
				<ul>
					<li><a href="AjouterModuleServlet"><span class="icon-pencil"></span>Ajouter nouveau</a></li>
					<li><a href="ModuleServlet"><span class="icon-list"></span>Liste des modules</a></li>
					<li><a href="RechercherModuleServlet"><span class="icon-search"></span>Rechercher</a></li>
					<li><a href="AssignerTuteursServlet"><span class="icon-user"></span>Assigner tuteur</a></li>
				</ul>
			</li>
			
			<li class="dropdown  <% if(pageName.equals("ajouterFormation.jsp") || pageName.equals("rechercherFormation.jsp") || pageName.equals("assignerCategories.jsp") || pageName.equals("assignerApprenantsFormation.jsp")) out.println(" active"); %>"><a href=""><span class="icon-text-height"></span>Formations</a>
				<ul>
					<li><a href="AjouterFormationServlet"><span class="icon-pencil"></span>Ajouter nouvelle</a></li>
					<li><a href="RechercherFormationServlet"><span class="icon-search"></span>Rechercher</a></li>
					<li><a href="AssignerCategoriesServlet"><span class="icon-list-alt"></span>Assigner catégories</a></li>
					<li><a href="AssignerApprenantsFormationServlet"><span class="icon-briefcase"></span>Assigner apprenants</a></li>
					<li><a href="AssignerGroupesFormationServlet"><span class="icon-th"></span>Assigner groupes</a></li>
				</ul>
			</li>
			
			<li <% if(pageName.equals("sallediscussion.jsp")) out.println(" class='active'"); %>> <a href="Sallediscussion"><span class="icon-facetime-video"></span>Salles</a></li>			
		</ul>
	</div>
</div>