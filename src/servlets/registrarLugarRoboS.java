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
		
		int nroInte;
		
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
		for(Integrante i : integrantes) {
			nroInte = Integer.parseInt(request.getParameter("integrante["+i+"]"));
			i.setIdIntegrante(nroInte);
			i=di.getByIdIntegrante(i);
			integrantes.add(i);
		}
		r.setIntegrantes(integrantes);
	
		//INSERT ROBO:
		
		for(Integrante i : integrantes) {
			dr.insertRobo(r, i, lr);
		}
		
		
		response.sendRedirect("homeTest.jsp");
	
	}
}
