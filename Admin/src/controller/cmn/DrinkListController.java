package controller.cmn;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dtr.DrinkDao;
import model.dtr.DrinkDto;

public class DrinkListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.setAttribute("page", "menu");
		DrinkDao dao = new DrinkDao(req.getServletContext());
		List<DrinkDto> list = dao.selectList();
		req.setAttribute("drinkList", list);
		dao.close();
		req.getRequestDispatcher("/WEB-INF/Admin/DrinkMenu.jsp").forward(req, resp);
	}
}
