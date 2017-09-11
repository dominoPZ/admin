package controller.kdj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class editSideMenuController extends HttpServlet {

	//리스트 폼으로 이동
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "menu");
		req.getRequestDispatcher("/Admin/WebContent/WEB-INF/Admin/editSideMenu.jsp").forward(req,resp);
	}
	//리스트 뿌려주기
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}
