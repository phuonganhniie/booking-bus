package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import model.addusermodel;
import model.usermodel;

@WebServlet("/createuser")
public class createuser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	addusermodel taotk = new addusermodel();
	usermodel Checktaotk = new usermodel();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String taikhoan = request.getParameter("taikhoan");

		String matkhau = request.getParameter("newpass");

		String cmnd = request.getParameter("cmnd");

		String hoten = request.getParameter("hoten");

		String sdt = request.getParameter("sdt");

		String diachi = request.getParameter("diachi");

		String vaitro = request.getParameter("vaitro");

		String hash = BCrypt.hashpw(matkhau, BCrypt.gensalt(12));

		// EDITED //

		ResultSet cemail = Checktaotk.checkemail(taikhoan);
		try {

			if (!cemail.next()) {
				int rs = taotk.add(taikhoan, hash, cmnd, hoten, sdt, diachi, vaitro);
				System.out.println("OK");
				request.setAttribute("warning2", "ABCXYZ");
				request.getRequestDispatcher("login").include(request, response);
			} else {
				System.out.println("NO OK");

				request.setAttribute("warning1", "abcxyz");
				request.getRequestDispatcher("login").include(request, response);

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