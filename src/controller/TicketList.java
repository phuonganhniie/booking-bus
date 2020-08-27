package controller;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import interf.Ticket;
import model.DisplayTicket;

@WebServlet("/TicketList")
public class TicketList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DisplayTicket list = new DisplayTicket();
	public List<Ticket> TicketBooked() {
		return list.TicketList();
	}
}
