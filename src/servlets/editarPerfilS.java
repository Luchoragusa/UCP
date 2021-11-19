package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DataIntegrante;
import entities.Integrante;
@WebServlet("/editarPerfilS")
public class editarPerfilS extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Integrante i = new Integrante();
		DataIntegrante di = new DataIntegrante();
		i.setIdIntegrante(Integer.parseInt(request.getParameter("idInte").toString()));
		i.setNombre(request.getParameter("nombre"));
		i.setApellido(request.getParameter("apellido"));
		i.setDiscordId(request.getParameter("discordId"));
		i.setUsuario(request.getParameter("usuario"));
		if (!request.getParameter("pw").isEmpty())
		{
			i.setPw(request.getParameter("pw"));
		}
		di.update(i);
		response.sendRedirect("HomeTuneada.jsp");
	}
}
