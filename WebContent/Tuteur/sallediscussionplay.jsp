<%@page import="org.mlearning.dto.contenu.Groupe"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="org.mlearning.dto.users.Tuteur"%>
<%@page import="org.mlearning.dto.users.Apprenant"%>
<%@page import="org.mlearning.dto.contenu.Formation"%>
<%@page import="org.mlearning.dto.contenu.Module"%>
<%@page import="org.mlearning.dto.contenu.Ressource"%>
<%@page import="org.mlearning.dto.contenu.Cours"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="java.util.List"%>

<jsp:include page="../assets/layout/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/administrateur.css" />
	<div class="mainwrapper">
		<jsp:include page="../assets/layout/tuteur/menu.jsp"></jsp:include>
		<div class="rightpanel">
    		<jsp:include page="../assets/layout/common/top.jsp"></jsp:include>
				<div class="breadcrumbwidget">
					<ul class="breadcrumb">
						<li><a href="./">Accueil</a> <span class="divider">/</span></li>
						<li class="active">Tableau de bord</li>
					</ul>
				</div>
				<div class="pagetitle">
					<h1>ESPACE TUTEUR</h1> <span>Mes ressources...</span>
				</div>
				<div class="maincontent">
					<div id="admin_accueil_listeDesFormation">
						<hr/><h2 align="center" class="d_title">Salle deiscussion active [Salle TEST]</h2><hr/>
						<iframe src="https://ovx.me/embed/session.html?p=cz1Tb21lVW5pcXVlU2Vzc2lvbklEJm49R3Vlc3QmY2FsbHR5cGU9bnVsbCZhdXRvY2xvc2U9bnVsbCZhdXRvc3RhcnQ9ZmFsc2UmY2M9MSZudW1iZXI9NDY5NTU1MTIxMiZjaGF0d2luZG93PWVuYWJsZSZhbGxvd1JlY29yZGluZz1lbmFibGUmYWxsb3dEaWFsb3V0PWVuYWJsZSZyb290ZG9jPWh0dHBzJTNBJTJGJTJGb3Z4Lm1lJTJGZW1iZWQlMkZ0cnlvdnguaHRtbCUzRm92eHNlc3Npb24lM0RTb21lVW5pcXVlU2Vzc2lvbklEJmFwaWtleT1teUFQSUtleSZhdXRvcmVjb3JkPWVuYWJsZSZvcGVudHlwZT1lbWJlZCZwYXJ0aWNpcGFudHM9NiZ2b2ljZWJyb3dzZXI9ZmFsc2U%3D" width="400" height="500"></iframe>
					</div>		
				</div>				
		</div>
	</div>
	<script type="text/javascript" src="js/admin_charts.js"></script>
	<jsp:include page="../assets/layout/common/footer.jsp"></jsp:include>