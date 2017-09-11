package controller.kdj;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.dtr.SideMenuDao;
import model.dtr.SideMenuDto;
import model.dtr.ToppingDao;
import model.dtr.ToppingDto;

public class SideMenuInsert extends HttpServlet	 {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/Admin/SideMenuWrite.jsp").forward(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//한글 처리
		req.setCharacterEncoding("UTF-8");
		req.setAttribute("page", "menu");
		//파일 업로드 관련 모델 호출
		MultipartRequest mr=model.dtr.FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
		int sucorfail;
		System.out.println(req.getServletContext().getRealPath("/Upload"));
		
		String s_name = mr != null ? req.getParameter("s_name") : "";
		String s_price = mr != null ? req.getParameter("s_price") : "";
		String s_img = mr != null ? req.getParameter("s_img") : "";
		String s_origin = mr != null ? req.getParameter("s_origin") : "";
		String s_detail = mr != null ? req.getParameter("s_detail") : "";
		
		
		
		
		if(mr !=null){//파일 업로드 성공시 DB 입력처리]
			
			 //기타 파라미터 받아서 테이블에 입력처리]
			req.setAttribute("page", "menu");
			s_name = mr.getParameter("s_name");
			s_price = mr.getParameter("s_price");
			s_img = mr.getFilesystemName("s_img");
			s_origin = mr.getParameter("s_origin");
			s_detail = mr.getParameter("s_detail");
			
			 
			 File file = new File(req.getServletContext().getRealPath("/Upload")+File.separator+s_img);
			 System.out.println(file.getName());
			 String jpg = file.getName().substring(file.getName().length()-3,file.getName().length());
			 System.out.println(file.getName()+"@!"+jpg);
			 file.renameTo( new File(req.getServletContext().getRealPath("/Upload")+File.separator+s_name+"."+jpg));
			 
			 
			//데이타베이스 CRUD작업과 관련된 모델 호출]
			SideMenuDao dao = new SideMenuDao(req.getServletContext());
			SideMenuDto dto = new SideMenuDto();
			dto.setS_name(s_name);
			dto.setS_price(s_price);
			dto.setS_img(s_name+"."+jpg);			
			dto.setS_origin(s_origin);
			dto.setS_detail(s_detail);
			sucorfail=dao.insert(dto);
		
			req.setAttribute("page", "menu");
			req.setAttribute("SUC_FAIL", sucorfail);
			req.setAttribute("WHERE", "SINS");
			req.setAttribute("mes", "/SideMenu.do");
	}
		
		

	req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req,resp);
		
	}
}