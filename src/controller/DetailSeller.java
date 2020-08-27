package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DetailSeller")
public class DetailSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("name", request.getParameter("name"));
		session.setAttribute("cmnd", request.getParameter("cmnd"));
		session.setAttribute("phone", request.getParameter("phone"));
		session.setAttribute("from", request.getParameter("from"));
		session.setAttribute("to", request.getParameter("to"));
		session.setAttribute("date", request.getParameter("date"));
		session.setAttribute("price", request.getParameter("price"));
		session.setAttribute("spos", request.getParameter("spos"));
		session.setAttribute("status", request.getParameter("status"));
		session.setAttribute("ticketid", request.getParameter("ticketid"));
		request.getRequestDispatcher("DetailSeller.jsp").forward(request, response);
	}

}
