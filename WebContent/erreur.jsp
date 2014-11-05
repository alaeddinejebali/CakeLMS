<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Failed JSP</title>
</head>
<body>
<%
String erreur = (String) request.getAttribute("erreur");
if (erreur != null){ %>
     <strong>Erreur : </strong>
<%


} %>

<form  method="post" >
<fieldset>
<legend>Authentification</legend>
<br> Login    :<input type="text" name="login" size="50" maxlength="50" />
<br> Password :<input type="password" name="password" size="50" maxlength="50" />
<br />
</fieldset>
<input type="submit" value="Connexion" size="50" maxlength="50" />


<input type="submit" value="facebook" size="50" maxlength="50" />
<br/>

<img src="image/Facebook.jpg" type="submit"/>


</form>
</body>
</html>