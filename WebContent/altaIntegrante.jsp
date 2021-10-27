<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Alta Integrante</title>
	</head>
	<body>
		<form action="altaIntegranteS" method="post">
			Nombre: <input type = "text" name = "nombre"><br><br>
			Apellido: <input type="text" name = "apellido"><br><br>
			DiscordID: <input type="text" name = "dsId"><br><br>
			SteamHex: <input type="text" name = "steamHex"><br><br>
			Nombre usuario: <input type="text" name = "nombreUsuario"><br><br>
			Contrasenia: <input type="password" name = "pw"><br><br>
			Rango:
			 <select name="rango">
                    <option value="Aspirante"> Aspirante</option>
                    <option value="Aprendiz"> Aprendiz</option>
                    <option value="Empleado"> Empleado</option>
                    <option value="Experimentado"> Experimentado</option>
                    <option value="Agente"> Agente</option>
                    <option value="Supervisor"> Supervisor</option>
                    <option value="Auxiliar del Cuerpo"> Auxiliar del Cuerpo</option>
                    <option value="Seguridad del Cuerpo"> Seguridad del Cuerpo</option>
                    <option value="Sub-Encargado del Cuerpo"> Sub-Encargado del Cuerpo</option>         
                    <option value="Encargado del Cuerpo"> Encargado del Cuerpo</option>
                    <option value="Maestro del Cuerpo"> Maestro del Cuerpo</option>
                    <option value="Instructor del Cuerpo"> Instructor del Cuerpo</option>
                    <option value="Especialista del Cuerpo"> Especialista del Cuerpo</option>
                    <option value="Sub-Jefe del Cuerpo"> Sub-Jefe del Cuerpo</option>
                    <option value="Jefe del Cuerpo"> Jefe del Cuerpo</option>
                    <option value="Gerente"> Gerente</option>
                    <option value="Interventor"> Interventor</option>
                </select><br><br>
             Rol:
			 <select name="rol">
                    <option value="User"> Usuario</option>
                    <option value="Admin"> Admin</option>
                </select><br><br>
			<input type = "submit" value = "Agregar"><br>
		</form>
	</body>
</html>