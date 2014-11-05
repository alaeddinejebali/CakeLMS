<%@page import="org.mlearning.dto.users.Tuteur"%>
<%@page import="org.mlearning.dto.contenu.Module"%>
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
					<h1>ASSIGNER TUTEUR</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<div id="admin_affecterCategories">
						<form action="AssignerTuteursServlet" method="POST" class="formWithDualSelect" id="affecterTuteursForm" novalidate="novalidate">
							<p class="control-group">
								<label>Choisir un module</label>
								<span class="formwrapper">
									<select data-placeholder="" style="width:100%" class="chzn-select" tabindex="2" name="module" id="module">
										<%
											List<Module> listeDesModules = (List<Module>) request.getAttribute("listeDesModules");
											for (Module m : listeDesModules){
										%>
												<option value="<%= m.getId() %>"><%= m.getNom() %></option>
										<%
											}
										%>
									</select>
								</span>
							</p><br/>
	                        <p class="control-group">
	                        	<label>Choisir la (les) liste(s) des tuteur(s)</label>
	                            <span id="dualselect" class="dualselect">
	                            	<select class="uniformselect" name="allTuteurs" id="allTuteurs" multiple="multiple" size="10">
										<%
											List<Tuteur> listeDesTuteurs = (List<Tuteur>) request.getAttribute("listeDesTuteurs");
											for (Tuteur t : listeDesTuteurs){
										%>
												<option value="<%= t.getId() %>"><%= t.getNom() %></option>
										<%
											}
										%>
	                                </select>
	                                <span class="ds_arrow">
	                                	<button class="btn ds_prev"><i class="icon-chevron-left"></i></button><br />
	                                    <button class="btn ds_next"><i class="icon-chevron-right"></i></button>
	                                </span>
	                                <select multiple="multiple" size="10" name="allTuteursRight" id="allTuteursRight">
	                                	<option value=""></option>
	                                </select>
	                            </span>
	                            <input type="text" name="tuteurs" id="hiddenDualSelect" />
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