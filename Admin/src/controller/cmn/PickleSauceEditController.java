package controller.cmn;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import controller.dao.PickleSauceDAO;
import controller.dto.PickleSauceDTO;



public class PickleSauceEditController extends HttpServlet {
	
	//수정 처리용]
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MultipartRequest mr= model.dtr.FileUtils.upload(req, req.getServletContext().getRealPath("/Image/sidedish/pickleNSouce"));
		//수정성공시 : 1, 실패 : 0, 용량 초과 : -1
		int sucorfail=0;
		if(mr != null){
			String no = mr.getParameter("edit_no");
			String name = mr.getParameter("d_name").replaceAll(" ", "");
			String price = mr.getParameter("d_price");
			String img = mr.getFilesystemName("d_img");
			
			File file = new File(req.getServletContext().getRealPath("/Image/sidedish/pickleNSouce")+File.separator+img);
			String jpg = file.getName().substring(file.getName().length()-3,file.getName().length());
			
			//파일 미교체
			if(img == null) img = mr.getParameter("original_img");
			//데이터 베이스 CRUD작업과 관련된 모델 호출]
			PickleSauceDAO dao = new PickleSauceDAO(req.getServletContext());
			PickleSauceDTO dto = new PickleSauceDTO();
			dto.setD_name(name);
			dto.setDr_no(no);
			dto.setD_price(price);
			dto.setD_img(name+"."+jpg);
			dao.update(dto);
			//dto.setAttachedfile(img);
			sucorfail = dao.update(dto);
			//DB업데이트 성공 및 파일 교체시 기존 업로드 된 파일 삭제
			if(sucorfail == 1 && mr.getFilesystemName("d_img") != null){
				//기존 업로드된 파일 삭제]
				model.dtr.FileUtils.deleteFile(req, "/Image/sidedish/pickleNSouce", mr.getParameter("original_img"));
			}
			dao.close();
			
			file.renameTo(new File(req.getServletContext().getRealPath("/Image/sidedish/pickleNSouce")+File.separator+name.replaceAll(" ", "")+"."+jpg));
			File file2 = new File(req.getServletContext().getRealPath("/Image/sidedish/pickleNSouce")+File.separator+name.replaceAll(" ", "")+"."+jpg);
			
			
		}
		else sucorfail = -1;
		req.setAttribute("SUC_FAIL", sucorfail);
		req.setAttribute("WHERE", "PICKLESAUCEEDIT");
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
	}
	
	//삭제 처리용]
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sucorfail = 0;
		if(req.getParameter("delete").equals("DEL")) {
			//System.out.println(req.getParameter("no"));
			PickleSauceDTO dto = new PickleSauceDTO();
			dto.setDr_no(req.getParameter("no"));
			dto.setD_kind(req.getParameter("kind"));
			System.out.println(dto.getDr_no()+" / "+dto.getD_kind());
			PickleSauceDAO dao = new PickleSauceDAO(req.getServletContext());
			dto = dao.selectOne(dto);
			sucorfail = dao.delete(dto);
			if(sucorfail == 1){//삭제 성공
				//레코드 삭제 성공시 업로드된 파일 삭제
				model.dtr.FileUtils.deleteFile(req, "/Image/sidedish/pickleNSouce", dto.getD_img());
			}
			dao.close();
		}
		req.setAttribute("SUC_FAIL", sucorfail);
		req.setAttribute("WHERE", "PICKLESAUCEDEL");
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req, resp);
	}
	
}
