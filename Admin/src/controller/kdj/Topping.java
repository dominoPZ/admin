package controller.kdj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Topping extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "menu");
		req.getRequestDispatcher("/WEB-INF/Admin/ToppingMenu.jsp").forward(req,resp);
	}
	
}
