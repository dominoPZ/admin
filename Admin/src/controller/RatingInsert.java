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

public class RatingInsert extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "rating");
		StoreDAO dao = new StoreDAO(req.getServletContext());
		String rno = req.getParameter("rno");
		req.setAttribute("rno", rno);
		Map map = new HashMap();		
		List<Map> list = new Vector<Map>();
		List<Map> list2 = new Vector<Map>();
		map = dao.viewrating(rno);
		
		System.out.println(rno);
		list = dao.printrc(rno);  // 해당 등급 쿠폰저장
		String whr = "";
		for(Map mp : list) {
			whr += mp.get("cno")+",";
			System.out.println(mp.get("cno"));
			System.out.println(whr);
		}
		if(whr.equals(""))
			whr="99999";
		whr = whr.trim().substring(0, whr.length()-1);
		System.out.println(whr);
		list2 = dao.printsc(whr);	// 해등등급 쿠폰 제외한 모든 쿠폰 저장
		dao.close();
		req.setAttribute("map", map);// 해당 등급 정보저장
		req.setAttribute("list", list);
		req.setAttribute("list2", list2);
		
		
		req.getRequestDispatcher("/WEB-INF/Admin/RatingAndCoupon/RatingInsert.jsp").forward(req, resp);
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] coupons = req.getParameterValues("coupon");
		String rname = req.getParameter("r_name");
		String rtar = req.getParameter("r_target");
		String rno = req.getParameter("rno");
		
		StoreDAO dao = new StoreDAO(req.getServletContext());
		rno = dao.ratingInsert(rno,rname,rtar);
		int i=0;
		if(rno!=null&&rno.trim().length()>0)
			i=1;
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
		req.setAttribute("WHERE", "RINS");
		
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
		
	}
	

}
