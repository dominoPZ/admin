package controller.kdj;

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
import model.dtr.DrinkDao;
import model.dtr.DrinkDto;
import model.dtr.ToppingDao;
import model.dtr.ToppingDto;

public class DrinkInsert extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "menu");
		req.getRequestDispatcher("/WEB-INF/Admin/DrinkWrite.jsp").forward(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "menu");
		req.setCharacterEncoding("UTF-8");
		int sucorfail;
		
		//파일 업로드 관련 모델 호출
		MultipartRequest mr=model.dtr.FileUtils.upload(req,req.getServletContext().getRealPath("/Image"));
				System.out.println(req.getServletContext().getRealPath("/Image"));
		
		
		
		String d_name = mr != null ? req.getParameter("d_name") : "";
		String d_price = mr != null ? req.getParameter("d_price") : "";
		String d_img = mr != null ? req.getParameter("d_img") : "";
		
		
		
		if(mr !=null){//파일 업로드 성공시 DB 입력처리]
			
			 //기타 파라미터 받아서 테이블에 입력처리]
			
			 d_name = mr.getParameter("d_name");
			 d_price = mr.getParameter("d_price");
			 d_img = mr.getFilesystemName("d_img");
			 
			 
			 File file = new File(req.getServletContext().getRealPath("/Image")+File.separator+d_img);
			 System.out.println(file.getName());
			 String jpg = file.getName().substring(file.getName().length()-3,file.getName().length());
			 System.out.println(file.getName()+"@!"+jpg);
			 file.renameTo( new File(req.getServletContext().getRealPath("/Image")+File.separator+d_name+"."+jpg));
			 File file2 = new File(req.getServletContext().getRealPath("/Image")+File.separator+d_name+"."+jpg);
			 
			 String src = req.getSession().getAttribute("SRC").toString()+"\\sidedish\\beverage";
			 
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
			DrinkDao dao = new DrinkDao(req.getServletContext());
			DrinkDto dto = new DrinkDto();
			
			dto.setD_name(d_name);
			dto.setD_img(d_name+"."+jpg);
			dto.setD_price(d_price);
			sucorfail=dao.insert(dto);
			
			req.setAttribute("page", "menu");
			req.setAttribute("SUC_FAIL", sucorfail);
			req.setAttribute("WHERE", "MINS");
			dao.close(); //추가 -미나
	}		
		
		req.getRequestDispatcher("/WEB-INF/Admin/Message.jsp").forward(req,resp);
		
	}
}
