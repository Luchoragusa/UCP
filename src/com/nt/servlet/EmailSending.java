package com.nt.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailSending
 */
@WebServlet("/EmailSending")
public class EmailSending extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String host;
	private String port;
	private String user;
	private String pass;
	
	public void init() {
		// lee SMTP server configurado del web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recipient = request.getParameter("recipient");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		String resultMessage = "";
		
		try {
			EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
		}
		catch (Exception ex){
			ex.printStackTrace();
		}
		finally {
			getServletContext().getRequestDispatcher("/Result.jsp").forward(request, response);
		}
	}

}
