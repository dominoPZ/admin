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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import controller.dao.StoreDAO;
import controller.dto.SalDTO;
import controller.dto.SalUserDTO;
import controller.dto.StoreDTO;
import controller.dto.ToppingDTO;

public class Saile extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Map> list = new Vector<Map>();
		StoreDAO dao = new StoreDAO(req.getServletContext());
		String col = req.getParameter("col");
		String ser = req.getParameter("ser");
		System.out.println(col);
		System.out.println(ser);
		list = dao.printsaile(col,ser);
//		List<Map> list2 = dao.salescon();
		req.setAttribute("list", list);
	//	req.setAttribute("list2", list2);
		dao.close();
		req.setAttribute("page", "rating");
		req.getRequestDispatcher("/WEB-INF/Admin/RatingAndCoupon/Saile.jsp").forward(req, resp);
		
		
		
	}
	

}
