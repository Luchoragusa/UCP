package servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
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
		LinkedList<Integrante> integrantes = new LinkedList<>();
		Integrante inte= null;
		
		String[] nrosInte;
		int i=1;
		Boolean band=true;
		
		//SETEO NRO ROBO
		r = dr.getLastIdRobo();
				
		
		//SETEO LUGAR ROBO:
		lr.setIdLugarRobo(Integer.parseInt(request.getParameter("lugarRobo")));
		lr = dlr.getById(lr);
		r.setLugar_robo(lr); 
		
	

				
		//SETEO RESULTADO
		r.setResultado(request.getParameter("rto"));
		
		//SETEO FECHA y HORA DEL ROBO:
		r.setFecha_robo(LocalDate.now());
		r.setHora_robo(LocalTime.now());
		
		//SETEO INTEGRANTES
		
			inte = new Integrante();
			nrosInte = (request.getParameterValues("integrante"));
			
			for ( String nro : nrosInte) {
				inte.setIdIntegrante(Integer.parseInt(nro));
				inte=di.getByIdIntegrante(inte);
				integrantes.add(inte);
				dr.insertRobo(r, inte, lr);
			}

		//INSERT ROBO:
			r.setIntegrantes(integrantes);
	
		
		response.sendRedirect("homeTest.jsp");
	
	}
}
