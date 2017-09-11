package controller.lyj;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class EditEvent extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		req.getRequestDispatcher("/WEB-INF/Admin/notice/EditEvent.jsp").forward(req, resp);
		
		
	}///// doget
	
	// 이벤트 수정
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setAttribute("page", "member");
		if(req.getMethod().toUpperCase().equals("GET")) {
			String no = req.getParameter("no");
			EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
			EventDTO editevent = dao.selectOneEvent(no);
					// dao.updateEvent();
			dao.close();
			req.setAttribute("editevent", editevent);
			req.getRequestDispatcher("/WEB-INF/Admin/notice/EditEvent.jsp").forward(req, resp);
			
		}
		else {
			req.setCharacterEncoding("UTF-8");
			MultipartRequest mr = FileUtils.upload(req,req.getServletContext().getRealPath("/EventImage"));
			
			int sucorfail;
			
			String e_title = null;
			String sdate = null;
			String edate = null;
			String e_timg = null;
			String e_cimg = null;
			if(mr != null) {
				e_title = mr.getParameter("title");
				sdate = mr.getParameter("sdate");
				edate = mr.getParameter("edate");
				e_timg = mr.getFilesystemName("timg");
				e_cimg = mr.getFilesystemName("cimg");
				Date e_sdate = Date.valueOf(sdate);
				Date e_edate = Date.valueOf(edate);
				
				if(e_timg == null) {
					e_timg = mr.getParameter("originaltimg");
				}
				if(e_cimg == null) {
					e_cimg = mr.getParameter("originalcimg");
				}
				
				EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
				EventDTO dto = new EventDTO();
				dto.setE_no(mr.getParameter("no"));
				dto.setE_title(e_title);
				dto.setE_sdate(e_sdate);
				dto.setE_edate(e_edate);
				dto.setE_timg(e_timg);
				dto.setE_cimg(e_cimg);
				sucorfail = dao.updateEvent(dto);
				
				if(sucorfail == 1 && mr.getFilesystemName("e_timg") != null ) {
					FileUtils.deleteFile(req, "E:\\LYJ\\JAVA\\WorkSpace\\Admin\\WebContent\\EventImage", "timg");
				}
				if(sucorfail == 1 && mr.getFilesystemName("e_cimg") != null) {
					FileUtils.deleteFile(req, "E:\\LYJ\\JAVA\\WorkSpace\\Admin\\WebContent\\EventImage", "cimg");
				}
				//sucorfail == 1 && 
				dao.close();
				}
			else sucorfail = -1;
			
			req.getRequestDispatcher("/Eventlist.do").forward(req, resp);
		}
	}//////////////editevent

	
}///////////EditEvent
