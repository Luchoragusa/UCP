<%@page import="java.util.LinkedList"%>
<%@page import="entities.Integrante"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="http://getbootstrap.com/favicon.ico">

<title>Web Home</title>

	<!-- Bootstrap core CSS -->
	<link href="style/bootstrap.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href = "style/start.css" rel="stylesheet">
	
	 <%
	 	Integrante p = (Integrante)session.getAttribute("integrante");
	 	LinkedList<Integrante> li = (LinkedList<Integrante>)request.getAttribute("listaIntegrantes");
	 %>

</head>
<body>

<div class="container">
	<div class="row">
		<h4>Integrante</h4>
			<div clas="col-12 col-sm-12 col-lg-12">
				<div clas="table-responsive">
					<table class="table">
						<thread>
							<tr>
								<th>id</th>
								<th>nombre</th>
								<th>apellido</th>
								<th>steamHex</th>
								<th>discordID</th>
						</thread>
						<tbody>
						<% for (Integrante i : li) { %>
							<tr>
								<td><%=i.getIdIntegrante()%></td>
								<td><%=i.getNombre()%></td>
								<td><%=i.getApellido()%></td>
								<td><%=i.getSteamHex()%></td>
								<td><%=i.getDiscordId()%></td>																																	
							</tr>
						<% } %>
						</tbody>
					</table>
				</div>						
			</div>
	</div>
</div>

</body>
</html>