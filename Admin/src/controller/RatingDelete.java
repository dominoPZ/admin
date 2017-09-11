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
import controller.dto.ToppingDTO;

public class RatingDelete extends HttpServlet {
	

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		StoreDAO dao = new StoreDAO(req.getServletContext());
		System.out.println(req.getParameter("rno"));
		int i = dao.ratingdelete(req.getParameter("rno"));
		
		dao.close();
		req.setAttribute("page", "rating");
		req.setAttribute("SUC_FAIL", i);
		req.setAttribute("WHERE", "RDEL");
		
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
		
	}
	

}
