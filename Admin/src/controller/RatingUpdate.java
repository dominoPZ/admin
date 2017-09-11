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

public class RatingUpdate extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] coupons = req.getParameterValues("coupon");
		String rname = req.getParameter("r_name");
		String rtar = req.getParameter("r_target");
		String rno = req.getParameter("rno");
		
		StoreDAO dao = new StoreDAO(req.getServletContext());
		int i = 0;
		i = dao.ratingupdate(rno,rname,rtar);
		int k=0;
		k = dao.deletecr(rno);
		int l = 0;
		if(coupons!=null)
		for(String coupon : coupons) {
			l = dao.setcr(rno,coupon);
		}
		dao.close();
		req.setAttribute("page", "menu");
		req.setAttribute("SUC_FAIL", i);
		req.setAttribute("WHERE", "REDT");
		
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
		
	}
	

}
