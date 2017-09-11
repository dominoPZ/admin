package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.StoreDAO;

public class Rating extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "rating");
		StoreDAO dao = new StoreDAO(req.getServletContext());
		List<Map> list = dao.printrating();
		req.setAttribute("list", list);
		dao.close();
		req.getRequestDispatcher("/WEB-INF/Admin/RatingAndCoupon/Rating.jsp").forward(req, resp);
		
		
		//ml55ssdc9181
	}///// doget
	
	
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
		
		req.getRequestDispatcher("/WEB-INF/Admin/RatingAndCoupon/RatingEDT.jsp").forward(req, resp);
	}

}
