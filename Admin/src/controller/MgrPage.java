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

public class MgrPage extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(req.getSession().getAttribute("no"));
		StoreDAO dao = new StoreDAO(req.getServletContext());
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		JSONObject json = new JSONObject();
		List<SalUserDTO> list = new Vector();
		
		list = dao.printsal(req.getSession().getAttribute("Sno").toString());
		List<Map> ls = new Vector<>();
		
		dao.close();
		int sum=0;
		
		for(SalUserDTO dto : list){
			sum=0;
			Map map = new HashMap();
			List list2 = new Vector<>();
			List list3 = new Vector<>();
			map.put("no", dto.getNo());
			map.put("name", dto.getName());
			map.put("addr", dto.getAddr());
			map.put("tel", dto.getTel());
			map.put("pro", dto.getPro());
			SimpleDateFormat simple = new SimpleDateFormat("MM-dd HH:mm:ss");
			String date = dto.getS_date();//simple.format(dto.getS_date());
			
			
			map.put("date",date);
			for(SalDTO dto2 : dto.getSdto()){
				String str ="";
				Map map2 = new HashMap();
				map2.put("pname", dto2.getName());
				String size=dto2.getSize();
				String dname = dto2.getDoughname();
				System.out.println(dname);
				map2.put("size", size==null? "" : dto2.getSize());
				map2.put("qty",dto2.getQty());
				map2.put("price", dto2.getPrice());
				map2.put("dname", dto2.getDoughname()==null? "" : dto2.getDoughname());
				sum += Integer.parseInt(dto2.getPrice());
				
				for(ToppingDTO dto3 : dto2.getTopping()){
					
					str += " | "+dto3.getTname()+":"+dto3.getTsize();
					
				}
				map2.put("topping", str);
				list2.add(map2);
			}
			map.put("menu", list2);
			map.put("sum", sum);
			ls.add(map);
			
		}
		System.out.println(JSONArray.toJSONString(ls));
		pw.write(JSONArray.toJSONString(ls));
		pw.flush();
		pw.close();
		
	}
	

}
