package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.accmodel;

@WebServlet("/changePwd")
public class changePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	accmodel acc = new accmodel();
       
    public changePwd() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("IDinfo");
		String pwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		if(acc.changePwd(id, pwd,newpwd)) {
			session.setAttribute("changed", 1);
		}else {
			session.setAttribute("echange", 2);
		}
		request.getRequestDispatcher("info").forward(request, response);
	}

}
