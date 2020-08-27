package controller;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import interf.Bus;
import model.DisplayBus;


@WebServlet("/BusList")
public class BusList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DisplayBus list = new DisplayBus();
	public List<Bus> Bus() {
		return list.BusList();
	}
}
