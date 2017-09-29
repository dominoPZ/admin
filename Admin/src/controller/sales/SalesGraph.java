package controller.sales;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.SalesDAO;

public class SalesGraph extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("page", "Sales");
		
		//파라미터 받기
		//날짜 기간 받기
		String fstDate=req.getParameter("date1");
		String sndDate=req.getParameter("date2");
		// 매장넘버
		String st_no = req.getParameter("stores");

		
		//테스트용
		/*fstDate = "2017-09-01 ";
		sndDate = "2017-09-28 ";
		s_no = "3";
		pizza = "3";*/
		
		///DAO 생성
		SalesDAO dao = new SalesDAO(req.getServletContext());
		//파라미터 여부에 따른 쿼리 분기를 위한 변수
		String whe=""; // where
		
		//날짜를 받았을경우
		if(fstDate!=null && fstDate.length()>0) {
			whe += " AND SA_DATE BETWEEN '"+fstDate+"' AND  to_date('"+sndDate+"','YYYY-MM-DD')+1 ";
		}
		// 매장번호 받았을경우
		if(st_no!=null && st_no.length()>0) {
			whe += " AND ST_NO = '"+st_no+"' ";
		}
		// 반환을 위한 리스트 생성
		//피자용
		List<Map> list = new Vector<>();
		//매장목록용
		List<Map> stores = new Vector<>();
		
		
		//dao 실행 -- 반환 받는 인자 
		// 판매된 피자 호출용 -- 피자명 - name , 수량 - count , 가격 - price
		list = dao.pizzaGraph(whe);
		// 매장 목록 출력용 -- 매장명 - st_name , 매장번호 - st_no
		stores = dao.sotresList("");
		
		// 검색한 매장명 및 번호 출력-- 매장명 - st_name , 매장번호 - st_no
		if(st_no!=null && st_no.length()>0) {
			//바로 리퀘스트 영역에 저장
			Map map = dao.storeOne(st_no);
			req.setAttribute("st_name", map.get("st_name"));
			req.setAttribute("st_no", map.get("st_no"));
		}
		
		///판매된 피자 있는지 여부 확인
		if(list.size()>0) {
			req.setAttribute("emp", "notempty");
		}
		
		//가격별 인지 수량별 인지 체크여부
		if(req.getParameter("radios")!=null) {
			if(req.getParameter("radios").equals("price")) {
				System.out.println(req.getParameter("radios"));
				req.setAttribute("price", "price");
				req.setAttribute("radios", "price");
			}
			else {
				System.out.println(req.getParameter("radios"));
				req.setAttribute("radios", "qty");
			}
		}
		
		dao.close();
		//리퀘스트 영역에 저장
		req.setAttribute("sales", list);
		req.setAttribute("stores", stores);
		req.setAttribute("date1", fstDate);
		req.setAttribute("date2", sndDate);
		
		//반환
		req.getRequestDispatcher("/WEB-INF/Admin/SalesGraph.jsp").forward(req, resp);
		
	}

}
