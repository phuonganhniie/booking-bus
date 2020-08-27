package controller;


import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.updateusermodel;


@WebServlet("/updateuser")
@MultipartConfig
public class updateuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	updateusermodel updatetk = new updateusermodel();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");		
		int matk = Integer.parseInt(request.getParameter("matk"));
		System.out.println(matk);
		String taikhoan = request.getParameter("taikhoan");
		
		String matkhau = request.getParameter("newpass");
		
		String cmnd = request.getParameter("cmnd");
		
		String hoten = request.getParameter("hoten");
		
		String sdt = request.getParameter("sdt");
		
		String diachi = request.getParameter("diachi");
		
		String vaitro = request.getParameter("vaitro");
		
		
		int rs = updatetk.update(matk,taikhoan, matkhau, cmnd, hoten, sdt, diachi, vaitro);
		
		
		  request.getRequestDispatcher("adminview.jsp").include(request, response);
		 
		
	}
}
