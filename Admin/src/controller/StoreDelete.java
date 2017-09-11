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

public class StoreDelete extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		StoreDAO dao= new StoreDAO(req.getServletContext());
		req.setAttribute("page", "store");
		String no = req.getParameter("s_no");
		System.out.println(no);
		int i = dao.stoDelete(no);
		System.out.println(i);
		
		req.setAttribute("SUC_FAIL",i);
		req.setAttribute("WHERE", "DEL");
		dao.close();
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
	}
	

}
