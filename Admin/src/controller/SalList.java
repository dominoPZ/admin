package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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

public class SalList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "SalList");
		String date1=req.getParameter("date1")==null?"":req.getParameter("date1");
		String date2=req.getParameter("date2")==null?"":req.getParameter("date2");
		String col = req.getParameter("col")==null?"":req.getParameter("col");
		String ser = req.getParameter("ser")==null?"":req.getParameter("ser");
		req.setAttribute("date1", date1);
		req.setAttribute("date2", date2);
		
		StoreDAO dao = new StoreDAO(req.getServletContext());
		
		String sano ="";
		if(req.getParameter("pop")!=null)
			sano = req.getParameter("pop");
		List<SalUserDTO> list = dao.sallist(req.getSession().getAttribute("Sno").toString(),sano,date1,date2,col,ser);
		System.out.println("!!"+req.getSession().getAttribute("Sno"));
		List ls = new Vector<>();
		int only = 0;
		for(SalUserDTO dto : list){
			Map map=new HashMap<>();
			int sum = 0;
			String menu ="";
			map.put("addr", dto.getAddr().replace("%&@#*^$@!", "<br/>"));
			map.put("id",dto.getId());
			map.put("name",dto.getName());
			map.put("no",dto.getNo());
			System.out.println(dto.getName());
			map.put("pro",dto.getPro());
			map.put("date",dto.getS_date());
			map.put("tel",dto.getTel());
			List list2 = new Vector<>();
			
			for(SalDTO dto2 : dto.getSdto()){
				Map map2 = new HashMap<>();
				map2.put("kind",dto2.getKind());
				map2.put("menu_no",dto2.getMenu_no());
				map2.put("menu_name",dto2.getName());
				map2.put("price",dto2.getPrice());
				map2.put("qty",dto2.getQty());
				System.out.println(dto2.getMenu_no());
				only += Integer.parseInt(dto2.getPrice());
				
				String size = "";
				size += dto2.getSize();
				size = size.replace("null", "");
				
				map2.put("size",size);
				
				
				
				map2.put("sm_no",dto2.getSm_no());
				map2.put("orgp", dto2.getOrgprice());
				
				
				String dname = "";
				dname += dto2.getDoughname();
				dname = dname.replace("null", "");
				map2.put("dname", dname);
				sum += Integer.parseInt(dto2.getPrice());
				menu += " | "+dto2.getName()+" "+dto2.getDoughname()+" "+dto2.getSize()+" ("+dto2.getQty()+") ";
				menu = menu.replace("null", "");
				List list3 = new Vector<>();
				int index=0;
				int ttopping=0;
				for(ToppingDTO dto3 : dto2.getTopping()){
					index++;
					if(index==1)
						menu +=">토핑:";
					Map map3 = new HashMap<>();
					map3.put("tname",dto3.getTname());
					map3.put("tsize",dto3.getTsize());
					map3.put("tprice", dto3.getTprice());
					list3.add(map3);
					menu += " "+dto3.getTname()+"("+dto3.getTsize()+") ";
					if(index!=dto2.getTopping().size())
						menu+=",";
					ttopping += Integer.parseInt(dto3.getTprice());
				}
				menu+=" - [ "+dto2.getPrice()+"원]<br/>";
				map2.put("topping", list3);
				map2.put("ttprice", ttopping);
				list2.add(map2);
			}
				map.put("sum", sum);
				map.put("menu", menu);
				map.put("sdto", list2);
				ls.add(map);
				req.setAttribute("dtomap", map);
		}////for
		dao.close();
		req.setAttribute("only", only);
		req.setAttribute("menu", ls);
		String urlz="";
		if(req.getParameter("pop")==null)
			urlz="/WEB-INF/Mgr/MgrSalList.jsp";
		else
			urlz="/WEB-INF/Mgr/SalListPop.jsp";
		req.getRequestDispatcher(urlz).forward(req, resp);
		
		
		
	}
	

}
