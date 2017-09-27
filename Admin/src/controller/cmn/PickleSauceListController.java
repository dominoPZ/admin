package controller.cmn;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.PickleSauceDAO;
import controller.dto.PickleSauceDTO;

public class PickleSauceListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "menu");
		PickleSauceDAO dao = new PickleSauceDAO(req.getServletContext());
		List<PickleSauceDTO> list = dao.selectList();
/*		System.out.println("들어오니");
		for(PickleSauceDTO dto:list) {
			System.out.println("dto:"+dto.getDr_no()+" / "+dto.getD_name()+" / "+dto.getD_price()+" / "+dto.getD_img());
		}*/
		req.setAttribute("pickleSauceList", list);
		dao.close();
		req.getRequestDispatcher("/WEB-INF/Admin/PickleNSouceList.jsp").forward(req, resp);
	}
}
