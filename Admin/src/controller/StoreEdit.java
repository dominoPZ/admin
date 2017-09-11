package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.StoreDAO;
import controller.dto.SalDTO;
import controller.dto.SalUserDTO;
import controller.dto.StoreDTO;
import controller.dto.ToppingDTO;

public class StoreEdit extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		req.setAttribute("page", "store");
		
		String no = req.getParameter("no");
		StoreDTO dto = new StoreDTO();
		dto.setSt_id(req.getParameter("st_id"));
		dto.setSt_name(req.getParameter("st_name"));
		dto.setSt_no(req.getParameter("st_no"));
		dto.setSt_parkin(req.getParameter("st_parkin"));
		dto.setSt_tel(req.getParameter("st_tel"));
		dto.setSt_pass(req.getParameter("st_pass"));
		dto.setSt_time(req.getParameter("st_time"));
		
		System.out.println(dto.getSt_no());
		StoreDAO dao= new StoreDAO(req.getServletContext());
		int i = dao.storeedit(dto);
		req.setAttribute("SUC_FAIL", i);
		req.setAttribute("WHERE", "EDT");
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
	}
	

}
