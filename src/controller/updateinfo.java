package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.accmodel;

@WebServlet("/updateinfo")
public class updateinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	accmodel acc = new accmodel();
    public updateinfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");	
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("IDinfo");
		String tk = request.getParameter("Username");
		String name = request.getParameter("fname");
		String sdt = request.getParameter("Phone");
		String cmnd = request.getParameter("CMND");
		String address = request.getParameter("Address");
		
		if(acc.update(id, tk, name, sdt, cmnd, address)) {
			session.setAttribute("updated", 1);
		}
		else {
			session.setAttribute("errorInfo", 2);
		}
		request.getRequestDispatcher("info").forward(request, response);
		
	}

}
