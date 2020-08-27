package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UpdateTicket;
@WebServlet("/UpdateSeller")
public class UpdateSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("Name");
		String cmnd = request.getParameter("Cmnd");
		String phone = request.getParameter("Phone");
		String from = request.getParameter("From");
		String to = request.getParameter("To");
		String date = request.getParameter("date");
		String figue = request.getParameter("figue");
		String spos = request.getParameter("spos");
		String price = request.getParameter("price");
		String status = request.getParameter("status");
		String ticketid = request.getParameter("ticketid");
		
		if(from == null || to == null || date == null || spos == null || price == null || status == null || ticketid == null) {
			response.sendRedirect("DetailSeller.jsp");
		}
		else {
			UpdateTicket.Update(name, cmnd, phone, from, to, date, figue, spos, price, status, ticketid, request, response);
		}
	}
	
	public static void MessageSuccess(String name, String cmnd, String phone, String from, String to, String date, String spos, String price, 
							String status, String ticketid, HttpServletRequest request, HttpServletResponse response) 
							throws ServletException, IOException{
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		session.setAttribute("cmnd", cmnd);
		session.setAttribute("phone", phone);
		session.setAttribute("from", from);
		session.setAttribute("to", to);
		session.setAttribute("date", date);
		session.setAttribute("spos", spos);
		session.setAttribute("price", price);
		session.setAttribute("status", status);
		session.setAttribute("ticketid", ticketid);
		session.setAttribute("success", "success");
		request.getRequestDispatcher("DetailSeller.jsp").forward(request, response);
	}

	public static void MessageFailed(String name, String cmnd, String phone, String from, String to, String date,
			String spos, String price, String status, String ticketid, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		session.setAttribute("cmnd", cmnd);
		session.setAttribute("phone", phone);
		session.setAttribute("from", from);
		session.setAttribute("to", to);
		session.setAttribute("date", date);
		session.setAttribute("spos", spos);
		session.setAttribute("price", price);
		session.setAttribute("status", status);
		session.setAttribute("ticketid", ticketid);
		session.setAttribute("failed", "failed");
		request.getRequestDispatcher("DetailSeller.jsp").forward(request, response);
	}
}
