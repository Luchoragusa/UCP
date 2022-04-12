package servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entities.*;
import data.*;



@SuppressWarnings("serial")
@WebServlet("/registrarLugarRoboS")

public class registrarLugarRoboS extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Robo r = null;
		DataRobo dr = new DataRobo();
		DataIntegrante di = new DataIntegrante();
		LugarRobo lr = new LugarRobo();
		DataLugarRobo dlr = new DataLugarRobo();
		LinkedList<Integrante> integrantes = null;
		Integrante inte= null;
		
		String[] nrosInte;
		
		//SETEO NRO ROBO
		r = dr.getLastIdRobo();
						
		//SETEO LUGAR ROBO:
		lr.setIdLugarRobo(Integer.parseInt(request.getParameter("idLR")));
		lr = dlr.getById(lr);
		r.setLugar_robo(lr); 
						
		//SETEO RESULTADO
		r.setResultado(request.getParameter("rto"));
		
		//SETEO FECHA y HORA DEL ROBO:
		r.setFecha_robo(LocalDateTime.now());
		
		//SETEO INTEGRANTES
			inte = new Integrante();
			nrosInte = (request.getParameterValues("integrante"));
			
			for ( String nro : nrosInte) {
				integrantes = new LinkedList<>();
				inte.setIdIntegrante(Integer.parseInt(nro));
				inte=di.getByIdIntegrante(inte);
				integrantes.add(inte);
				r.setIntegrantes(integrantes);
				dr.insertRobo(r);
			}
		response.sendRedirect("HomeTuneada.jsp");
	
	}

}
