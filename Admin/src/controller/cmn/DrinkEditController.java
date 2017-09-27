package controller.cmn;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.dtr.DrinkDao;
import model.dtr.DrinkDto;

public class DrinkEditController extends HttpServlet {
	
	//수정 처리용]
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("수정 처리 로직 시작");
		req.setCharacterEncoding("UTF-8");
		MultipartRequest mr= model.dtr.FileUtils.upload(req, req.getServletContext().getRealPath("/Image/sidedish/beverage"));
		//수정성공시 : 1, 실패 : 0, 용량 초과 : -1
		int sucorfail=0;
		if(mr != null){
			String no = mr.getParameter("edit_no");
			String name = mr.getParameter("edit_name");
			String price = mr.getParameter("edit_price");
			String img = mr.getFilesystemName("edit_img").replaceAll(" ", "");
			
			File file = new File(req.getServletContext().getRealPath("/Image/sidedish/beverage")+File.separator+img);
			String jpg = file.getName().substring(file.getName().length()-3,file.getName().length());
			file.renameTo(new File(req.getServletContext().getRealPath("/Image/sidedish/beverage")+File.separator+name.replaceAll(" ", "")+"."+jpg));
			
			//파일 미교체
			if(img == null) img = mr.getParameter("original_img");
			//데이터 베이스 CRUD작업과 관련된 모델 호출]
			DrinkDao dao = new DrinkDao(req.getServletContext());
			DrinkDto dto = new DrinkDto();
			dto.setD_name(name);
			dto.setDr_no(no);
			dto.setD_price(price);
			dto.setD_img(name+"."+jpg);
			dao.update(dto);
			
			System.out.println("img:"+img);
			System.out.println("originalfilename:"+mr.getParameter("original_img"));
			
			
			//dto.setAttachedfile(img);
			sucorfail = dao.update(dto);
			
			//DB업데이트 성공 및 파일 교체시 기존 업로드 된 파일 삭제
			if(sucorfail == 1 && mr.getFilesystemName("edit_img") != null){
				//기존 업로드된 파일 삭제]
				model.dtr.FileUtils.deleteFile(req, "/Image/sidedish/beverage", mr.getParameter("original_img"));
			}
			dao.close();
		}
		else sucorfail = -1;
		req.setAttribute("SUC_FAIL", sucorfail);
		req.setAttribute("WHERE", "DRINKEDIT");
		System.out.println("수정 처리 로직 끝");
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
	}
	
	//삭제 처리용]
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sucorfail = 0;
		System.out.println("삭제 처리 로직 시작");
		if(req.getParameter("delete").equals("DEL")) {
			//System.out.println(req.getParameter("no"));
			DrinkDto dto = new DrinkDto();
			DrinkDao dao = new DrinkDao(req.getServletContext());
			dto = dao.selectOne(req.getParameter("no"));
			sucorfail = dao.delete(dto);
			if(sucorfail == 1){//삭제 성공
				//레코드 삭제 성공시 업로드된 파일 삭제
				model.dtr.FileUtils.deleteFile(req, "/Image/sidedish/beverage", dto.getD_img());
			}
			dao.close();
		}
		req.setAttribute("SUC_FAIL", sucorfail);
		req.setAttribute("WHERE", "DRINKDEL");
		System.out.println("삭제 처리 로직 끝");
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
	}
	
}
