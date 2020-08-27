package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.searchingModel;

@WebServlet("/searchingBus")
public class searchingBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private searchingModel searchingmodel;
	
    public searchingBus() {
        super();
        searchingmodel = new searchingModel(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String DiemXP = request.getParameter("from");
		String DiemDen = request.getParameter("to");
		String NgayXP = request.getParameter("datepicker");
		HttpSession session = request.getSession();
		session.setAttribute("searchingbus", searchingmodel.searchbus(DiemXP, DiemDen, NgayXP));	
		RequestDispatcher rd = request.getRequestDispatcher("buspage.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
