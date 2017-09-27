package controller.cmn;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import controller.Files;
import controller.dao.PickleSauceDAO;
import controller.dto.PickleSauceDTO;

public class PickleSauceWriteController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "menu");
		req.setCharacterEncoding("UTF-8");
		int sucorfail;
		//파일 업로드 관련 모델 호출
		MultipartRequest mr=model.dtr.FileUtils.upload(req,req.getServletContext().getRealPath("/Image/sidedish/pickleNSouce"));
		String d_name = mr != null ? req.getParameter("d_name") : "";
		String d_price = mr != null ? req.getParameter("d_price") : "";
		String d_img = mr != null ? req.getParameter("d_img") : "";
		String d_kind = mr != null ? req.getParameter("d_kind") : "";
		if(mr !=null){//파일 업로드 성공시 DB 입력처리]
			 //기타 파라미터 받아서 테이블에 입력처리]
			 d_name = mr.getParameter("d_name");
			 d_price = mr.getParameter("d_price");
			 d_img = mr.getFilesystemName("d_img");
			 d_kind = mr.getParameter("d_kind");
			 File file = new File(req.getServletContext().getRealPath("/Image/sidedish/pickleNSouce")+File.separator+d_img);
			 String jpg = file.getName().substring(file.getName().length()-3,file.getName().length());
			 file.renameTo( new File(req.getServletContext().getRealPath("/Image/sidedish/pickleNSouce")+File.separator+d_name+"."+jpg));
			 File file2 = new File(req.getServletContext().getRealPath("/Image/sidedish/pickleNSouce")+File.separator+d_name+"."+jpg);			 
			 String src = req.getSession().getAttribute("SRC").toString()+"\\sidedish\\pickleNSouce";
			 FileInputStream fis = new FileInputStream(file2);      
			 FileOutputStream fos = new FileOutputStream(src+File.separator+d_name+"."+jpg);
			 int data = 0;
			 byte[] buf = new byte[1024];
			 Files.fileIsLive(src+File.separator+d_name+"."+jpg);
			 while((data=fis.read(buf))!=-1) {
			     fos.write(buf,0,data);
			     fos.flush();
			 }
			 fis.close();
			 fos.close();
			//데이타베이스 CRUD작업과 관련된 모델 호출]
			PickleSauceDAO dao = new PickleSauceDAO(req.getServletContext());
			PickleSauceDTO dto = new PickleSauceDTO();
			dto.setD_name(d_name);
			dto.setD_img(d_name+"."+jpg);
			dto.setD_price(d_price);
			dto.setD_kind(d_kind);
			sucorfail=dao.insert(dto);
			req.setAttribute("page", "menu");
			req.setAttribute("SUC_FAIL", sucorfail);
			req.setAttribute("WHERE", "PICKLESAUCEWRITE");
			dao.close();
	}		
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req,resp);
	}
}
