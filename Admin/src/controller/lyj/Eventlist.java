package controller.lyj;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Eventlist extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		
		EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
		int end = dao.getTotalRecordEvent();
		List eventlist = dao.selectListEvent(0, end);
		req.setAttribute("eventlist", eventlist);
		dao.close();
		req.getRequestDispatcher("/WEB-INF/Admin/notice/Eventlist.jsp").forward(req, resp);
		
	}///// doget
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		
		EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
		int end = dao.getTotalRecordEvent();
		List eventlist = dao.selectListEvent(0, end);
		req.setAttribute("eventlist", eventlist);
		dao.close();
		req.getRequestDispatcher("/WEB-INF/Admin/notice/Eventlist.jsp").forward(req, resp);

		
	}

}
