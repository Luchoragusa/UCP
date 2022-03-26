package servlets;

import java.io.IOException;
import java.time.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DataHoras;
import entities.Hora;
import entities.Integrante;

@WebServlet("/bitacoraS")
public class bitacoraS extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		Integrante i = new Integrante();
		HttpSession session = request.getSession();
		i.setIdIntegrante((int) session.getAttribute("id"));
		Hora h = null;
		DataHoras dh = new DataHoras();
		
		// Valido si tiene bitacora abierta
		
		h = dh.getHorasDelIntegrante(i);
		if (h.getFin() == null)
			dh.remove(h);

		h = new Hora();
		h.setIdIntegrante(i.getIdIntegrante());
		h.setInicio(LocalDateTime.now());
		dh.add(h);
		
		response.sendRedirect("HomeTuneada.jsp");
	}
}