package controller.cmn;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.MemberDAO;
import controller.dto.SalesListDTO;

public class SalesListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//선택한 회원의 구매내역 출력용]
		try {
			req.setAttribute("page", "member");
			String id = req.getParameter("salesList");
			req.setAttribute("id", id);
			if(id != null){
				//리스트 출력용]
				MemberDAO dao = new MemberDAO(req.getServletContext());
				List<SalesListDTO> list = dao.salesSelectList(id);
				req.setAttribute("list", list);
				int total=0;
				for(SalesListDTO dto:list) {
					total += Integer.parseInt(dto.getMenu_price()) * Integer.parseInt(dto.getMenu_qty());
				}
				req.setAttribute("total", total);
				dao.close();
				req.getRequestDispatcher("/WEB-INF/Admin/SalesList.jsp").forward(req, resp);		
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
