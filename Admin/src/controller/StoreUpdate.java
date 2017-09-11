package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.StoreDAO;
import controller.dto.StoreDTO;

public class StoreUpdate extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setAttribute("page", "store");
		StoreDTO dto = new StoreDTO();
		StoreDAO dao = new StoreDAO(req.getServletContext());
		String url = "";
		if(req.getParameter("in")!=null&&req.getParameter("in").equals("in")){
			dto = dao.printStore(req.getSession().getAttribute("Sno").toString());
			url = "/WEB-INF/Mgr/Store_Update.jsp";
			req.setAttribute("dto", dto);
		}
		else{
			dto.setSt_tel(req.getParameter("st_tel"));
			dto.setSt_parkin(req.getParameter("st_parkin"));
			dto.setSt_time(req.getParameter("st_time"));
			int i = dao.update(dto,req.getSession().getAttribute("Sno").toString());
			req.setAttribute("SUC_FAIL", i);
		req.setAttribute("WHERE", "UPD");
		url = "/WEB-INF/Admin/Message.jsp";
		}
		req.getRequestDispatcher(url).forward(req, resp);
		
	}
	
	

}
