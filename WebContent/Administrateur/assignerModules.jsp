<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.contenu.Categorie"%>
<%@page import="org.mlearning.dto.contenu.Module"%>
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
					<h1>ASSIGNER MODULES</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<div id="admin_affecterCategories">
						<h2 align="center" class="d_title">Assignement modules au catégorie</h2><hr/>
						<form action="AssignerModulesServlet" method="POST" class="formWithDualSelect" id="affecterModulesForm" novalidate="novalidate">
							<p class="control-group">
								<label>Choisir une catégorie</label>
								<span class="formwrapper">
									<select data-placeholder="" style="width:100%" class="chzn-select" tabindex="2" name="categorie" id="categorie">
										<%
											List<Categorie> listeDesCategories = (List<Categorie>) request.getAttribute("listeDesCategories");
											for (Categorie c : listeDesCategories){
										%>
												<option value="<%= c.getId() %>"><%= c.getNom() %></option>
										<%
											}
										%>
									</select>
								</span>
							</p>
							<br/>
	                        <p class="control-group">
	                        	<label>Choisir la (les) liste(s) des module(s)</label>
	                            <span id="dualselect" class="dualselect">
	                            	<select class="uniformselect" name="allModules" id="allModules" multiple="multiple" size="10">
										<%
											List<Module> listeDesModules = (List<Module>) request.getAttribute("listeDesModules");
											for (Module m : listeDesModules){
										%>
												<option value="<%= m.getId() %>"><%= m.getNom() %></option>
										<%
											}
										%>
	                                </select>
	                                <span class="ds_arrow">
	                                	<button class="btn ds_prev"><i class="icon-chevron-left"></i></button><br />
	                                    <button class="btn ds_next"><i class="icon-chevron-right"></i></button>
	                                </span>
	                                <select multiple="multiple" size="10" name="allModulesRight" id="allModulesRight">
	                                	<option value=""></option>
	                                </select>
	                            </span>
	                            <input type="text" name="modules" id="hiddenDualSelect" />
	                        </p>
	                        <br/>
							<p class="stdformbutton tac">
								<button class="btn btn-primary btn-rounded">Enregistrer</button>
							</p>
                        </form>
					</div>			
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>