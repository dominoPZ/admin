package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.StoreDAO;

public class Login extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("page", "home");
		req.getRequestDispatcher("/WEB-INF/Index.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreDAO dao = new StoreDAO(req.getServletContext());
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		String hid = req.getParameter("hid");
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		System.out.println(hid);
		System.out.println(id);
		System.out.println(pass);
		int i = dao.login(hid,id,pass,req.getSession());
		String url = "";
		if(i==1) {
			url = "/WEB-INF/Index.jsp";
			System.out.println("???????");
		}
		else if(i==2)
			url="/WEB-INF/Mgr/MgrPage.jsp";
		else{
			pw.println("<script>alert('잘못된 계정입니다.');");
			pw.println("history.back();</script>");
			pw.flush();
			pw.close();
		}
		req.getRequestDispatcher(url).forward(req, resp);
	}
	
	
}
