package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interf.Location;
import model.searchingModel;

@WebServlet("/searchingLocation")
public class searchingLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
   private searchingModel searchingmodel;
	
    public searchingLocation() {
        searchingmodel = new searchingModel(); 
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		request.setAttribute("datepicker", searchingmodel.listlocation());
		request.setAttribute("searching", searchingmodel.listlocal());
		request.setAttribute("searching1", searchingmodel.listlocalfrom());
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.include(request, response);
	}		
	
	public List<Location> listlocation() {
		return searchingmodel.listlocation();
	}
}
