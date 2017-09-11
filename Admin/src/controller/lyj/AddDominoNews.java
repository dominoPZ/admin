package controller.lyj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AddDominoNews extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		req.getRequestDispatcher("/WEB-INF/Admin/notice/AddDominoNews.jsp").forward(req, resp);
		
	}///// doget
	// 파일 업로드 로직
	public static MultipartRequest upload(HttpServletRequest req, String saveDirectory) {
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(
					(HttpServletRequest) req, 
					saveDirectory, 
					1024*5000000, 
					"UTF-8", 
					new DefaultFileRenamePolicy());
		} catch (Exception e) {e.printStackTrace();}
		return mr;
	}//////////////////////////////upload
	// 입력처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		req.setAttribute("page", "event");
		MultipartRequest mr = upload(req, req.getServletContext().getRealPath("/NoticeImage"));
		int sucorfail;
		
		String n_title = null;
		String n_img = null;
		String n_content = null;
		if(mr != null) {
			n_title = mr.getParameter("title");
			n_img = mr.getFilesystemName("img");
			n_content = mr.getParameter("content");
			
			EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
			NoticeDTO dto = new NoticeDTO();
			dto.setN_title(n_title);
			dto.setN_img(n_img);
			dto.setN_content(n_content);
			dto.setN_type("1");
			sucorfail = dao.insertNotice(dto);
		}
		else {
			sucorfail = -1;
		}
		if(sucorfail == 1) {
			req.getRequestDispatcher("/Noticelist.do").forward(req, resp);
		}
		
	}//////////////doPost
	
		

}
