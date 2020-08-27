package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Delete;

@WebServlet("/DeleteTicket")
public class DeleteTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String spos = request.getParameter("spos");		
		String ticketid = request.getParameter("ticketid");
		String customer = request.getParameter("customer");
		
		Delete.DeleteTicket(spos, ticketid);
		
		if(customer != null) {
			session.setAttribute("f5", "refresh");
			request.getRequestDispatcher("searchingLocation").forward(request, response);
		}else {
			response.sendRedirect("tbooked.jsp");
		}
	}

}
