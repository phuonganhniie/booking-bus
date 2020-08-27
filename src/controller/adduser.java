package controller;

import model.addusermodel;
import model.usermodel;

import java.io.IOException;
import java.nio.file.Paths;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.mindrot.jbcrypt.BCrypt;

import interf.Account;


@WebServlet("/adduser")
@MultipartConfig
public class adduser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 addusermodel taotk = new addusermodel();
	 usermodel Checktaotk = new usermodel();
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/admin.jsp");
			dispatcher.forward(request, response);
		}
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String taikhoan = request.getParameter("taikhoan");
		String matkhau = request.getParameter("matkhau");
		String cmnd = request.getParameter("cmnd");
		String hoten = request.getParameter("hoten");
		String sdt = request.getParameter("sdt");		
		String diachi = request.getParameter("diachi");		
		String vaitro = request.getParameter("vaitro");
		
				//EDITED//
		
		ResultSet cemail = Checktaotk.checkemail(taikhoan);
		try {
			
			if(!cemail.next()) {
				int rs = taotk.add(taikhoan, matkhau, cmnd, hoten, sdt, diachi, vaitro);
				System.out.println("OK");
				request.setAttribute("warning2","ABCXYZ");
				  request.getRequestDispatcher("admin.jsp").include(request, response);
			}else {
				System.out.println("NO OK");
			
				request.setAttribute("warning1","abcxyz");
				  request.getRequestDispatcher("admin.jsp").include(request, response);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		 
		
	}
}
