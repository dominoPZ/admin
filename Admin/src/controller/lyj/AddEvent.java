package controller.lyj;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AddEvent extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "event");
		req.getRequestDispatcher("/WEB-INF/Admin/notice/AddEvent.jsp").forward(req, resp);
		
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
		MultipartRequest mr = upload(req, req.getServletContext().getRealPath("/EventImage"));
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
			System.out.println(sdate);
			Date e_sdate = Date.valueOf(sdate);
			Date e_edate = Date.valueOf(edate);
			
			EventnNoticeDAO dao = new EventnNoticeDAO(req.getServletContext());
			EventDTO dto = new EventDTO();
			dto.setE_title(e_title);
			dto.setE_sdate(e_sdate);
			dto.setE_edate(e_edate);
			dto.setE_timg(e_timg);
			dto.setE_cimg(e_cimg);
			sucorfail = dao.insertEvent(dto);
			
			File tfile = new File(req.getServletContext().getRealPath("/EventImage")+File.separator+e_timg);
			File cfile = new File(req.getServletContext().getRealPath("/EventImage")+File.separator+e_cimg);
			FileInputStream fis =null;
			FileOutputStream fos=null;
			fis = new FileInputStream(tfile);
			fos = new FileOutputStream("C:/Users/kosmo_22/Desktop/자바들/"+e_timg);
			int data;
			
			byte[] b = new byte[128];
			while((data= fis.read(b))!=-1){
				//파일로 출력]
				//write(배열명,0,읽은 바이트 수)
				//즉 읽은 바이트 수만큼 출력]
				fos.write(b,0,data);
				fos.flush();
			}
		
			
		}
		else {
			sucorfail = -1;
		}
		if(sucorfail == 1) {
			req.getRequestDispatcher("/Eventlist.do").forward(req, resp);
		}
		
	}//////////////doPost

}
