package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SeatStatus;
import model.GetSelectedSeats;
@WebServlet("/BookingCustomer")
public class BookingCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		SeatStatus st = new SeatStatus();
		if(request.getParameter("accid") == null) {
			session.setAttribute("accid", 0);
		}else {
			session.setAttribute("accid", request.getParameter("accid"));
		}
		session.setAttribute("bienso", request.getParameter("bienso"));
		session.setAttribute("gioxp", request.getParameter("gioxp"));
		session.setAttribute("giod", request.getParameter("giod"));
		session.setAttribute("diemxp", request.getParameter("diemxp"));
		session.setAttribute("diemd", request.getParameter("diemd"));
		session.setAttribute("ngayxp", request.getParameter("ngayxp"));
		session.setAttribute("ngayd", request.getParameter("ngayd"));
		session.setAttribute("benxe", request.getParameter("benxe"));
		session.setAttribute("gia", request.getParameter("gia"));
		String SelectedSeats = GetSelectedSeats.GetSeats(request.getParameter("id"));
		session.setAttribute("ghedadat", SelectedSeats);
		if(request.getParameter("action").equals("Send")) {
			if(session.getAttribute("busid") == null) {				
				List<String> seat = new ArrayList<String>();
				seat = st.GetSeat(Integer.parseInt(request.getParameter("id")));
				session.setAttribute("seat", seat);
				session.setAttribute("busid", request.getParameter("id"));
			}else {
				session.removeAttribute("busid");
				List<String> seat = new ArrayList<String>();
				seat = st.GetSeat(Integer.parseInt(request.getParameter("id")));
				session.setAttribute("seat", seat);
				session.setAttribute("busid", request.getParameter("id"));
			}
		}
		request.getRequestDispatcher("BookTicket.jsp").forward(request, response);
	}
}
