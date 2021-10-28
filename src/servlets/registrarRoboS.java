package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entities.*;
import data.*;


@WebServlet("/registrarRoboS")

public class registrarRoboS extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Robo r = new Robo();
		LugarRobo lr = new LugarRobo();
		DataLugarRobo dlr = new DataLugarRobo();
		
		
		lr.setIdLugarRobo(Integer.parseInt(request.getParameter("lugarRobo")));
		lr = dlr.getById(lr);
		r.setLugar_robo(lr); 
		
		request.setAttribute("maxInte", lr.getMaxIntegrantes());
		request.setAttribute("minInte", lr.getMinIntegrantes());
		
		RequestDispatcher rd = request.getRequestDispatcher("/registrarRobo.jsp");
		rd.forward(request, response);
		
		
		r.setResultado(request.getParameter("resultado"));
	
		
		response.sendRedirect("homeTest.jsp");
	}
}
