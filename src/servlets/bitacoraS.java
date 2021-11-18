package servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

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
		Hora h = new Hora();
		DataHoras dh = new DataHoras();
		h.setIdIntegrante(i.getIdIntegrante());
		LocalTime a = LocalTime.now();
		h.setHoraInicio(a);
		LocalDate fecha = LocalDate.now();
		h.setFechaInicio(fecha);		
		dh.add(h);
		response.sendRedirect("HomeTuneada.jsp");
	}

}
