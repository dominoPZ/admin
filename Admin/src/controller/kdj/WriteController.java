package controller.kdj;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;


import model.dtr.CommentDao;
import model.dtr.CommentDto;
import model.dtr.DoughDTO;

public class WriteController extends HttpServlet {
		
		//입력 폼으로 이동
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setAttribute("page", "menu");
			CommentDao dao = new CommentDao(req.getServletContext());
			List<DoughDTO> list = dao.getDough();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/WEB-INF/Admin/write.jsp").forward(req,resp);
		}//doGet()
	
		//입력처리
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setAttribute("page", "menu");
			//한글 처리
			req.setCharacterEncoding("UTF-8");
			
			//파일 업로드 관련 모델 호출
			MultipartRequest mr=model.dtr.FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
			int sucorfail;
			
			for(String st : mr.getParameterValues("dough_name")){
				
			}
			String p_no = mr != null ? req.getParameter("p_no") : "";
			String p_name = mr != null ? req.getParameter("p_name") : "";
			String p_kind = mr != null ? req.getParameter("p_kind") : "";
			String p_topping = mr != null ? req.getParameter("p_topping") : "";
			String p_sprice = mr != null ? req.getParameter("p_sprice") : "";
			String p_lprice = mr != null ? req.getParameter("p_lprice") : "";
			String p_origin = mr != null ? req.getParameter("p_origin") : "";
			String p_img = mr != null ? req.getParameter("p_img") : "";
			String p_himg = mr != null ? req.getParameter("p_himg") : "";
			String p_dimg = mr != null ? req.getParameter("p_dimg") : "";
			String p_detail = mr != null ? req.getParameter("p_detail") : "";
			String [] dough_name = (String[]) (mr != null ? req.getParameterValues("dough_name") :"");
			if(mr !=null){//파일 업로드 성공시 DB 입력처리]
				
				 //기타 파라미터 받아서 테이블에 입력처리]
				 p_no = mr.getParameter("p_no");
				 p_name = mr.getParameter("p_name");
				 p_kind = mr.getParameter("p_kind");
				 p_topping = mr.getParameter("p_topping");
				 p_sprice = mr.getParameter("p_sprice");
				 p_lprice = mr.getParameter("p_lprice");
				 p_origin = mr.getParameter("p_origin");
				 p_img = mr.getFilesystemName("p_img");
				 p_himg = mr.getFilesystemName("p_himg");
				 p_dimg = mr.getFilesystemName("p_dimg");
				 p_detail = mr.getParameter("p_detail");
				 dough_name = mr.getParameterValues("dough_name");
				 
				 File file = new File(req.getServletContext().getRealPath("/Upload")+File.separator+p_img);
				 String jpg = file.getName().substring(file.getName().length()-3,file.getName().length());
				 file.renameTo( new File(req.getServletContext().getRealPath("/Upload")+File.separator+p_name+"."+jpg));
				 File file2 =  new File(req.getServletContext().getRealPath("/Upload")+File.separator+p_name+"."+jpg);
				 
				 File dfile = new File(req.getServletContext().getRealPath("/Upload")+File.separator+p_dimg);
				 String djpg = file.getName().substring(file.getName().length()-3,file.getName().length());
				 file.renameTo( new File(req.getServletContext().getRealPath("/Upload")+File.separator+p_name+"."+djpg));
				 File dfile2 =  new File(req.getServletContext().getRealPath("/Upload")+File.separator+p_name+"."+djpg);
				 System.out.println(req.getServletContext().getRealPath("/Upload"));
				 new File(new File(req.getServletContext().getRealPath("/Upload")).getParent()).getParent();
				 
				 
				 
				//데이타베이스 CRUD작업과 관련된 모델 호출]
				CommentDao dao = new CommentDao(req.getServletContext());
				CommentDto dto = new CommentDto();
				dto.setP_no(p_no);
				dto.setP_name(p_name);
				dto.setP_kind(p_kind);
				dto.setP_topping(p_topping);
				dto.setP_sprice(p_sprice);
				dto.setP_lprice(p_lprice);
				dto.setP_origin(p_origin);
				dto.setP_img(file2.getName());
				dto.setP_himg(p_himg);
				dto.setP_dimg(dfile2.getName());
				dto.setP_detail(p_detail);
				dto.setDough_name(dough_name);
				sucorfail=dao.insert(dto);
				
			}
			else sucorfail = -1;
			
			
			//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
			//5-1]DB입력 성공 여부 및 파일용량 초과 판단용 속성 저장
			req.setAttribute("SUC_FAIL", sucorfail);
			//5-2]컨트롤러 구분용-입력:INS,수정:EDT,삭제:DEL
			req.setAttribute("WHERE", "INS");
			
			if(sucorfail ==1){//입력 성공
				//※입력후 바로 목록으로 이동]-반드시 List.jsp가 아닌 List.do로
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>");
				out.println("alert('정상적으로 입력 되었습니다')");
				out.println("</script>");
				req.getRequestDispatcher("/WEB-INF/Admin/Menu.jsp").forward(req, resp);
			}
			
		}
		
}

