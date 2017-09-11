package controller.lyj;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
		String no = req.getParameter("no");
		EventDTO event = dao.selectOneEvent(no);
		req.setAttribute("event", event);
		
		req.getRequestDispatcher("/WEB-INF/Admin/notice/EventView.jsp").forward(req, resp);
		
	}///// doget
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		
		EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
		String no = req.getParameter("no");
		EventDTO event = dao.selectOneEvent(no);
		req.setAttribute("event", event);
		
		req.getRequestDispatcher("/WEB-INF/Admin/notice/EventView.jsp").forward(req, resp);
	}
	

}
