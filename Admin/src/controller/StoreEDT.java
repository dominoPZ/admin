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

public class StoreEDT extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		req.setAttribute("page", "store");
		StoreDAO dao= new StoreDAO(req.getServletContext());
		StoreDTO dto = dao.storeedt(no);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/WEB-INF/Admin/Store_EView.jsp").forward(req, resp);
	}
	

}
