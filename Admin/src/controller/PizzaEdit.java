package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.FileChannel;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import controller.dao.StoreDAO;
import controller.dto.P_nutrientDTO;
import controller.dto.PizzaMenuListDTO;
import model.dtr.CommentDao;
import model.dtr.CommentDto;
import model.dtr.DoughDTO;

public class PizzaEdit extends HttpServlet {
		//입력 폼으로 이동
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setAttribute("page", "menu");
			String no = req.getParameter("p_no");
			CommentDao dao = new CommentDao(req.getServletContext());
			StoreDAO daos = new StoreDAO(req.getServletContext());
			
			PizzaMenuListDTO dto = daos.pizzaView(no);
			List<DoughDTO> list = dao.getDough();
			req.setAttribute("list", list);
			dto.setP_no(no);
			req.setAttribute("dtos", dto);
			dao.getClass();
			req.getRequestDispatcher("/WEB-INF/Admin/PizzaEdit.jsp").forward(req,resp);
			
		}//doGet()
	
		//입력처리
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setAttribute("page", "menu");
			//한글 처리
			req.setCharacterEncoding("UTF-8");
			String src = req.getSession().getAttribute("SRC").toString()+"\\pizzalist";
			//파일 업로드 관련 모델 호출
			MultipartRequest mr=model.dtr.FileUtils.upload(req,req.getServletContext().getRealPath("/Image"));
			List<Map> sucorfail;
			
			
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
				 
				 FileInputStream fis = null;
				 FileOutputStream fos = null;
				 File file;
				 File file2=null;
				 int data = 0;
				 byte[] buf = new byte[1024];
				 
				 if(p_img!=null) {
				 file = new File(req.getServletContext().getRealPath("/Image")+File.separator+p_img);
				 String jpg = file.getName().substring(file.getName().length()-3,file.getName().length());
				 file.renameTo( new File(req.getServletContext().getRealPath("/Image")+File.separator+p_name+"."+jpg));
				 file2 =  new File(req.getServletContext().getRealPath("/Image")+File.separator+p_name+"."+jpg);
				 

				 fis = new FileInputStream(file2);      
				 fos = new FileOutputStream(src+File.separator+p_name+"."+jpg);
				 data = 0;
				 buf = new byte[1024];
				 fileIsLive(src+File.separator+p_name+"."+jpg);
				 while((data=fis.read(buf))!=-1) {
				     fos.write(buf,0,data);
				     fos.flush();
				 }
				 
				 fis.close();
				 fos.close();
				 }
				 
				 File dfile2=null;
				 if(p_dimg!=null) {
				 File dfile = new File(req.getServletContext().getRealPath("/Image")+File.separator+p_dimg);
				 String djpg = dfile.getName().substring(dfile.getName().length()-3,dfile.getName().length());
				 dfile.renameTo( new File(req.getServletContext().getRealPath("/Image")+File.separator+p_name+"D."+djpg));
				 dfile2 =  new File(req.getServletContext().getRealPath("/Image")+File.separator+p_name+"D."+djpg);
				 fis = new FileInputStream(dfile2);
				 fos = new FileOutputStream(src+File.separator+p_name+"D."+djpg);
				 fileIsLive(src+File.separator+p_name+"D."+djpg);
				 data = 0;
				 buf = new byte[1024];
				 while((data=fis.read(buf))!=-1) {
				     fos.write(buf,0,data);
				     fos.flush();
				 }
				 fis.close();
				 fos.close();
				 }
				 
				 
				 File hfile2=null;
				 if(p_himg!=null) {
				 File hfile = new File(req.getServletContext().getRealPath("/Image")+File.separator+p_himg);
				 String hjpg = hfile.getName().substring(hfile.getName().length()-3,hfile.getName().length());
				 hfile.renameTo( new File(req.getServletContext().getRealPath("/Image")+File.separator+p_name+"H."+hjpg));
				 hfile2 =  new File(req.getServletContext().getRealPath("/Image")+File.separator+p_name+"H."+hjpg);
				 fis = new FileInputStream(hfile2);
				 fos = new FileOutputStream(src+File.separator+p_name+"H."+hjpg);
				 fileIsLive(src+File.separator+p_name+"H."+hjpg);
				 data = 0;
				 buf=  new byte[1024];
				 while((data=fis.read(buf))!=-1) {
				     fos.write(buf,0,data);
				     fos.flush();
				 }
				 fis.close();
				 fos.close();

				 
				 
				 }
				 
				 
				 //File tfile = new File(src+File.separator+p_name+"."+jpg);
				 
				 
				 System.out.println(req.getServletContext().getRealPath("/Image"));
				 
				 
				 
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
				dto.setP_img(file2==null?mr.getParameter("fileOrgName"):file2.getName());
				dto.setP_himg(dfile2==null?mr.getParameter("hfileOrgName"):hfile2.getName());
				dto.setP_dimg(hfile2==null?mr.getParameter("dfileOrgName"):dfile2.getName());
				dto.setP_detail(p_detail);
				dto.setDough_name(dough_name);
				sucorfail=dao.edit(dto);
				System.out.println(dto.getP_img()+"!파일이름");
				
				List<P_nutrientDTO> pnlist= new Vector<>();
				String tsize="";
				
				for(Map map:sucorfail) {
					for(int i=0;i<2;i++) {
					if(i==0) {
						tsize="L";	
					}
					else tsize="M";
					P_nutrientDTO pndto = new P_nutrientDTO();
					System.out.println(mr.getParameter("n_gram"+tsize+map.get("dough_no"))+"!!!!");
					pndto.setN_gram(mr.getParameter("n_gram"+tsize+map.get("dough_no")));
					pndto.setN_kcal(mr.getParameter("n_kcal"+tsize+map.get("dough_no")));
					pndto.setN_natrium(mr.getParameter("n_natrium"+tsize+map.get("dough_no")));
					pndto.setN_protein(mr.getParameter("n_protein"+tsize+map.get("dough_no")));
					pndto.setN_sfat(mr.getParameter("n_sfat"+tsize+map.get("dough_no")));
					pndto.setN_size(mr.getParameter("n_size"+tsize+map.get("dough_no")));
					pndto.setN_stan(mr.getParameter("n_stan"+tsize+map.get("dough_no")));
					pndto.setN_stangram(mr.getParameter("n_stangram"+tsize+map.get("dough_no")));
					pndto.setN_sugar(mr.getParameter("n_sugar"+tsize+map.get("dough_no")));
					pndto.setN_size(tsize);
					pndto.setD_no(map.get("d_no").toString());
					dao.pnutrientIn(pndto);
					
					}
				}
				
				
				
			}
			else sucorfail = null;
			
			
			//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
			//5-1]DB입력 성공 여부 및 파일용량 초과 판단용 속성 저장
			req.setAttribute("SUC_FAIL", -1);
			//5-2]컨트롤러 구분용-입력:INS,수정:EDT,삭제:DEL
			req.setAttribute("WHERE", "INS");
			
			if(sucorfail !=null){//입력 성공
				//※입력후 바로 목록으로 이동]-반드시 List.jsp가 아닌 List.do로
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>");
				out.println("alert('정상적으로 입력 되었습니다')");
				out.println("</script>");
				
			}
			req.getRequestDispatcher("/PizzaList.pz").forward(req, resp);
			
		}
		
		
		
		
		 public static void fileIsLive(String isLivefile) {
			  File f1 = new File(isLivefile);
			  
			  if(f1.exists())
			  {
			   f1.delete();
			  }else
			  {
			   
			  }
			 }


		
		
		
		
}

