package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entities.*;


@WebServlet("/registrarRoboS")

public class registrarRoboS extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Robo r = new Robo();
		LugarRobo lr = new LugarRobo();
		lr.setIdLugarRobo(Integer.parseInt(request.getParameter("idLugarRobo")));
		lr.setMaxIntegrantes(Integer.parseInt(request.getParameter("maxIntegrantes")));
		lr.setMinIntregantes(Integer.parseInt(request.getParameter("minIntegrantes")));
		r.setLugar_robo(lr); 
		r.setResultado(request.getParameter("resultado"));
	
		
		response.sendRedirect("homeTest.jsp");
	}
}
