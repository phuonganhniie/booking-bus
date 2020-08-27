package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AddTicketDb;
import model.searchingModel;
@WebServlet("/AddTicket")
public class AddTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private searchingModel searchingmodel;
    public AddTicket() {
        super();
        searchingmodel = new searchingModel(); 
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String busid = request.getParameter("busid");
		String fname = request.getParameter("fname");
		String pnumber = request.getParameter("pnumber");
		String inumber = request.getParameter("inumber");
		String address = request.getParameter("address");
		String sseat = request.getParameter("sseat");
		String accountid = request.getParameter("accid");
		
		if(fname != null && pnumber != null && inumber != null && address != null && sseat != null && busid != null && accountid != null) {
			AddTicketDb.AddTicket(busid, fname, pnumber, inumber, address, sseat, accountid);
			session.setAttribute("success", "success");
			RequestDispatcher rd = request.getRequestDispatcher("searchingLocation");
			rd.forward(request, response);
		}else {
			session.setAttribute("failed", "f");
			request.getRequestDispatcher("BookTicket.jsp").forward(request, response);
		}
	}

}
