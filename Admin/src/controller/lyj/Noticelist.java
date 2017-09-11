package controller.lyj;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Noticelist extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
		int end = dao.getTotalRecordNotice();
		List noticelist = dao.selectListNotice(0, end);
		req.setAttribute("noticelist", noticelist);
		req.getRequestDispatcher("/WEB-INF/Admin/notice/Noticelist.jsp").forward(req, resp);
		
	}///// doget
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		
		EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
		int end = dao.getTotalRecordNotice();
		List<NoticeDTO>	noticelist = dao.selectListNotice(0, end);
		req.setAttribute("noticelist", noticelist);
		System.out.println(noticelist.get(1).getN_type());
		req.getRequestDispatcher("/WEB-INF/Admin/notice/Noticelist.jsp").forward(req, resp);
		
	}///// doget
	

}
