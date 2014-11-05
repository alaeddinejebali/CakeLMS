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
					<h1>RECHERCHER TUTEUR</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">
		            	<h2 align="center" class="d_title">Rechercher tuteur</h2><hr/>
						<table class="table table-bordered" id="dyntable">
							<colgroup>
								<col class="con0" style="align: center; width: 4%" />
								<col class="con1" />
							</colgroup>
							<thead>
								<tr>
									<th class="head0 nosort"> </th>
									<th class="head0" align="center">Nom</th>
									<th class="head0" align="center">Tél Mobile</th>
								</tr>
							</thead>
							<tbody>
		                    	<%
									List<Tuteur> listeDesTuteurs = (List<Tuteur>) request.getAttribute("listeDesTuteurs");
									for (Tuteur oneTuteur : listeDesTuteurs){
								%>
								<tr class="gradeX">
									<td class="aligncenter"><span class="center">
										<a href="TuteursServlet?tuteur=<%= oneTuteur.getId() %>"><img src="images/img/see.png" /></a>
									</span></td>
									<td><%= oneTuteur.getNom() %></td>
									<td><%= oneTuteur.getPhone() %></td>
								</tr>
								<%
									}
								%> 
		                    </tbody>
		                </table>
					</div>				
				</div>
			</div>	
			<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>