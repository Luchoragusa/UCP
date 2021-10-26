package servlets;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DataHoras;
import entities.Hora;
import entities.Integrante;

@WebServlet("/cerrarBitacoraS")
public class cerrarBitacoraS extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{		
		Integrante i = new Integrante();
		HttpSession session = request.getSession();
		i.setIdIntegrante((int) session.getAttribute("id"));
		Hora h = new Hora(); 
		DataHoras dh = new DataHoras();

		h.setIdIntegrante(i.getIdIntegrante());
		h = dh.getHorasDelIntegrante(h.getIdIntegrante());					
				
		if (h.getHoraFin() == null) 
		{
			LocalDate fechaF = LocalDate.now();
			LocalTime fin = LocalTime.now();
			h.setHoraFin(fin);
			h.setFechaFin(fechaF);
			Duration diferencia = Duration.between(h.getHoraInicio(), h.getHoraFin());
			if (fechaF.getDayOfMonth() == h.getFechaInicio().getDayOfMonth())
			{
				h.setHorasJugadas(LocalTime.of(diferencia.toHoursPart(), diferencia.toMinutesPart())); 
			}
			else
			{
				h.setHorasJugadas(LocalTime.of(diferencia.toHoursPart()+23, diferencia.toMinutesPart()+59));
			}
			dh.update(h);	
			response.sendRedirect("homeTest.jsp");
		}
		else
		{
			response.sendRedirect("bitacora.jsp");
		}
	}
}
