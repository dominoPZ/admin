package controller;

import java.io.File;
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

public class RatingUpdate extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MultipartRequest mr=model.dtr.FileUtils.upload(req,req.getServletContext().getRealPath("/Image/rating"));
		//한글 처리
		req.setCharacterEncoding("UTF-8");
		String jpg="";
		if(mr!=null) {
			
		String[] coupons = mr.getParameterValues("coupon");
		String rname = mr.getParameter("r_name");
		String rtar = mr.getParameter("r_target");
		String rno = mr.getParameter("rno");
		
		
		
		
		String r_img = mr.getFilesystemName("r_img");				
		if(r_img ==null){//파일 미교체
			r_img=mr.getParameter("org");
		}
		else {
		controller.lyj.FileUtils.deleteFile(req, "/Image/rating",mr.getParameter("org"));
		
		File file = new File(req.getServletContext().getRealPath("/Image/rating")+File.separator+r_img);
		System.out.println(file.getName());
		jpg = file.getName().substring(file.getName().length()-3,file.getName().length());
		System.out.println(file.getName()+"@!"+jpg);
		file.renameTo( new File(req.getServletContext().getRealPath("/Image/rating")+File.separator+rname+"."+jpg));
		}
		StoreDAO dao = new StoreDAO(req.getServletContext());
		int i = 0;
		i = dao.ratingupdate(rno,rname,rtar,rname+"."+jpg);
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
		}
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
		
	}
	

}
