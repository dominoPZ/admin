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

public class StoreSer extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "store");
		StoreDAO dao= new StoreDAO(req.getServletContext());
		List<StoreDTO> dtos = dao.storeser("","");
		dao.close();
		
		req.getRequestDispatcher("/WEB-INF/Admin/Store_Edit.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ser = req.getParameter("ser");
		String sertxt = req.getParameter("st_name");
		req.setAttribute("page", "store");
		
		
		StoreDAO dao= new StoreDAO(req.getServletContext());
		List<StoreDTO> dtos = dao.storeser(ser,sertxt);
		req.setAttribute("dtos", dtos);
		dao.close();
		req.getRequestDispatcher("/WEB-INF/Admin/Store_Edit.jsp").forward(req, resp);
		
	}
	

}
