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

public class SalesGraphMgr extends HttpServlet {
	
	
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
		st_no=req.getSession().getAttribute("Sno").toString();
		///DAO 생성
		SalesDAO dao = new SalesDAO(req.getServletContext());
		//파라미터 여부에 따른 쿼리 분기를 위한 변수
		String whe=""; // where
		
		//날짜를 받았을경우
		if(fstDate!=null && fstDate.length()>0) {
			whe += " AND SA_DATE BETWEEN '"+fstDate+"' AND  to_date('"+sndDate+"','YYYY-MM-DD')+1 ";
		}
		// 매장번호 받았을경우
			whe += " AND ST_NO = '"+st_no+"' ";
			
		// 반환을 위한 리스트 생성
		//피자용
		List<Map> list = new Vector<>();
		//매장목록용
		List<Map> stores = new Vector<>();
		
		//dao 실행 -- 반환 받는 인자 
		// 판매된 피자 호출용 -- 피자명 - name , 수량 - count , 가격 - price
		/// 시간별 검색일 때
		if(req.getParameter("radios")!=null&&req.getParameter("radios").trim().equals("time")) {
			list=dao.timeSales(whe);
			List<Map> list0=new Vector<>();
			List<Map> list9=new Vector<>();
			List<Map> list18=new Vector<>();
			List<Map> list20=new Vector<>();
			List<Map> list22=new Vector<>();
			for(Map map : list) {
				int times = Integer.parseInt(map.get("time").toString().split(":")[0]);
				System.out.println(times+"!");
				if(times>=0 && times<9) {
					list0.add(map);
				}
				else if(times>=9 && times<18) {
					list9.add(map);
				}
				else if(times>=18 && times<20) {
					list18.add(map);
				}
				else if(times>=20 && times<22) {
					list20.add(map);
					
				}
				else if(times>=22) {
					list22.add(map);
				}
			}
			int idx=0;
			int prc=0;
			list = new Vector<>();
			if(list0!=null&&list0.size()!=0)
			list.add(timelist(list0,"00","09"));
			if(list9!=null&&list9.size()!=0)
			list.add(timelist(list9,"09","18"));
			if(list18!=null&&list18.size()!=0)
			list.add(timelist(list18,"18","20"));
			if(list20!=null&&list20.size()!=0)
			list.add(timelist(list20,"20","22"));
			if(list22!=null&&list22.size()!=0)
			list.add(timelist(list22,"22","24"));
		}
		else///// 시간별 검색 외
		list = dao.pizzaGraph(whe);
		// 매장 목록 출력용 -- 매장명 - st_name , 매장번호 - st_no
		stores = dao.sotresList("");

		// 시간별 매출 현황 볼 때
//		String time=req.getParameter("time");
		
		

		
		
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
		
		//가격별 인지 수량별 인지 시간별인지 체크여부
		if(req.getParameter("radios")!=null&&req.getParameter("radios").trim().equals("time"))
		{
			req.setAttribute("price", "price");
			req.setAttribute("time", "time");
		}
		else if(req.getParameter("radios")!=null) {
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
		req.setAttribute("date1", req.getParameter("date1"));
		req.setAttribute("date2", req.getParameter("date2"));
		
		//반환
		req.getRequestDispatcher("/WEB-INF/Mgr/SalesGraph.jsp").forward(req, resp);
		
	}

	Map timelist(List<Map> list,String fr,String sd){
		
		int idx=0;
		int prc=0;
		List<Map> list2 = new Vector<>();
		Map map = new HashMap<>();
		for(Map maps : list) {
			map.put("name", idx==0?"["+fr+":00~"+sd+":00]"+maps.get("name").toString():"["+fr+":00~"+sd+":00]"+maps.get("name")+"외 "+idx+"개");
			map.put("price",
					map.get("price")==null?maps.get("price").toString():
						Integer.parseInt(map.get("price").toString())+
						Integer.parseInt(maps.get("price").toString())
					);
			idx++;
		}
		if(list==null&&list.size()==0)return null;
		return map;
	}
	
	
}
