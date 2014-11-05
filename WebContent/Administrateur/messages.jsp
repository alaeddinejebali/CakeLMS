<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.contenu.Categorie"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="org.mlearning.dto.users.Message"%>
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
					<h1>MES MESSAGES</h1> <span>Administration de la plateforme...</span>
				</div>

				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">
		            	<h2 align="center" class="d_title">Boite de réception</h2><hr/>
						<table class="table table-bordered" id="dyntable">
							<colgroup>
								<col class="con0" style="align: center; width: 4%" />
								<col class="con1" />
							</colgroup>
							<thead>
								<tr>
									<th class="head0" align="center">Date</th>
									<th class="head0" align="center">Envoyé par</th>
									<th class="head0" align="center">Sujet</th>									
								</tr>
							</thead>
							<tbody>
		                    	<%
									List<Message> listeDesMessages = (List<Message>) request.getAttribute("listeDesMessages");
									for (Message oneMessage : listeDesMessages){
								%>
								<tr class="gradeX">
									<% String vDate = String.valueOf(oneMessage.getDatecreation().getDate()) + "/" + String.valueOf(1 + oneMessage.getDatecreation().getMonth()) + "/" + String.valueOf(1900 + oneMessage.getDatecreation().getYear()); %>
									<td><% if(!oneMessage.isLu()){ %><strong><% } %><%= vDate %><% if(!oneMessage.isLu()){ %></strong> <% } %></td>
									<td><% if(!oneMessage.isLu()){ %><strong><% } %><%= oneMessage.getExpediteurnom() %><% if(!oneMessage.isLu()){ %></strong> <% } %></td>
									<td><a href="DetailsMessageServlet?message=<%= oneMessage.getId() %>">
										<% if(!oneMessage.isLu()){ %><strong><% } %><%= oneMessage.getSujet() %><% if(!oneMessage.isLu()){ %></strong> <% } %>
									</a></td>
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