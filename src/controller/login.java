package controller;

import java.awt.Component;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.mindrot.jbcrypt.BCrypt;

import interf.Account;
import model.checkrole;
import model.loginmodel;

import static javax.swing.JOptionPane.showMessageDialog;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	loginmodel dangnhap = new loginmodel();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
	}

	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tk = request.getParameter("id");
		String mk = request.getParameter("pass");
		int id = dangnhap.login(tk, mk);
		
		//EDITED//
		String rs = dangnhap.getname(tk, mk);

		try {
			if (id != 0 && rs != null) {
				
				if (checkrole.checkrole1(tk, mk).equals("admin")) {
					HttpSession session = request.getSession();
					session.setAttribute("IDinfo", id);	
					//EDITED//
					session.setAttribute("sayhi", rs);
					
					session.setAttribute("ad", tk);
					response.sendRedirect("adminview.jsp");
					
				} else if (checkrole.checkrole1(tk, mk).equals("customer")) {
					HttpSession session = request.getSession();
					session.setAttribute("cus", tk);
					//EDITED//
					session.setAttribute("sayhi", rs);
					session.setAttribute("IDinfo", id);

					response.sendRedirect("searchingLocation");
					
				} else if (checkrole.checkrole1(tk, mk).equals("seller")) {
					HttpSession session = request.getSession();
					session.setAttribute("IDinfo", id);
					session.setAttribute("sell", tk);
					response.sendRedirect("tbooked.jsp");

				} 
			}else {
				HttpSession session = request.getSession();
				
				session.setAttribute("warning", "INCORRECT USERNAME OR PASSWORD");
				response.sendRedirect("login");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();	
		}
	}
}