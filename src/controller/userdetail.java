package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interf.userVO;
import model.usermodel;


@WebServlet("/userdetail")
public class userdetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private usermodel usermodel;  
    public userdetail() {
    	usermodel = new usermodel();
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("detailuser", usermodel.userdetail(id));
		RequestDispatcher dt = request.getRequestDispatcher("detailuser.jsp");
		dt.forward(request, response);
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public List<userVO> listuser(){
		return usermodel.listuser();
	}
}
