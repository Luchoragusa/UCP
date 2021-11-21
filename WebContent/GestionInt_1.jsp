<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[PSG]Gestion Integrante</title>
    <link rel="stylesheet" href="./dist/css/GestionIntegrante.css">
    <link href="./dist/css/style.min.css" rel="stylesheet">
    <style type="text/css">
        .btn-outline-secondary {
            padding-right: 50px;
            padding-left: 50px;
            text-align: center;
            background-color: #1250ce;
            color: #fff;
            width: 200px;
            position: relative;
            left: 500px;
            bottom: 20px;
            margin-bottom: 30px;
            margin-top: 20px;
        } 
    </style>
</head>
<body>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<hr>
<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="col-lg-12">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr>
	                                <th>Usuario</th>
	                                <th>Rango</th>
	                                <th>Fecha ultimo ascenso</th>
	                                <th>SubDivision</th>
	                                <th>Discord ID</th>
	                                <th></th>
	                                <th></th>
                                </tr>
                            </thead>
			<%
				LinkedList<Integrante> integrantes = new LinkedList<>();
				DataIntegrante di = new DataIntegrante();
				integrantes = di.getAll();
				for(Integrante i :  integrantes) {
			%>
                                <tr>
                                    <td>
                                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt="">
                                        <a class="user-link" href='GestionInt_2.jsp?id=<%=i.getIdIntegrante()%>'><%=i.getNombre() + " " +  i.getApellido()%></a>
                                        <span class="user-subhead">Usuario/Admin</span>
                                    </td>
                                    <td>
                                    	<span class="label label-info"><%=i.getRanInt().getRango().getNomRango() %> </span>                                    	
                                    </td>
                                    <td class="text-center"><%=i.getRanInt().getFecha_desde() %></td>
                                    <td>
                                    	<span class="label label-danger">
	                                    	<%
												String nSub = i.getSub().getDescripcion();
												if(nSub != null)
													out.println(nSub);
												else
													out.println("Sin Sub");									
											%> 
										</span>                                    	
                                    </td>
                                    <td style="width: 20%;"> <%=i.getDiscordId() %> </td>
                                </tr>
            <%
				}
			%>  
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>

<div class="container">
    <a button type="button" class="btn btn-outline-secondary" href="HomeTuneada.jsp">Home</a>
</div>
</body>
</html>