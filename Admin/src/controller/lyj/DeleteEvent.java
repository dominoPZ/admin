package controller.lyj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteEvent extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		req.setAttribute("page", "event");
		EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
		EventDTO dto = dao.selectOneEvent(no);
		String originaltimg = dto.getE_timg();
		String originalcimg = dto.getE_cimg();
		int sucorfail = dao.deleteEvent(no);
		if(sucorfail == 1) {
			FileUtils.deleteFile(req, req.getServletContext().getRealPath("/EventImage"), originaltimg);
		}
		if(sucorfail == 1) {
			FileUtils.deleteFile(req, req.getServletContext().getRealPath("/EventImage"), originalcimg);
		}
		dao.close();
		
		req.getRequestDispatcher("/Eventlist.do").forward(req, resp);
	}
	
}
