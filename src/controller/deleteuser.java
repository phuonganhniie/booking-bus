package controller;

import model.deleteusermodel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteuser")
@MultipartConfig
public class deleteuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	 deleteusermodel deltk = new deleteusermodel();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String mataikhoan = request.getParameter("action");
	
	deltk.del(mataikhoan);
		
		  request.getRequestDispatcher("adminview.jsp").include(request, response);
		 
		
	}
}
