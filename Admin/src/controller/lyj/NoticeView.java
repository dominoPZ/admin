package controller.lyj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
		String no = req.getParameter("no");
		NoticeDTO notice = dao.selectOneNotice(no);
		req.setAttribute("notice", notice);
		
		req.getRequestDispatcher("/WEB-INF/Admin/notice/NoticeView.jsp").forward(req, resp);
		
	}///// doget
	
}
