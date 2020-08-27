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

import interf.Account;
import model.accmodel;

@WebServlet("/info")
public class info extends HttpServlet {
	private static final long serialVersionUID = 1L;
	accmodel acc = new accmodel();
    public info() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("IDinfo");
		List<Account> la = new ArrayList<Account>();
		la = acc.show(id);
		for(Account ac: la) {
			request.setAttribute("tk", ac.getTaiKhoan());
			request.setAttribute("name", ac.getHoTen());
			request.setAttribute("sdt", ac.getSDT());
			request.setAttribute("cmnd", ac.getCMND());
			request.setAttribute("dc", ac.getDiaChi());
		}

		
		request.getRequestDispatcher("info.jsp").forward(request, response);
	}

}
