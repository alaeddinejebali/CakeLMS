<%@page import="org.mlearning.business.FormationBusiness"%>
<%@page import="org.mlearning.dto.users.User"%>
<%@page import="org.mlearning.dto.users.Message"%>
<%@page import="java.util.List"%>

<%
	String uri = request.getRequestURI();
	String pageName = uri.substring(uri.lastIndexOf("/")+1);
	if( (request.getSession().getAttribute("loggedUser")!=null) && (!pageName.equals("inscription.jsp")) ){
%>

<div class="headerpanel">
	<a href="" class="showmenu"></a>
	<% 
		User u = (User) request.getSession().getAttribute("loggedUser"); 
		List<Message> mesMessages = FormationBusiness.getMessagesNonLu(u.getId());
		int nbrMsgNonLu = mesMessages.size();
		String vClassMsg = "dropdown-toggle";
		if(nbrMsgNonLu>0) vClassMsg = "btn btn-danger btn-circle";
	%>
	<div class="headerright">
		<div class="dropdown notification">
			<a class="<%= vClassMsg %>" data-toggle="dropdown" data-target="#" href="/page.html">
				<span class="iconsweets-mail iconsweets-white"></span>
			</a>
			<ul class="dropdown-menu">
				<li class="nav-header">Messages</li>
				<li>
					<a href="#">Composer nouveau message</a>
					<a href="">
						<strong>Vous avez <%= nbrMsgNonLu %> messages non lus</strong><br />
					</a>
				</li>
				<% for (Message oneMessage : mesMessages){ %>
					<li><a href="DetailsMessageServlet?message=<%= oneMessage.getId() %>"><span class="icon-envelope"></span> Nouveau message de <strong><%= oneMessage.getExpediteurnom() %></strong></a></li>
				<% } %>
				<li class="viewmore tac"><a href="MessageServlet">Boite de réception</a></li>
			</ul>
		</div><!--dropdown-->
                
		<div class="dropdown userinfo">
			<a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="/page.html">Bonjour, 
				<% out.println(u.getNom()); %>!
				<b class="caret"></b>
			</a>
			<ul class="dropdown-menu">
				<li><a href=""><span class="icon-wrench"></span> Mon compte</a></li>
				<li class="divider"></li>
				<li><a href="UserServlet?logout=1"><span class="icon-off"></span> Fermer session</a></li>
			</ul>
		</div><!--dropdown-->
    		
	</div><!--headerright-->
            
</div><!--headerpanel-->
<% } %>