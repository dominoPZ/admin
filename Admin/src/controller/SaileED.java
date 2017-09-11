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

public class SaileED extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no,name,con,saile;
		no=req.getParameter("no");
		name=req.getParameter("name");
		con=req.getParameter("con");
		saile=req.getParameter("saile");
		
		StoreDAO dao = new StoreDAO(req.getServletContext());
		System.out.println(req.getParameter("del"));
		int i = 0;
		if(req.getParameter("del")==null) {
			i = dao.saileedit(no,name,saile,con);
			req.setAttribute("page", "rating");
			req.setAttribute("SUC_FAIL", i);
			req.setAttribute("WHERE", "CEDT");
		}
		else {
		i = dao.sailedelete(no);
		req.setAttribute("page", "rating");
		req.setAttribute("SUC_FAIL", i);
		req.setAttribute("WHERE", "CDEL");
		}
		dao.close();
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
	}
	

}
