package fr.lanonce.filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpFilter;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;

public class AuthenticateFilter extends HttpFilter{
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
				
		if(request.getSession().getAttribute("email") == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			//response.sendRedirect("/WEB-INF/login.jsp");
		} else {
			chain.doFilter(request, response);		
		}
	}
	
	@Override
	public void destroy() {		
	}
}
