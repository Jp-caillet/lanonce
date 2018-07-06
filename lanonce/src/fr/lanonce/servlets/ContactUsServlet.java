package fr.lanonce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.lanonce.sendEmail.EmailSend;

/**
 * Servlet implementation class ContactUsServlet
 */
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/auth/contactus.jsp").forward(request, response);			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmailSend email = new EmailSend();
		
		String fromEmail = request.getParameter("fromEmail");
		System.out.println(fromEmail);
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");

		email.receiveEmail(fromEmail, subject, message);
		
		response.sendRedirect("/lanonce/auth/mailSent");

	}

}
