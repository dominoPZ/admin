package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.StoreDAO;
import controller.dto.PizzaMenuListDTO;

public class PizzaList extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		int ty=0;
		StoreDAO dao = new StoreDAO(req.getServletContext());
		if(req.getParameter("ty")!=null) {
			req.setAttribute("code", req.getParameter("ty"));
		ty = Integer.parseInt(req.getParameter("ty"));
		System.out.println(ty);
		}
		System.out.println(ty);
		String sel="";
		String fro = "";
		String whe = "";
		req.setAttribute("pages", ty);
		
			sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P.P_NO,'0' ";
			fro = "  pizza p ";
			whe = " 1=1 AND P_KIND!='하프앤하프' AND P_KIND!='마이키친' ";
		
		Map map = new HashMap();
		String a = "1";
		map.put("P_LIST", "1");
		map.put("sel", sel);
		map.put("whe", whe);
		map.put("fro", fro);
		map.put("ty",ty);
		System.out.println("dao 전");
		
		if(ty!=104) {
		List<PizzaMenuListDTO> list = dao.menuList(map);
		for(PizzaMenuListDTO pl : list) {
			if(pl.getD_price()!=null) {
			pl.setP_lprice((Integer.parseInt(pl.getP_lprice())+Integer.parseInt(pl.getD_price()))+"");
			pl.setP_sprice((Integer.parseInt(pl.getP_sprice())+Integer.parseInt(pl.getD_price()))+"");
			}
		}
			req.setAttribute("dto",list);
		}
		else {
			//List<SideMenuList> list = service.menuList(map);
			//model.addAttribute("dto",list);
		}
			dao.close();
			req.getRequestDispatcher("/WEB-INF/Admin/Menu.jsp").forward(req, resp);
		
		
		
		
	}
	

}
