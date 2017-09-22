package controller.kdj;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dtr.DrinkDao;

public class Drink extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "menu");
		DrinkDao dao =  new DrinkDao(req.getServletContext());
		Map map = new HashMap<>();
		
		
		
		req.getRequestDispatcher("/WEB-INF/Admin/DrinkMenu.jsp").forward(req,resp);
	}
	
}
