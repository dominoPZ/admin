package controller.kdj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Menu extends HttpServlet {

	//글작성 폼으로 이동
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("page", "menu");
		
		//req.setAttribute("page", "menu");
		req.getRequestDispatcher("/WEB-INF/Admin/Menu.jsp").forward(req, resp);
		
	}///// doget
	

	

}
