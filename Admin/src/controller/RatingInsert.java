package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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

import com.oreilly.servlet.MultipartRequest;

import controller.dao.StoreDAO;
import controller.dto.SalDTO;
import controller.dto.SalUserDTO;
import controller.dto.ToppingDTO;

public class RatingInsert extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MultipartRequest mr=model.dtr.FileUtils.upload(req,req.getServletContext().getRealPath("/Image/rating"));
		//한글 처리
		req.setCharacterEncoding("UTF-8");
		System.out.println(req.getServletContext().getRealPath("/Image/rating"));
		
		String r_img="";
		if(mr!=null) {
		String[] coupons = mr.getParameterValues("coupon");
		String rname = mr.getParameter("r_name");
		String rtar = mr.getParameter("r_target");
		String rno = mr.getParameter("rno");
		r_img = mr.getFilesystemName("r_img");
		
		File file = new File(req.getServletContext().getRealPath("/Image/rating")+File.separator+r_img);
		System.out.println(file.getName());
		String jpg = file.getName().substring(file.getName().length()-3,file.getName().length());
		System.out.println(file.getName()+"@!"+jpg);
		file.renameTo( new File(req.getServletContext().getRealPath("/Image/rating")+File.separator+rname+"."+jpg));
		File file2 = new File(req.getServletContext().getRealPath("/Image/rating")+File.separator+rname+"."+jpg);
		
		 String src = req.getSession().getAttribute("SRC").toString()+"\\rating";
		 
		 FileInputStream fis = new FileInputStream(file2);      
		 FileOutputStream fos = new FileOutputStream(src+File.separator+rname+"."+jpg);
		 int data = 0;
		 byte[] buf = new byte[1024];
		 Files.fileIsLive(src+File.separator+rname+"."+jpg);
		 while((data=fis.read(buf))!=-1) {
		     fos.write(buf,0,data);
		     fos.flush();
		 }
		 fis.close();
		 fos.close();
		 
		 
		
		
		
		
		StoreDAO dao = new StoreDAO(req.getServletContext());
		rno = dao.ratingInsert(rno,rname,rtar,rname+"."+jpg);
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
		}
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
		
	}
	

}
