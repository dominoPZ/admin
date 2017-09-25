package controller.cmn;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.dtr.DrinkDao;
import model.dtr.DrinkDto;

public class DrinkEditController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		//수정처리-POST방식
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		//3]요청분석 - 수정처리 요청
		//4]모델호출 및 결과값 받기
		//파일 업로드와 관련된 모델(비즈니스 로직)호출
		MultipartRequest mr= model.dtr.FileUtils.upload(req, req.getServletContext().getRealPath("/Image"));
		//파라미터로 전달된 리퀘스트의 값을 MultipartRequest가 가로챔.
		//그래서 MultipartRequest로 얻어옴.
		
		//수정성공시 : 1, 실패 : 0, 용량 초과 : -1
		int sucorfail=0;
		if(mr != null){ //500KB 이하 이면
			//기타 파라미터 받아서 테이블에 수정처리
			String no = mr.getParameter("no");
			//파라미터 받아서 테이블에 수정 처리]
			//★MultipartRequest가 중간에서 파라미터를 가로채기 때문에 포워드로 파라미터 전달이 안됨.
			//파라미터로 전달된 값들을 MultipartRequest가 가로채서
			//상세보기로 이동하기 위해 영역에 키값 저장]
			//req.setAttribute("no", no);
			String name = mr.getParameter("name");
			String price = mr.getParameter("price");
			String attachedfile = mr.getFilesystemName("attachedfile");
			//input타입 file에 아무것도 변경하지 않으면(사용자가 파일을 변경하지 않으면)
			//attachedfile을 교체하지 않으면 attachedfile이 null이 나옴.
			//input타입이 file일 경우 getParameter로 받으면 무조건 null나옴.
			//getParameter는 type속성이 file이 아닌 다른 폼의 요소를 얻어올 때 사용해야함.
			/*
			 * ※파일용량 초과시 에러 즉 MultipartRequest객체가 생성이 안됨.
                      단, 파일 미 첨부시에는 MultipartRequest객체 생성되나
		  		MultipartRequest의 getFilesystemName("파라미터명")로
		  		값을 읽어올때 null임.
			 */
			//따라서 attachedfile이 null아니면 파일을 교체했다는 의미
			if(attachedfile == null){//파일 미교체
				attachedfile = mr.getParameter("img");
				//input타입이 hidden이기 때문에 getParameter로 얻어옴.
				//파일을 교체하지 않으면 원래 파일명으로 바꿈.
			}
			
			//데이터 베이스 CRUD작업과 관련된 모델 호출]
			
			DrinkDao dao = new DrinkDao(req.getServletContext());
			DrinkDto dto = new DrinkDto();
			dto.setD_name(name);
			dto.setDr_no(no);
			dto.setD_price(price);
			dto.setD_img("img");
			dao.close();
			
			
			dto.setAttachedfile(attachedfile);
			sucorfail = dao.update(dto);
			
			//DB업데이트 성공 및 파일 교체시 기존 업로드 된 파일 삭제
			if(sucorfail == 1 && mr.getFilesystemName("attachedfile") != null){
				//기존 업로드된 파일 삭제]
				model.dtr.FileUtils.deleteFile(req, "/Image", mr.getParameter("originalfilename"));
			}
			dao.close();
		}
		else sucorfail = -1;
		//5]모델 호출 후 리퀘스트 영역에 결과값 혹은 필요한 값 저장
		//5-1]DB입력 성공 여부 및 파일용량 초과 판단용 속성 저장
		req.setAttribute("SUC_FAIL", sucorfail);
		//5-2]어느 컨트롤러에서 포워드 됐는지 판단용
		req.setAttribute("WHERE", "EDT");
		//6]포워드
		req.getRequestDispatcher("/DrinkList.jsp").forward(req, resp);
		
	}
}
