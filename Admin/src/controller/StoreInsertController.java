package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.StoreDAO;
import controller.dto.StoreDTO;

public class StoreInsertController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		StoreDTO dto = new StoreDTO();
		dto.setSt_addr(req.getParameter("addr1")+" ^^ "+req.getParameter("addr2"));
		dto.setSt_id(req.getParameter("st_id"));
		dto.setSt_name(req.getParameter("st_name"));
		dto.setSt_pass(req.getParameter("st_pass"));
		dto.setSt_post(req.getParameter("post1")+"-"+req.getParameter("post2"));
		dto.setSt_tel(req.getParameter("st_tel"));
		dto.setSt_parkin(req.getParameter("st_parkin"));
		dto.setSt_time(req.getParameter("st_time"));
		
		
		
		StoreDAO dao = new StoreDAO(req.getServletContext());
		int i = dao.insert(dto);
		req.setAttribute("page", "menu");
		req.setAttribute("SUC_FAIL", i);
		req.setAttribute("WHERE", "INS");
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
		
	}
	
	

}
