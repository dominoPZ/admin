package controller.lyj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteNotice extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		req.setAttribute("page", "event");
		EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
		NoticeDTO dto = dao.selectOneNotice(no);
		String originalimg = dto.getN_img();

		int sucorfail = dao.deleteNotice(no);
		if(sucorfail == 1) {
			FileUtils.deleteFile(req, req.getServletContext().getRealPath("/NoticeImage"), originalimg);
		}

		dao.close();
		
		req.getRequestDispatcher("/Noticelist.do").forward(req, resp);
	}
	
}
