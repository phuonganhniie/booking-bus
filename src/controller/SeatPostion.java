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

@WebServlet("/SeatPosition")
public class SeatPostion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		SeatStatus st = new SeatStatus();
		HttpSession session = request.getSession();
		if(action.equals("Send")) {
			if(session.getAttribute("BusID") == null) {				
				List<String> seat = new ArrayList<String>();
				seat = st.GetSeat(Integer.parseInt(request.getParameter("id")));
				session.setAttribute("seat", seat);
				session.setAttribute("BusID", request.getParameter("id"));
			}else {
				session.removeAttribute("BusID");
				List<String> seat = new ArrayList<String>();
				seat = st.GetSeat(Integer.parseInt(request.getParameter("id")));
				session.setAttribute("seat", seat);
				session.setAttribute("BusID", request.getParameter("id"));
			}
		}
		request.getRequestDispatcher("SeatStatus.jsp").forward(request, response);
	}
}
