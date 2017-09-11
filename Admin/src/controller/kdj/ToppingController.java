package controller.kdj;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.dtr.CommentDao;
import model.dtr.CommentDto;
import model.dtr.ToppingDao;
import model.dtr.ToppingDto;

public class ToppingController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/Admin/ToppingWrite.jsp").forward(req,resp);
	} 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "menu");
		
		//한글 처리
		req.setCharacterEncoding("UTF-8");
		
		//파일 업로드 관련 모델 호출
		MultipartRequest mr=model.dtr.FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
		int sucorfail;
		System.out.println(req.getServletContext().getRealPath("/Upload"));
		
		String t_name = mr != null ? req.getParameter("t_name") : "";
		String t_img = mr != null ? req.getParameter("t_img") : "";
		String t_kind = mr != null ? req.getParameter("t_kind") : "";
		String t_size = mr != null ? req.getParameter("t_size") : "";
		String t_price = mr != null ? req.getParameter("t_price") : "";
		String t_gram = mr != null ? req.getParameter("t_gram") : "";
		
		
		if(mr !=null){//파일 업로드 성공시 DB 입력처리]
			
			 //기타 파라미터 받아서 테이블에 입력처리]
			
			 t_name = mr.getParameter("t_name");
			 t_img = mr.getFilesystemName("t_img");
			 t_kind = mr.getParameter("t_kind");
			 t_size = mr.getParameter("t_size");
			 t_price = mr.getParameter("t_price");
			 t_size = mr.getParameter("t_size");
			 t_gram = mr.getParameter("t_gram");
			 
			 File file = new File(req.getServletContext().getRealPath("/Upload")+File.separator+t_img);
			 System.out.println(file.getName());
			 String jpg = file.getName().substring(file.getName().length()-3,file.getName().length());
			 System.out.println(file.getName()+"@!"+jpg);
			 file.renameTo( new File(req.getServletContext().getRealPath("/Upload")+File.separator+t_name+"."+jpg));
			 
			 
			//데이타베이스 CRUD작업과 관련된 모델 호출]
			ToppingDao dao = new ToppingDao(req.getServletContext());
			ToppingDto dto = new ToppingDto();
			dto.setT_name(t_name);
			dto.setT_img(t_name+"."+jpg);
			dto.setT_kind(t_kind);
			dto.setT_size(t_size);
			dto.setT_price(t_price);
			dto.setT_size(t_size);
			dto.setT_gram(t_gram);
			sucorfail=dao.insert(dto);
		
	}
}
}
