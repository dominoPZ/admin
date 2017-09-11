package controller.lyj;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class EditNotice extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		req.getRequestDispatcher("/WEB-INF/Admin/notice/EditNotice.jsp").forward(req, resp);
		
	}///// doget
	
	
	
	// 이벤트 수정
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		if(req.getMethod().toUpperCase().equals("GET")) {
			String no = req.getParameter("no");
			req.setAttribute("page", "member");
			EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
			NoticeDTO editnotice = dao.selectOneNotice(no);
					// dao.updateEvent();
			dao.close();
			req.setAttribute("editnotice", editnotice);
			req.getRequestDispatcher("/WEB-INF/Admin/notice/EditNotice.jsp").forward(req, resp);
			
		}
		else {
			req.setCharacterEncoding("UTF-8");
			MultipartRequest mr = FileUtils.upload(req, req.getServletContext().getRealPath("/NoticeImage"));
			
			int sucorfail;
			
			String n_title = null;
			String n_img = null;
			String n_content = null;
			if(mr != null) {
				n_title = mr.getParameter("title");
				n_img = mr.getFilesystemName("img");
				n_content = mr.getParameter("content");

				if(n_img == null) {
					n_img = mr.getParameter("originalimg");
				}

				EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
				NoticeDTO dto = new NoticeDTO();
				dto.setN_no(mr.getParameter("no"));
				dto.setN_title(n_title);
				dto.setN_img(n_img);
				dto.setN_content(n_content);
				sucorfail = dao.updateNotice(dto);
				
				if(sucorfail == 1 && mr.getFilesystemName("n_img") != null ) {
					FileUtils.deleteFile(req, "E:\\LYJ\\JAVA\\WorkSpace\\Admin\\WebContent\\NoticeImage", mr.getParameter("originalimg"));
				}
				//sucorfail == 1 && 
				dao.close();
				}
			else sucorfail = -1;
			
			req.getRequestDispatcher("/Noticelist.do").forward(req, resp);
		}
	}//////////////editevent

	
}///////////EditEvent
